using System;
using Microsoft.Boogie;
using System.Linq;
using System.Collections.Generic;
using System.Diagnostics;

namespace TraceTransformer
{
    public class SplitType : StandardVisitor
    {
        Program prog;
        Procedure currProc;
        Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> exprTypes;
        Dictionary<Procedure, List<List<string>>> typeConstraints;
        Dictionary<string, int> typeVar2Id;
        Dictionary<int, string> Id2TypeVar;
        List<string> bvOps;
        int idCounter;
        List<HashSet<int>> solsInInt;
        List<HashSet<string>> solsInTv;
        HashSet<string> globals;
        string fakeGlobalProc;
        Dictionary<string, int> mapSizes;
        bool considerBv;
        Dictionary<string, Implementation> implsByName;

        public SplitType(Program prog, Dictionary<string, int> mapSizes)
        {
            this.prog = prog;
            exprTypes = new Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>>();
            typeConstraints = new Dictionary<Procedure, List<List<string>>>();
            typeVar2Id = new Dictionary<string, int>();
            Id2TypeVar = new Dictionary<int, string>();
            solsInTv = new List<HashSet<string>>();
            idCounter = 0;
            bvOps = new List<string>() {"$and", "$or", "$lshr", "$shl", "$xor"};
            globals = new HashSet<string>(prog.Variables.Select(v => v.Name));
            fakeGlobalProc = "$TTGlobal";
            exprTypes[fakeGlobalProc] = new Dictionary<string, Microsoft.Boogie.Type>();
            prog.Variables.Iter(g => exprTypes[fakeGlobalProc][g.Name] = g.TypedIdent.Type);
            this.mapSizes = mapSizes;
            considerBv = true;
            implsByName = new Dictionary<string, Implementation>();
            prog.Implementations.Iter(impl => implsByName[impl.Name] = impl);
        }

        public Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> getTypes()
        {
            return exprTypes;
        }

        public void Run()
        {
            generateConstraints();
            solveConstraints();
            updateExprTypes();
            //showUpdatedTypes();
        }

        public void Solve()
        {
            considerBv = false;
            generateConstraints();
            solveConstraints();
            foreach (var equiv in solsInInt)
            {
                var tvs = new HashSet<string>();
                equiv.Iter(i => tvs.Add(id2Tv(i)));
                solsInTv.Add(tvs);
            }
        }

        public List<HashSet<string>> getSolsInTv()
        {
            return solsInTv;
        }

        public List<HashSet<string>> getSolsInTvFromSolsInInt()
        {
            foreach (var equiv in solsInInt)
            {
                var tvs = new HashSet<string>();
                equiv.Iter(i => tvs.Add(id2Tv(i)));
                solsInTv.Add(tvs);
            }
            //return solsInTv;
            var ret = new List<HashSet<string>>();
            foreach (var equiv in solsInTv)
            {
                var newEquiv = new HashSet<string>();
                foreach (var item in equiv)
                {
                    var proc = getProcNameFromTypeVar(item);
                    var expr = getExprFromTypeVar(item);
                    if (implsByName.Keys.Contains(proc))
                    {
                        var origProc = implsByName[proc].FindStringAttribute("origRTname");
                        newEquiv.Add(expr2TypeVar(expr, origProc));
                    }
                    else
                    {
                        newEquiv.Add(item);
                    }
                }
                ret.Add(newEquiv);
            }
            return ret;
        }

        public void Merge(List<HashSet<string>> New)
        {
            foreach (var equiv in New)
            {
                if (equiv.Contains("BV"))
                {
                    foreach (var oldEquiv in solsInTv)
                    {
                        if (oldEquiv.Contains("BV"))
                            continue;

                        var intersec = oldEquiv.Intersect(equiv);
                        if (intersec.Count() > 0)
                            oldEquiv.Add("BV");
                    }
                }
            }
        }

        public void updateSolsInInt()
        {
            foreach (var solInTy in solsInTv)
            {
                var first = tv2Id(solInTy.First());
                if (solInTy.Contains("BV"))
                {
                    foreach (var solInInt in solsInInt)
                    {
                        if (solInInt.Contains(first))
                            solInInt.Add(-1);
                        else
                            continue;
                    }
                }
            }
        }

        public void generateConstraints()
        {
            //VisitImplementation(sol);
            foreach (var impl in prog.TopLevelDeclarations.OfType<Implementation>())
            {
                VisitImplementation(impl);
            }
            //typeConstraints.Iter(item => printContraints(item.Key));
        }

        public void printContraints(Procedure proc)
        {
            Console.WriteLine("========================" + proc.Name + "========================");
            foreach (var cons in typeConstraints[proc])
            {
                if (cons.Count == 2 && cons.Any(con => isNumber(getExprFromTypeVar(con))))
                    continue;
                else
                    Console.WriteLine(string.Join(", ", cons));
            }
        }

        public void buildVarIdMaps(string tv)
        {
            if (!tv.Equals("BV") && !typeVar2Id.Keys.Contains(tv))
            {
                typeVar2Id[tv] = idCounter;
                Id2TypeVar[idCounter] = tv;
                idCounter++;
            }
        }

        public int tv2Id(string tv)
        {
            if (tv.Equals("BV"))
                return -1;
            else
                return typeVar2Id[tv];
        }

        public string id2Tv(int id)
        {
            if (id == -1)
                return "BV";
            else
                return Id2TypeVar[id];
        }

        public List<List<int>> stringCons2IntCons(List<List<string>> strCons)
        {
            var intCons = new List<List<int>>();
            return intCons;
        }

        public void solveConstraints()
        {
            // let's do it per-proc first
            var allCons = new List<List<int>>();
            foreach (var item in typeConstraints)
            {
                var proc = item.Key;
                var cons = item.Value;
                // build maps from type var to id and vice vera
                foreach (var con in cons)
                {
                    // (proc-expr == proc-1) is not going to help us
                    if (cons.Count == 2 && con.Any(tv => isNumber(getExprFromTypeVar(tv))))
                        continue;
                    //con.Iter(tv => buildVarIdMaps(tv));
                    foreach (var tv in con)
                    {
                        if (isNumber(getExprFromTypeVar(tv)))
                            continue;
                        else
                            buildVarIdMaps(tv);
                    }
                }
                // translate type constraints to numbers
                var newCons = new List<List<int>>();
                //cons.Iter(con => newCons.Add(con.Select(tv => tv2Id(tv)).ToList()));
                foreach (var con in cons)
                {
                    if (cons.Count == 2 && con.Any(tv => isNumber(getExprFromTypeVar(tv))))
                        continue;
                    //newCons.Add(con.Select(tv => tv2Id(tv)).ToList());
                    var newCon = new List<int>();
                    foreach (var tv in con)
                    {
                        if (isNumber(getExprFromTypeVar(tv)))
                            continue;
                        else
                            newCon.Add(tv2Id(tv));
                    }
                    newCons.Add(newCon);
                }
                allCons.AddRange(newCons);
            }
            var ui = new Unifier(allCons);
            solsInInt = ui.Unify();
            //Console.WriteLine("========================solution========================");
            //solsInInt.Iter(s => Console.WriteLine(string.Join(", ", s.Select(ti => id2Tv(ti)))));
        }

        public void updateExprTypes()
        {
            foreach (var cons in solsInInt)
            {
                bool isBV = cons.Contains(-1);
                foreach (var con in cons)
                {
                    if (con == -1)
                        continue;
                    var typeVar = id2Tv(con);
                    var procName = getProcNameFromTypeVar(typeVar);
                    var expr = getExprFromTypeVar(typeVar);
                    if (expr.Contains("[") && expr.Contains("]"))
                    {
                        // pass
                    }
                    else if (expr.StartsWith("$M."))
                    {
                        var map = expr.Split('_')[0];
                        var snd = expr.Split('_')[1];
                        var typeMap = exprTypes[procName];
                        // TODO: check unaligned access
                        if (snd.Equals("val"))
                        {
                            if (isBV && !typeMap[map].AsMap.Result.IsBv)
                            {
                                //var size = mapSizes[map];
                                //if (size == -1)
                                //    typeMap[map].AsMap.Result = Microsoft.Boogie.Type.GetBvType(8);
                                //else
                                //    typeMap[map].AsMap.Result = Microsoft.Boogie.Type.GetBvType(size);
                                typeMap[map].AsMap.Result = Microsoft.Boogie.Type.GetBvType(getIntWidth(typeMap[map].AsMap.Result.ToString()));
                            }
                        }
                    }
                    else if (expr.Contains("_ptr"))
                    {
                        // pass
                    }
                    else if (expr.Contains("_val"))
                    {
                        // pass
                    }
                    else if (!expr.Contains(".") || globals.Contains(expr))
                    {
                        // this expr is a varaible
                        Dictionary<string, Microsoft.Boogie.Type> typeMap;
                        if (exprTypes.Keys.Contains(procName))
                            typeMap = exprTypes[procName];
                        else
                        {
                            typeMap = new Dictionary<string, Microsoft.Boogie.Type>();
                            var p = prog.Procedures.Where(proc => proc.Name.Equals(procName)).First();
                            foreach (var inP in p.InParams)
                            {
                                typeMap[inP.Name] = inP.TypedIdent.Type;
                            }
                            foreach (var outP in p.OutParams)
                            {
                                typeMap[outP.Name] = outP.TypedIdent.Type;
                            }
                            exprTypes[procName] = typeMap;
                        }
                        if (isBV && !typeMap[expr].IsBv)
                        {
                            typeMap[expr] = Microsoft.Boogie.Type.GetBvType(getIntWidth(typeMap[expr].ToString()));
                        }
                    }
                    else
                    {
                        // this expr is a function application
                        var typeMap = exprTypes[procName];
                        if (isBV && (!typeMap.Keys.Contains(expr) || !typeMap[expr].IsBv))
                        {
                            var funcName = expr.Split('(')[0].Split('.')[0];
                            string rt;
                            int length;
                            // ext/trunc functions
                            if (funcName.Equals("$sext") || funcName.Equals("$zext") || funcName.Equals("$trunc"))
                            {
                                rt = expr.Split('(')[0].Split('.')[2];
                                length = getIntWidth(rt);
                            }
                            else
                            {
                                rt = expr.Split('(')[0].Split('.')[1];
                                length = getIntWidth(rt);
                            }
                            typeMap[expr] = Microsoft.Boogie.Type.GetBvType(length);
                        }
                        else
                        {
                            typeMap[expr] = Microsoft.Boogie.Type.Int;
                        }
                    }
                }
            }
        }

        public void showUpdatedTypes()
        {
            foreach (var item in exprTypes)
            {
                var procName = item.Key;
                var typeMap = item.Value;
                Console.WriteLine("**************************" + procName + "**************************");
                typeMap.Iter(tm => Console.WriteLine(tm.Key + ": " + tm.Value.ToString()));
            }
        }

        public string expr2TypeVar(Expr e, string proc, bool isGlobal = false)
        {
            return expr2TypeVar(e.ToString(), proc, isGlobal);
        }

        public string expr2TypeVar(string e, string proc, bool isGlobal = false)
        {
            if (globals.Contains(e) || isGlobal)
                return fakeGlobalProc + "-" + e;
            else
                return proc + "-" + e;
        }

        public string getExprFromTypeVar(string tv)
        {
            if (tv.Equals("BV"))
                return tv;
            else
                return tv.Split('-')[1];
        }

        public string getProcNameFromTypeVar(string tv)
        {
            return tv.Split('-')[0];
        }

        public bool isNumber(string e)
        {
            double tmp;
            if (double.TryParse(e, out tmp))
                return true;
            else
                return false;
        }

        public int getIntWidth(string t)
        {
            int length = -1;
            if (!int.TryParse(t.Split('i')[1], out length))
            {
                Console.WriteLine("Cannot parse type: " + t);
            }
            return length;
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            Dictionary<string, Microsoft.Boogie.Type> varInitTypes = new Dictionary<string, Microsoft.Boogie.Type>();
            exprTypes[node.Proc.Name] = varInitTypes;
            currProc = node.Proc;
            typeConstraints[currProc] = new List<List<string>>();
            foreach (var varDecl in node.LocVars)
            {
                varInitTypes[varDecl.Name] = varDecl.TypedIdent.Type;
            }
            foreach (var param in node.InParams)
            {
                varInitTypes[param.Name] = param.TypedIdent.Type;
            }
            foreach (var ret in node.OutParams)
            {
                varInitTypes[ret.Name] = ret.TypedIdent.Type;
            }
            //Console.WriteLine(string.Join(",\t", varInitTypes.Keys));
            //Console.WriteLine(string.Join(",\t", varInitTypes.Values));
            return base.VisitImplementation(node);
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            foreach (var assign in node.Lhss.Zip(node.Rhss, Tuple.Create))
            {
                var lhs = assign.Item1;
                var rhs = assign.Item2;
                if (rhs is NAryExpr && (rhs as NAryExpr).Fun.FunctionName.StartsWith("$load"))
                {
                    var loadFunc = rhs as NAryExpr;
                    var map = loadFunc.Args[0];
                    var ptr = loadFunc.Args[1];
                    var val = lhs.AsExpr;
                    // v := M[p]
                    // ---------
                    // v <-> M_val
                    // p <-> M_ptr
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(map.ToString() + "_ptr", currProc.Name, true), expr2TypeVar(ptr, currProc.Name) });
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(map.ToString() + "_val", currProc.Name, true), expr2TypeVar(val, currProc.Name) });
                    VisitExpr(ptr);
                    VisitExpr(val);
                }
                else if (rhs is NAryExpr && (rhs as NAryExpr).Fun.FunctionName.StartsWith("$store"))
                {
                    var storeFunc = rhs as NAryExpr;
                    var map = storeFunc.Args[0];
                    var ptr = storeFunc.Args[1];
                    var val = storeFunc.Args[2];
                    // M := M[p := v]
                    // --------------
                    // v <-> M_val
                    // p <-> M_ptr
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(map.ToString() + "_ptr", currProc.Name, true), expr2TypeVar(ptr, currProc.Name) });
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(map.ToString() + "_val", currProc.Name, true), expr2TypeVar(val, currProc.Name) });
                    VisitExpr(ptr);
                    VisitExpr(val);
                }
                else
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(lhs.AsExpr, currProc.Name), expr2TypeVar(rhs, currProc.Name) });
                    VisitExpr(rhs);
                }
                VisitExpr(lhs.AsExpr);

            }
            return node;
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            // get callee
            Procedure callee = prog.TopLevelDeclarations.OfType<Procedure>().Where(p => p.Name.Equals(node.callee)).FirstOrDefault();
            foreach (var pair in node.Ins.Zip(callee.InParams))
            {
                var arg = pair.Item1;
                var param = pair.Item2;
                if (param.TypedIdent.Type.IsMap)
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(arg.ToString() + "_ptr", currProc.Name, true), expr2TypeVar(param.Name + "_ptr", callee.Name) });
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(arg.ToString() + "_val", currProc.Name, true), expr2TypeVar(param.Name + "_val", callee.Name) });
                }
                else
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(arg, currProc.Name), expr2TypeVar(param.Name, callee.Name) });
                }
            }
            foreach (var pair in node.Outs.Zip(callee.OutParams))
            {
                var cRet = pair.Item1;
                var pRet = pair.Item2;
                if (pRet.TypedIdent.Type.IsMap)
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(cRet.ToString() + "_ptr", currProc.Name, true), expr2TypeVar(pRet.Name + "_ptr", callee.Name) });
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(cRet.ToString() + "_val", currProc.Name, true), expr2TypeVar(pRet.Name + "_val", callee.Name) });
                }
                else
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(cRet, currProc.Name), expr2TypeVar(pRet.Name, callee.Name) });
                }
            }
            return base.VisitCallCmd(node);
        }

        public override Expr VisitExpr(Expr node)
        {
            if (node is NAryExpr)
            {
                var e = node as NAryExpr;
                if (considerBv && bvOps.Contains(e.Fun.FunctionName.Split('.')[0]) && !e.Fun.FunctionName.Split('.')[1].Equals("i1"))
                {
                    foreach (var arg in e.Args)
                    {
                        typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(arg, currProc.Name), "BV" });
                    }
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(e, currProc.Name), "BV" });
                }
                else if (e.Fun.FunctionName.Equals("!") || e.Fun.FunctionName.Equals("&&") || e.Fun.FunctionName.Equals("||") || e.Fun.FunctionName.Equals("==>"))
                {
                    // pass
                }
                //else if (e.Fun.FunctionName.Equals("==") || e.Fun.FunctionName.Split('.')[0].Equals("$eq") || e.Fun.FunctionName.Split('.')[0].Equals("$ne"))
                else if (e.Fun.FunctionName.Equals("==") || e.Fun.FunctionName.Equals("!="))
                {
                    typeConstraints[currProc].Add(e.Args.Select(arg => expr2TypeVar(arg, currProc.Name)).ToList());
                }
                else if (e.Fun.FunctionName.Equals("MapSelect"))
                {
                    typeConstraints[currProc].Add(new List<string>() { expr2TypeVar(e, currProc.Name), expr2TypeVar(e.Args[0].ToString() + "_val", currProc.Name) });
                }
                else
                {
                    var exprCons = e.Args.Select(arg => expr2TypeVar(arg, currProc.Name)).ToList();
                    exprCons.Add(expr2TypeVar(e, currProc.Name));
                    typeConstraints[currProc].Add(exprCons);
                }
                foreach (var arg in e.Args)
                {
                    VisitExpr(arg);
                }
            }
            else if (node is QuantifierExpr)
            {
                var e = node as QuantifierExpr;
                VisitExpr(e.Body);
            }
            return node;
        }
    }
}
