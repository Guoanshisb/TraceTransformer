using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Boogie;

namespace TraceTransformer
{
    public class Rewritter : StandardVisitor
    {
        Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> expTypes;
        Program prog;
        string outputProg;
        Dictionary<string, Microsoft.Boogie.Type> procTypes;
        HashSet<string> globals;
        int refWidth;

        public Rewritter(Program prog, Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> expTypes, string outputProg)
        {
            this.prog = prog;
            this.expTypes = expTypes;
            this.outputProg = outputProg;
            globals = new HashSet<string>(prog.Variables.Select(g => g.Name));
            refWidth = getRefWidth();
        }

        public int getRefWidth()
        {
            var typeSyn = prog.TopLevelDeclarations.OfType<TypeSynonymDecl>().Where(ts => ts.Name.Equals("ref")).FirstOrDefault();
            return TTUtil.getWidthFromType(typeSyn.Body.ToString());
        }

        public int getWidthFromType(string type)
        {
            if (type.Equals("ref"))
                return refWidth;
            else
                return TTUtil.getWidthFromType(type);
        }

        public void Rewrite()
        {
            foreach (var item in expTypes)
            {
                var procName = item.Key;
                var types = item.Value;
                var impls = prog.TopLevelDeclarations.OfType<Implementation>().Where(impl => impl.Name.Equals(procName));
                if (impls.Count() == 0)
                    continue;
                else if (impls.First().Name.StartsWith("$memset") || impls.First().Name.StartsWith("$memcpy"))
                    continue;
                else
                    RewriteImpl(impls.First(), types);
            }
            foreach (var g in prog.Variables)
            {
                g.TypedIdent.Type = expTypes["$TTGlobal"][g.Name];
            }
            TTUtil.PrintProgram(prog, outputProg);

        }

        public void RewriteImpl(Implementation p, Dictionary<string, Microsoft.Boogie.Type> types)
        {
            // rewrite local declarations first
            foreach (var localVar in p.LocVars)
            {
                localVar.TypedIdent = new TypedIdent(Token.NoToken, localVar.Name, types[localVar.Name]);
            }
            // rewrite ins and outs
            foreach (var pair in p.InParams.Zip(p.Proc.InParams))
            {
                var mInP = pair.Item1;
                var pInP = pair.Item2;
                if (types.Keys.Contains(mInP.Name))
                {
                    mInP.TypedIdent.Type = types[mInP.Name];
                    pInP.TypedIdent.Type = types[pInP.Name];
                }
            }
            foreach (var pair in p.OutParams.Zip(p.Proc.OutParams))
            {
                var mOutP = pair.Item1;
                var pOutP = pair.Item2;
                if (types.Keys.Contains(mOutP.Name))
                {
                    mOutP.TypedIdent.Type = types[mOutP.Name];
                    pOutP.TypedIdent.Type = types[pOutP.Name];
                }
            }
            procTypes = types;
            VisitImplementation(p);
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            Procedure callee = prog.TopLevelDeclarations.OfType<Procedure>().Where(p => p.Name.Equals(node.callee)).FirstOrDefault();
            Implementation impl = prog.Implementations.Any(i => i.Name.Equals(callee.Name)) ? prog.Implementations.Where(i => i.Name.Equals(callee.Name)).First() : null;
            bool isMemCpyOrMemset = callee.Name.StartsWith("$memcpy") || callee.Name.StartsWith("$memset");
            foreach (var pair in node.Ins.Zip(callee.InParams))
            {
                var arg = pair.Item1;
                var param = pair.Item2;
                // TODO: arg is a literal
                //if (procTypes.Keys.Contains(callee.Name + "_" + param.Name) && !procTypes[callee.Name + "_" + param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                //{
                //    param.TypedIdent.Type = procTypes[callee.Name + "_" + param.Name];
                //}
                if (param.TypedIdent.Type.IsMap)
                {
                    var argType = getType(arg.ToString());
                    if (!argType.ToString().Equals(param.TypedIdent.Type.ToString()))
                    {
                        param.TypedIdent.Type = argType;
                    }
                }
                else if (!isMemCpyOrMemset && expTypes.Keys.Contains(callee.Name) && !expTypes[callee.Name][param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                    param.TypedIdent.Type = expTypes[callee.Name][param.Name];
                else if (isMemCpyOrMemset && param.Name.Equals("val"))
                {
                    var mapResType = getType(node.Ins[0].ToString()).AsMap.Result;
                    if (!expTypes[callee.Name][param.Name].ToString().Equals(mapResType.ToString()))
                    {
                        param.TypedIdent.Type = mapResType;
                        expTypes[callee.Name][param.Name] = callee.InParams[0].TypedIdent.Type.AsMap.Result;
                    }

                    if (procTypes.Keys.Contains(arg.ToString()) && !getType(arg.ToString()).ToString().Equals(mapResType.ToString()))
                        procTypes[arg.ToString()] = mapResType;

                    if (!param.TypedIdent.Type.ToString().Equals(mapResType.ToString()))
                        param.TypedIdent.Type = mapResType;
                }
            }
            List<Expr> newIns = new List<Expr>();
            for (int i = 0; i < node.Ins.Count; ++i)
            {
                var arg = node.Ins[i];
                var param = callee.InParams[i];
                newIns.Add(arg);
                if (TTUtil.isNumber(arg))
                {
                    if (expTypes.Keys.Contains(callee.Name) && expTypes[callee.Name][param.Name].ToString().Contains("bv"))
                    {
                        if (!(isMemCpyOrMemset && param.TypedIdent.Type.ToString().Equals("ref")))
                            newIns[i] = TTUtil.intLit2bvLit(arg, getWidthFromType(expTypes[callee.Name][param.Name].ToString()));
                    }
                }
                else if (isMemCpyOrMemset && param.TypedIdent.Type.ToString().Equals("ref") && getType(arg.ToString()).IsBv)
                {
                    newIns[i] = new NAryExpr(Token.NoToken,
                            new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(f => f.Name.StartsWith("$bv2int")).FirstOrDefault()),
                            new List<Expr>() { arg });
                }
            }
            node.Ins = newIns;
            foreach (var pair in node.Outs.Zip(callee.OutParams))
            {
                var arg = pair.Item1;
                var param = pair.Item2;
                if (param.TypedIdent.Type.IsMap)
                {
                    var argType = getType(arg.ToString());
                    if (!argType.ToString().Equals(param.TypedIdent.Type.ToString()))
                    {
                        param.TypedIdent.Type = argType;
                    }
                } else if (expTypes.Keys.Contains(callee.Name) && !expTypes[callee.Name][param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                    param.TypedIdent.Type = expTypes[callee.Name][param.Name];
            }
            if (impl != null)
            {
                foreach (var pair in callee.InParams.Zip(impl.InParams))
                {
                    var procParam = pair.Item1;
                    var implParam = pair.Item2;
                    if (!procParam.TypedIdent.Type.ToString().Equals(implParam.TypedIdent.Type.ToString()))
                        implParam.TypedIdent.Type = procParam.TypedIdent.Type;
                }
                foreach (var pair in callee.OutParams.Zip(impl.OutParams))
                {
                    var procParam = pair.Item1;
                    var implParam = pair.Item2;
                    if (!procParam.TypedIdent.Type.ToString().Equals(implParam.TypedIdent.Type.ToString()))
                        implParam.TypedIdent.Type = procParam.TypedIdent.Type;
                }
            }
            for (int i = 0; i < node.Ins.Count; ++i)
                node.Ins[i] = VisitExpr(node.Ins[i]);

            return node;
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            List<Expr> newRhss = new List<Expr>();
            for (int i = 0; i < node.Lhss.Count; ++i)
            {
                var lhs = node.Lhss[i];
                var rhs = node.Rhss[i];
                newRhss.Add(rhs);
                if (TTUtil.isNumber(rhs))
                {
                    if (getType(lhs.AsExpr.ToString()).ToString().Contains("bv"))
                    {
                        newRhss[i] = TTUtil.intLit2bvLit(rhs, getWidthFromType(getType(lhs.AsExpr.ToString()).ToString()));
                    }
                }
            }
            node.Rhss = newRhss;
            return base.VisitAssignCmd(node);
        }

        public override Expr VisitNAryExpr(NAryExpr node)
        {
            if (node.Fun.FunctionName == "==" || node.Fun.FunctionName == "!=")
            {
                if (node.Args.Any(arg => arg is LiteralExpr && !(arg as LiteralExpr).isBool))
                {
                    int noLit = 0;
                    int lit = 1;
                    if (node.Args[noLit] is LiteralExpr)
                    {
                        noLit = 1;
                        lit = 0;
                    }
                    if (node.Args[noLit] is LiteralExpr)
                        return node;
                    if (!getType(node.Args[noLit].ToString()).ToString().Contains("bv"))
                        return node;
                    node.Args[lit] = TTUtil.intLit2bvLit(node.Args[lit],
                        getWidthFromType(getType(node.Args[noLit].ToString()).ToString()));
                    VisitExpr(node.Args[noLit]);
                    return node;
                }
            }
            else if (node.Fun.FunctionName.Contains("$"))
            {
                bool bv = false;
                if (node.Fun.FunctionName.Contains("$bv2int"))
                {
                    for (int i = 0; i < node.Args.Count; ++i)
                        node.Args[i] = VisitExpr(node.Args[i]);
                    return node;
                }
                bool isLoadStore = node.Fun.FunctionName.Contains("$load") || node.Fun.FunctionName.Contains("$store");
                if (isLoadStore)
                {
                    bv = getType(node.Args[0].ToString()).AsMap.Result.IsBv;
                }
                else
                {
                    bv = getType(node.ToString()).ToString().Contains("bv");
                }

                if (!bv && !isLoadStore)
                    return node;

                var funcName = node.Fun.FunctionName.Split('(')[0];
                var inputType = funcName.Split('.')[1];

                for (int i = 0; i < node.Args.Count; ++i)
                {
                    var arg = node.Args[i];
                    if (!(isLoadStore && i == 1) && bv && TTUtil.isNumber(arg))
                    {
                        int size = getWidthFromType(inputType);
                        node.Args[i] = TTUtil.intLit2bvLit(arg, size);
                        continue;
                    }

                    if (isLoadStore && i == 1 && !(arg is LiteralExpr))
                    {
                        if (procTypes.Keys.Contains(arg.ToString()) && getType(arg.ToString()).IsBv)
                        { node.Args[i] = new NAryExpr(Token.NoToken,
                            new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(f => f.Name.StartsWith("$bv2int")).FirstOrDefault()),
                            new List<Expr>() { arg });
                        }
                    }

                    if (!bv && isLoadStore)
                        node.Args[i] = VisitExpr(node.Args[i]);
                }

                if (!bv)
                    return node;

                if (node.Fun.FunctionName.Equals("$i2p.i64.ref") || node.Fun.FunctionName.Equals("$i2p.i32.ref") || node.Fun.FunctionName.Equals("$p2i.ref.i64") || node.Fun.FunctionName.Equals("$bitcast.ref.ref"))
                    return VisitExpr(node.Args[0]);
                if (node.Fun.FunctionName.Equals("$p2i.ref.i32"))
                {
                    if (refWidth == 64)
                    {
                        var newArgs = new List<Expr>() { VisitExpr(node.Args[0]) };
                        return new NAryExpr(Token.NoToken, new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(func => func.Name.Equals("$trunc.bv64.bv32")).FirstOrDefault()), newArgs);
                    }
                    else
                    {
                        return VisitExpr(node.Args[0]);
                    }
                }
                // build a bv expression
                var bvFuncName = string.Join(".", funcName.Split('.').Select(elem => !elem.Contains("$") && !elem.Contains("bool")? "bv" + elem.Substring("i".Length) : elem));
                if (!isLoadStore && node.Fun.FunctionName.Split('.').Any(s => s.Contains("ef")))
                    bvFuncName = string.Join(".", bvFuncName.Split('.').Select(s => s.Contains("ef")? "bv"+refWidth : s));
                else if (node.Fun.FunctionName.Contains("$load") || node.Fun.FunctionName.Contains("$store"))
                {
                    var mapSize = getType(node.Args[0].ToString()).AsMap.Result.BvBits;
                    int opSize = getWidthFromType(inputType);
                    //if (inputType.Equals("ref"))
                    //    opSize = 64;
                    //else if (int.TryParse(inputType.Substring("i".Length), out opSize))
                    //{
                    //    //pass
                    //}
                    //else
                    //{
                    //    Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                    //}
                    if (mapSize != opSize)
                        bvFuncName = bvFuncName.Split('.')[0] + ".bytes." + "bv" + opSize;
                    else
                        bvFuncName = bvFuncName.Split('.')[0] + ".bv" + opSize;
                }
                node = new NAryExpr(Token.NoToken, new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(func => func.Name.Equals(bvFuncName)).FirstOrDefault()), node.Args);

                for (int i = 0; i < node.Args.Count; ++i)
                    node.Args[i] = VisitExpr(node.Args[i]);
                return node;
            }

            return base.VisitNAryExpr(node);
        }

        public Microsoft.Boogie.Type getType(string e)
        {
            if (globals.Contains(e))
                return expTypes["$TTGlobal"][e];
            else
                return procTypes[e];
        }
    }
}
