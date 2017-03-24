using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Boogie;
using cba.Util;

namespace TraceTransformer
{
    public class Rewritter : StandardVisitor
    {
        Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>> expTypes;
        Program prog;
        string outputProg;
        Dictionary<string, Microsoft.Boogie.Type> procTypes;

        public Rewritter(Program prog, Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>> expTypes, string outputProg)
        {
            this.prog = prog;
            this.expTypes = expTypes;
            this.outputProg = outputProg;
        }

        public void Rewrite()
        {
            foreach (var item in expTypes)
            {
                var proc = item.Key;
                var types = item.Value;
                RewriteImpl(prog.TopLevelDeclarations.OfType<Implementation>().Where(impl => impl.Name.Equals(proc.Name)).FirstOrDefault(), types);
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
            procTypes = types;
            VisitImplementation(p);
        }

        public override Expr VisitNAryExpr(NAryExpr node)
        {
            if (node.Fun.FunctionName == "==")
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
                    if (!procTypes[node.Args[noLit].ToString()].ToString().Contains("bv"))
                        return node;
                    int num;
                    int width;
                    if (int.TryParse(node.Args[lit].ToString(), out num) && int.TryParse(procTypes[node.Args[noLit].ToString()].ToString().Substring("bv".Length), out width))
                    {
                        node.Args[lit] = new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(num), width);
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
                bool bv = procTypes[node.ToString()].ToString().Contains("bv");
                if (!bv)
                    return node;
                var funcName = node.Fun.FunctionName.Split('(')[0];
                var inputType = funcName.Split('.')[1];

                for (int i = 0; i < node.Args.Count; ++i)
                {
                    var arg = node.Args[i];
                    if (arg is LiteralExpr && !(arg as LiteralExpr).isBool)
                    {
                        int num;
                        int width;
                        if (int.TryParse(arg.ToString(), out num) && int.TryParse(inputType.Substring("i".Length), out width))
                        {
                            node.Args[i] = new LiteralExpr(Token.NoToken, Microsoft.Basetypes.BigNum.FromInt(num), width);
                        }
                        else
                        {
                            Console.Write("Having trouble parsing numbers in expr: " + node.ToString());
                        }
                    }
                }

                // build a bv expression
                var bvFuncName = string.Join(".", funcName.Split('.').Select(elem => !elem.Contains("$") ? "bv" + elem.Substring("i".Length) : elem));
                node = new NAryExpr(Token.NoToken, new FunctionCall(prog.TopLevelDeclarations.OfType<Function>().Where(func => func.Name.Equals(bvFuncName)).FirstOrDefault()), node.Args);
                //node.Args.Iter(se => VisitExpr(se));
                for (int i = 0; i < node.Args.Count; ++i)
                    node.Args[i] = VisitExpr(node.Args[i]);
                return node;
            }

            return base.VisitNAryExpr(node);
        }
    }
}
