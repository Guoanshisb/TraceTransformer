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
        Implementation entryPoint;
        Procedure currProc;
        Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>> expTypes;
        Dictionary<Procedure, List<List<string>>> typeConstraints;
        List<string> bvOps;
        Dictionary<Procedure, List<HashSet<string>>> typeSolutions;

        public SplitType(Program prog, string entryPoint)
        {
            this.prog = prog;
            this.entryPoint = prog.TopLevelDeclarations.OfType<Implementation>().Where(impl => impl.Name == entryPoint).FirstOrDefault();
            this.expTypes = new Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>>();
            this.typeConstraints = new Dictionary<Procedure, List<List<string>>>();
            bvOps = new List<string>() {"$and", "$or", "$lshr", "$shl", "$xor"};
            this.typeSolutions = new Dictionary<Procedure, List<HashSet<string>>>();
        }

        public Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>> getTypes()
        {
            return expTypes;
        }

        public void Run()
        {
            generateConstraints();
            solveConstraints();
            showResultTypes();
        }

        public void generateConstraints()
        {
            //VisitImplementation(entryPoint);
            foreach (var impl in prog.TopLevelDeclarations.OfType<Implementation>())
            {
                if (impl.InParams.Count == 0 && impl.OutParams.Count == 0)
                    continue;
                else
                    VisitImplementation(impl);
            }
        }

        public void solveConstraints()
        {
            foreach (var item in typeConstraints)
            {
                var procCons = item.Value;
                var proc = item.Key;
                var procSolutions = new List<HashSet<string>>();
                typeSolutions[proc] = procSolutions;

                Func<string, int> findSet = delegate (string t)
                {
                    for (int i = 0; i < procSolutions.Count; ++i)
                    {
                        if (procSolutions[i].Equals("BV"))
                            continue;
                        if (procSolutions[i].Contains(t))
                            return i;
                    }
                    return -1;
                };

                foreach (var singleCons in procCons)
                {
                    double n;
                    if (singleCons.Count == 2 && singleCons.Any(cons => double.TryParse(cons, out n)))
                        continue;
                    Dictionary<string, int> groupId = new Dictionary<string, int>();
                    foreach (var tc in singleCons)
                    {
                        if (!tc.Equals("BV"))
                            groupId[tc] = findSet(tc);
                    }

                    // create a group needed
                    if (groupId.Values.All(id => id == -1))
                    {
                        var group = new HashSet<string>();
                        procSolutions.Add(group);
                        foreach (var tc in singleCons)
                        {
                            if (double.TryParse(tc, out n))
                                continue;
                            else
                                group.Add(tc);
                        }
                    }
                    else
                    {
                        HashSet<int> ids = new HashSet<int>(groupId.Values.Where(id => id != -1));
                        if (ids.Count == 1)
                        {
                            var group = procSolutions.ElementAt(ids.First());
                            foreach (var tc in singleCons)
                            {
                                if (double.TryParse(tc, out n))
                                    continue;
                                else
                                    group.Add(tc);
                            }
                        }
                        else
                        {
                            // merge lists
                            HashSet<string> merged = new HashSet<string>();
                            List<HashSet<string>> newList = new List<HashSet<string>>();
                            foreach (var id in ids)
                            {
                                merged.UnionWith(new HashSet<string>(procSolutions.ElementAt(id)));
                            }
                            foreach (var tc in singleCons)
                            {
                                if (double.TryParse(tc, out n))
                                    continue;
                                else
                                    merged.Add(tc);
                            }
                            for (int i = 0; i < procSolutions.Count; ++i)
                            {
                                if (!ids.Contains(i))
                                    newList.Add(new HashSet<string>(procSolutions.ElementAt(i)));
                            }
                            newList.Add(merged);
                            procSolutions = newList;
                            typeSolutions[proc] = procSolutions;
                        }
                    }
                }
            }
            // find if param/return is bv
            HashSet<string> bvParams = new HashSet<string>();
            HashSet<string> oldBvParams = new HashSet<string>();

            do
            {
                oldBvParams = new HashSet<string>(bvParams);
                foreach (var item in typeSolutions)
                {
                    var proc = item.Key;
                    var types = item.Value;
                    foreach (var tc in types)
                    {
                        var ios = tc.Where(t => t.Contains('_'));
                        if (ios.Count() == 0)
                            continue;
                        else
                        {
                            if (tc.Contains("BV"))
                            {
                                bvParams.UnionWith(ios);
                            }
                            else
                            {
                                continue;
                            }
                        }
                    }
                }
                // update the solution
                foreach (var item in typeSolutions)
                {
                    var proc = item.Key;
                    var types = item.Value;
                    HashSet<string> bvIns = new HashSet<string>();
                    HashSet<string> bvOuts = new HashSet<string>();

                    foreach (var inP in proc.InParams)
                    {
                        if (bvParams.Contains(proc.Name + "_" + inP.Name))
                            bvIns.Add(inP.Name);
                    }

                    foreach (var outP in proc.OutParams)
                    {
                        if (bvParams.Contains(proc.Name + "_" + outP.Name))
                            bvOuts.Add(outP.Name);
                    }

                    foreach (var tc in types)
                    {
                        if (tc.Any(t => bvParams.Contains(t) || bvIns.Contains(t) || bvOuts.Contains(t)))
                            tc.Add("BV");
                    }
                    var bvEs = new HashSet<string>();
                    //bvEs.UnionWith(bvParams);
                    bvEs.UnionWith(bvIns);
                    bvEs.UnionWith(bvOuts);

                    foreach (var bvE in bvEs)
                    {
                        bool has = false;
                        foreach (var tc in types)
                        {
                            if (tc.Any(t => bvEs.Contains(t)))
                            {
                                //tc.Add("BV");
                                has = true;
                            }
                        }
                        if (!has)
                        {
                            types.Add(new HashSet<string>() { bvE, "BV" });
                        }
                    }
                }               
            } while (!bvParams.SetEquals(oldBvParams));

        }

        public void showResultTypes()
        {
            foreach (var item in typeSolutions)
            {
                var proc = item.Key;
                var procSols = item.Value;
                var types = expTypes[proc];
                Console.WriteLine("************************************************************************");
                foreach (var group in procSols)
                {
                    Console.WriteLine(string.Join(", ", group));
                    bool bv = false;
                    if (group.Contains("BV"))
                        bv = true;
                    foreach (var tc in group)
                    {
                        if (tc.Equals("BV"))
                            continue;
                        if (!tc.Contains("."))
                        {
                            // vars
                            if (bv)
                            {
                                int length = getIntWidth(types[tc].ToString());
                                if (length != -1)
                                {
                                    types[tc] = Microsoft.Boogie.Type.GetBvType(length);
                                }
                            }
                        }
                        else
                        {
                            // exprs
                            if (bv)
                            {
                                var funcName = tc.Split('(')[0].Split('.')[0];
                                string rt;
                                int length;
                                // ext/trunc functions
                                if (funcName.Equals("$sext") || funcName.Equals("$zext") || funcName.Equals("$trunc"))
                                {
                                    rt = tc.Split('(')[0].Split('.')[2];
                                    length = getIntWidth(rt);
                                }
                                else
                                {
                                    rt = tc.Split('(')[0].Split('.')[1];
                                    length = getIntWidth(rt);
                                }
                                if (length != -1)
                                {
                                    types[tc] = Microsoft.Boogie.Type.GetBvType(length);
                                }
                            }
                            else
                            {
                                types[tc] = Microsoft.Boogie.Type.Int;
                            }
                        }
                    }
                }
            }
            foreach (var tuple in expTypes)
            {
                var types = tuple.Value;
                var proc = tuple.Key;
                Console.WriteLine("**********************************" + proc + "**************************************");
                foreach (var item in types)
                {
                    var exp = item.Key;
                    var ty = item.Value.ToString();
                    Console.WriteLine(exp + ": " + ty);
                }
            }
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
            expTypes[node.Proc] = varInitTypes;
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
                typeConstraints[currProc].Add(new List<string>() { lhs.AsExpr.ToString(), rhs.ToString() });
                VisitExpr(lhs.AsExpr);
                VisitExpr(rhs);
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
                expTypes[currProc][callee.Name + "_" + param.Name] = param.TypedIdent.Type;
                typeConstraints[currProc].Add(new List<string>() { arg.ToString(), callee.Name + "_" + param.Name });
            }
            foreach (var pair in node.Outs.Zip(callee.OutParams))
            {
                var cRet = pair.Item1;
                var pRet = pair.Item2;
                expTypes[currProc][callee.Name + "_" + pRet.Name] = pRet.TypedIdent.Type;
                typeConstraints[currProc].Add(new List<string>() { cRet.Name, callee.Name + "_" + pRet.Name });
            }
            return base.VisitCallCmd(node);
        }

        public override Expr VisitExpr(Expr node)
        {
            if (node is NAryExpr)
            {
                var e = node as NAryExpr;
                if (bvOps.Contains(e.Fun.FunctionName.Split('.')[0]))
                {
                    foreach (var arg in e.Args)
                    {
                        typeConstraints[currProc].Add(new List<string>() { arg.ToString(), "BV" });
                    }
                    typeConstraints[currProc].Add(new List<string>() { e.ToString(), "BV" });
                }
                else if (e.Fun.FunctionName.Equals("!"))
                {
                    // recurse
                }
                //else if (e.Fun.FunctionName.Equals("==") || e.Fun.FunctionName.Split('.')[0].Equals("$eq") || e.Fun.FunctionName.Split('.')[0].Equals("$ne"))
                else if (e.Fun.FunctionName.Equals("==") || e.Fun.FunctionName.Equals("!="))
                {
                    typeConstraints[currProc].Add(e.Args.Select(arg => arg.ToString()).ToList());
                }
                else
                {
                    var exprCons = e.Args.Select(arg => arg.ToString()).ToList();
                    exprCons.Add(e.ToString());
                    typeConstraints[currProc].Add(exprCons);
                }
                foreach (var arg in e.Args)
                {
                    VisitExpr(arg);
                }
            }
            return node;
        }
    }
}
