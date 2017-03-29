using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Boogie;

namespace TraceTransformer
{
    public class ConstantInliner : StandardVisitor
    {
        Program prog;
        Dictionary<string, LiteralExpr> consts;

        public ConstantInliner(Program prog)
        {
            this.prog = prog;
            consts = new Dictionary<string, LiteralExpr>();
        }

        public void Inline()
        {
            gatherConsts();
            prog.Implementations.Iter(impl => VisitImplementation(impl));
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (consts.Keys.Contains(node.ToString()))
            {
                return consts[node.ToString()];
            }
            return base.VisitIdentifierExpr(node);
        }
        public void gatherConsts()
        {
            //prog.Constants.Iter(c => consts.Add(c.Name));
            var allIntConsts = new HashSet<string>();
            prog.Constants.Where(c => c.TypedIdent.Type.IsInt && !c.TypedIdent.Type.ToString().Equals("ref")).Iter(c => allIntConsts.Add(c.Name));
            foreach (var axiom in prog.Axioms)
            {
                var expr = axiom.Expr;
                if (expr is NAryExpr && (expr as NAryExpr).Fun.FunctionName.Equals("=="))
                {
                    var lhs = (expr as NAryExpr).Args[0];
                    var rhs = (expr as NAryExpr).Args[1];
                    if (lhs is IdentifierExpr && allIntConsts.Contains((lhs as IdentifierExpr).Decl.Name) && rhs is LiteralExpr && (rhs as LiteralExpr).isBigNum)
                    {
                        consts[lhs.ToString()] = rhs as LiteralExpr;
                    }
                    if (rhs is IdentifierExpr && allIntConsts.Contains((rhs as IdentifierExpr).Decl.Name) && lhs is LiteralExpr && (lhs as LiteralExpr).isBigNum)
                    {
                        consts[rhs.ToString()] = lhs as LiteralExpr;
                    }
                }
            }
            //Console.WriteLine(string.Join(", ", consts.Keys));
        }
    }

    public class ForkProcsWithoutImpls : StandardVisitor
    {
        Program prog;
        Dictionary<Procedure, int> counters;
        List<Procedure> procsWithoutImples;

        public ForkProcsWithoutImpls(Program prog)
        {
            this.prog = prog;
            counters = new Dictionary<Procedure, int>();
        }

        public void Fork()
        {
            // gather procedures that do not have bodies
            procsWithoutImples = prog.Procedures.Where(proc => !prog.Implementations.Any(impl => impl.Name.Equals(proc.Name)) && (proc.InParams.Count != 0 || proc.OutParams.Count != 0)).ToList();
            procsWithoutImples.Iter(proc => counters[proc] = 0);
            //prog.Implementations.Iter(impl => VisitImplementation(impl));
            VisitProgram(prog);
        }

        public override Cmd VisitCallCmd(CallCmd node)
        {
            var callee = node.Proc;
            if (counters.Keys.Contains(callee))
            {
                if (counters[callee] != 0)
                {
                    // fork a new one
                    var newProc = new Procedure(Token.NoToken, callee.Name + "_" + counters[callee], new List<TypeVariable>(callee.TypeParameters),
                        new List<Variable>(callee.InParams), new List<Variable>(callee.OutParams), new List<Requires>(callee.Requires),
                        new List<IdentifierExpr>(callee.Modifies), new List<Ensures>(callee.Ensures));
                    prog.AddTopLevelDeclaration(newProc);
                    var newCallCmd = new CallCmd(Token.NoToken, newProc.Name, new List<Expr>(node.Ins), new List<IdentifierExpr>(node.Outs));
                    counters[callee] += 1;
                    return newCallCmd;
                }
                counters[callee] += 1;
            }
            return node;
        }
    }
}
