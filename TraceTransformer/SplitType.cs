using System;
using Microsoft.Boogie;
using System.Linq;
using System.Collections.Generic;

namespace TraceTransformer
{
    public class SplitType : StandardVisitor
    {
        Program prog;
        Implementation entryPoint;
        Procedure currProc;
        Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>> varTypes;
        Dictionary<Procedure, List<List<string>>> typeConstraints;
        List<string> bvOps;

        public SplitType(Program prog, string entryPoint)
        {
            this.prog = prog;
            this.entryPoint = prog.TopLevelDeclarations.OfType<Implementation>().Where(impl => impl.Name == entryPoint).FirstOrDefault();
            this.varTypes = new Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>>();
            bvOps = new List<string>() {"and", "or", "lshr", "shl", "xor"};
        }

        public void Run()
        {

        }

        public override Implementation VisitImplementation(Implementation node)
        {
            Dictionary<string, Microsoft.Boogie.Type> varInitTypes = new Dictionary<string, Microsoft.Boogie.Type>();
            varTypes[node.Proc] = varInitTypes;
            currProc = node.Proc;
            foreach (var varDecl in node.LocVars)
            {
                varInitTypes[varDecl.Name] = varDecl.TypedIdent.Type;
            }
            return base.VisitImplementation(node);
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            foreach (var assign in node.Lhss.Zip(node.Rhss, Tuple.Create))
            {
                var lhs = assign.Item1;
                var rhs = assign.Item2;
                
            }
            return base.VisitAssignCmd(node);
        }

        public override Expr VisitExpr(Expr node)
        {
            if (node is NAryExpr)
            {
                var e = node as NAryExpr;
                if (!e.Args.All(p => p is IdentifierExpr))
                {
                    Console.WriteLine("Not all arguments of NaryExpr: " + e.ToString() + " is identifier");
                    return node;
                }
                typeConstraints[currProc].Add(e.Args.Select(p => p.ToString()).ToList());
                if (bvOps.Contains(e.Fun.FunctionName.Split('.')[0]))
                {

                }
            }
            return base.VisitExpr(node);
        }
    }
}
