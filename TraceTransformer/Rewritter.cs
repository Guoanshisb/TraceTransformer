using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Boogie;
using cba.Util;

namespace TraceTransformer
{
    public class Rewritter : StandardVisitor
    {
        Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> expTypes;
        Program prog;
        string outputProg;
        Dictionary<string, Microsoft.Boogie.Type> procTypes;
        HashSet<string> globals;

        public Rewritter(Program prog, Dictionary<string, Dictionary<string, Microsoft.Boogie.Type>> expTypes, string outputProg)
        {
            this.prog = prog;
            this.expTypes = expTypes;
            this.outputProg = outputProg;
            globals = new HashSet<string>(prog.Variables.Select(g => g.Name));
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
                else
                    RewriteImpl(impls.First(), types);
            }
            foreach (var g in prog.Variables)
            {
                g.TypedIdent.Type = expTypes["$TTGlobal"][g.Name];
            }
            BoogieUtil.PrintProgram(prog, outputProg);

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
            foreach (var pair in node.Ins.Zip(callee.InParams))
            {
                var arg = pair.Item1;
                var param = pair.Item2;
                // TODO: arg is a literal
                //if (procTypes.Keys.Contains(callee.Name + "_" + param.Name) && !procTypes[callee.Name + "_" + param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                //{
                //    param.TypedIdent.Type = procTypes[callee.Name + "_" + param.Name];
                //}
                if (expTypes.Keys.Contains(callee.Name) && !expTypes[callee.Name][param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                    param.TypedIdent.Type = expTypes[callee.Name][param.Name];
            }
            foreach (var pair in node.Outs.Zip(callee.OutParams))
            {
                var arg = pair.Item1;
                var param = pair.Item2;
                if (expTypes.Keys.Contains(callee.Name) && !expTypes[callee.Name][param.Name].ToString().Equals(param.TypedIdent.Type.ToString()))
                    param.TypedIdent.Type = expTypes[callee.Name][param.Name];
            }
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
                if (rhs is LiteralExpr && (rhs as LiteralExpr).isBigNum)
                {
                    if (getType(lhs.AsExpr.ToString()).ToString().Contains("bv"))
                    {
                        int width;
                        if (int.TryParse(getType(lhs.AsExpr.ToString()).ToString().Substring("bv".Length), out width))
                        {
                            newRhss[i] = (new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromString(node.Rhss[i].ToString()), width));
                        }
                        else
                        {
                            Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                        }
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
                    int width;
                    if (int.TryParse(getType(node.Args[noLit].ToString()).ToString().Substring("bv".Length), out width))
                    {
                        node.Args[lit] = new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromString(node.Args[lit].ToString()), width);
                    }
                    else
                    {
                        Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                    }
                    VisitExpr(node.Args[noLit]);
                    return node;
                }
            }
            else if (node.Fun.FunctionName.Contains("$"))
            {
                bool bv = false;
                if (node.Fun.FunctionName.Contains("$load") || node.Fun.FunctionName.Contains("$store"))
                {
                    bv = getType(node.Args[0].ToString()).AsMap.Result.IsBv;
                }
                else
                {
                    bv = getType(node.ToString()).ToString().Contains("bv");
                }
                if (!bv)
                    return node;
                var funcName = node.Fun.FunctionName.Split('(')[0];
                var inputType = funcName.Split('.')[1];

                for (int i = 0; i < node.Args.Count; ++i)
                {
                    var arg = node.Args[i];
                    if (arg is LiteralExpr && !(arg as LiteralExpr).isBool)
                    {
                        int width;
                        if (int.TryParse(inputType.Substring("i".Length), out width))
                        {
                            node.Args[i] = new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromString(arg.ToString()), width);
                        }
                        else
                        {
                            Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                        }
                    }
                }

                // build a bv expression
                var bvFuncName = string.Join(".", funcName.Split('.').Select(elem => !elem.Contains("$") ? "bv" + elem.Substring("i".Length) : elem));
                if (node.Fun.FunctionName.Contains("$load") || node.Fun.FunctionName.Contains("$store"))
                {
                    var mapSize = getType(node.Args[0].ToString()).AsMap.Result.BvBits;
                    int opSize;
                    if (int.TryParse(inputType.Substring("i".Length), out opSize))
                    {
                        if (mapSize != opSize)
                            bvFuncName = bvFuncName.Split('.')[0] + ".bytes." + bvFuncName.Split('.')[1];
                    }
                    else
                    {
                        Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                    }
                }
                node = new NAryExpr(Token.NoToken, new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(func => func.Name.Equals(bvFuncName)).FirstOrDefault()), node.Args);
                //node.Args.Iter(se => VisitExpr(se));
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
