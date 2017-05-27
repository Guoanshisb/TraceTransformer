using System;
using System.Linq;
using System.Collections.Generic;
using Microsoft.Boogie;

namespace TraceTransformer
{
    public class ConstantInliner : StandardVisitor
    {
        Program prog;
        Dictionary<string, Expr> consts;

        public ConstantInliner(Program prog)
        {
            this.prog = prog;
            consts = new Dictionary<string, Expr>();
        }

        public void Inline()
        {
            gatherConsts();
            //prog.Implementations.Iter(impl => VisitImplementation(impl));
            //Visit(prog);
            foreach (var impl in prog.TopLevelDeclarations.OfType<Implementation>())
                VisitImplementation(impl);
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
            prog.Constants.Where(c => c.TypedIdent.Type.IsInt || c.TypedIdent.Type.ToString().Equals("ref")).Iter(c => allIntConsts.Add(c.Name));
            foreach (var axiom in prog.Axioms)
            {
                var expr = axiom.Expr;
                if (expr is NAryExpr && (expr as NAryExpr).Fun.FunctionName.Equals("=="))
                {
                    var lhs = (expr as NAryExpr).Args[0];
                    var rhs = (expr as NAryExpr).Args[1];
                    if (lhs is IdentifierExpr && allIntConsts.Contains((lhs as IdentifierExpr).Decl.Name))
                    {
                        consts[lhs.ToString()] = TTUtil.Evaluate(rhs);
                    }
                    if (rhs is IdentifierExpr && allIntConsts.Contains((rhs as IdentifierExpr).Decl.Name))
                    {
                        consts[rhs.ToString()] = TTUtil.Evaluate(lhs);
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

    public class RemoveOrInline : StandardVisitor
    {
        Program prog;

        public RemoveOrInline(Program prog)
        {
            this.prog = prog;
        }

        public void Run()
        {
            foreach (var impl in prog.TopLevelDeclarations.OfType<Implementation>())
            {
                VisitImplementation(impl);
            }
        }

        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            if (node.Rhss.Count == 1 && node.Rhss[0] is NAryExpr && (node.Rhss[0] as NAryExpr).Fun.FunctionName.Equals("$extractvalue"))
            {
                Expr lhs = node.Lhss[0].AsExpr;
                return new HavocCmd(Token.NoToken, new List<IdentifierExpr>() { new IdentifierExpr(Token.NoToken, lhs.ToString(), lhs.Type) });
            }
            else
            {
                return node;
            }
        }

        public override Cmd VisitAssumeCmd(AssumeCmd node)
        {
            var expr = node.Expr;
            if (expr is NAryExpr && (expr as NAryExpr).Fun.FunctionName.Equals("$isExternal"))
            {
                var appExpr = expr as NAryExpr;
                var ptrExpr = appExpr.Args[0];
                node.Expr = new NAryExpr(Token.NoToken,
                    new FunctionCall(prog.Functions.Where(f => f.Name.Equals("$slt.ref.bool")).First()),
                    new List<Expr>() { ptrExpr,
                        new IdentifierExpr(Token.NoToken, prog.Constants.Where(g => g.Name.Equals("$EXTERNS_BOTTOM")).First()) });
                return node;
            }
            else
            {
                return node;
            }
        }
    }

    public class FunctionInlingVisitor : StandardVisitor
    {
        private Predicate<Function> Condition;
        public int InlineCounter
        {
            get;
            private set;
        }
        public FunctionInlingVisitor(Predicate<Function> condition)
        {
            this.Condition = condition;
            InlineCounter = 0;
        }

        public override Expr VisitNAryExpr(NAryExpr node)
        {
            if (!(node.Fun is FunctionCall))
                return base.VisitNAryExpr(node);

            var FC = node.Fun as FunctionCall;

            // Can't inline SMTLIBv2 functions
            if (QKeyValue.FindStringAttribute(FC.Func.Attributes, "bvbuiltin") != null)
                return base.VisitNAryExpr(node);

            if (Condition(FC.Func))
            {
                if (FC.Func.Body == null)
                    throw new InvalidOperationException("Can't inline a function without a body");

                // Compute mapping
                var varToExprMap = new Dictionary<Variable, Expr>();
                foreach (var parameterArgumentPair in FC.Func.InParams.Zip(node.Args))
                {
                    varToExprMap.Add(parameterArgumentPair.Item1, parameterArgumentPair.Item2);
                }

                // Using Closure :)
                Substitution sub = delegate (Variable v)
                {
                    try
                    {
                        return varToExprMap[v];
                    }
                    catch (KeyNotFoundException)
                    {
                        // The substituter seems to expect null being
                        // returned if we don't want to change the variable
                        return null;
                    }
                };

                // Return the Function expression with variables substituted for function arguments.
                // This is basically inling
                ++InlineCounter;

                var result = Substituter.Apply(sub, FC.Func.Body);

                // Make sure we visit the result because it may itself contain function calls
                return (Expr)base.Visit(result);
            }
            else
                return base.VisitNAryExpr(node);
        }
    }

    public class InlineFunctionCalls
    {
        Program prog;
        Predicate<Function> Condition;

        public InlineFunctionCalls(Program prog)
        {
            this.prog = prog;
            Condition = f => QKeyValue.FindBoolAttribute(f.Attributes, "inline");
        }

        public void Inline()
        {
            var functionInlingVisitor = new FunctionInlingVisitor(Condition);

            // Apply to axioms
            foreach (var axiom in prog.TopLevelDeclarations.OfType<Axiom>())
            {
                functionInlingVisitor.Visit(axiom);
            }

            // Apply to each Procedure's requires and ensures
            foreach (var procedure in prog.TopLevelDeclarations.OfType<Procedure>())
            {
                foreach (var ensures in procedure.Ensures)
                {
                    functionInlingVisitor.Visit(ensures);
                }

                foreach (var requires in procedure.Requires)
                {
                    functionInlingVisitor.Visit(requires);
                }
            }

            // Apply to functions too, is this correct??
            foreach (var function in prog.TopLevelDeclarations.OfType<Function>())
            {
                if (function.Body != null)
                {
                    function.Body = functionInlingVisitor.Visit(function.Body) as Expr;
                }
            }

            // Apply to Commands in basic blocks
            foreach (var basicBlock in prog.Blocks())
            {
                functionInlingVisitor.Visit(basicBlock);
            }
        }
    }

    public class createdAndUsedVarsVisitor : StandardVisitor
    {
        HashSet<string> globals;
        HashSet<string> createdVars;
        HashSet<string> usedVars;

        public createdAndUsedVarsVisitor(HashSet<string> globals)
        {
            createdVars = new HashSet<string>();
            usedVars = new HashSet<string>();
            this.globals = globals;
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            if (!globals.Contains(node.Name))
            {
                usedVars.Add(node.Name);
            }
            return node;
        }
        public override Cmd VisitAssignCmd(AssignCmd node)
        {
            foreach (var tuple in node.Lhss.Zip(node.Rhss))
            {
                var lhs = tuple.Item1;
                var rhs = tuple.Item2;
                //if (!globals.Contains(lhs.AsExpr.ToString()))
                //{
                //    createdVars.Add(lhs.AsExpr.ToString());
                //}
                Visit(rhs);
            }
            return node;
        }

        public override Cmd VisitHavocCmd(HavocCmd node)
        {
            node.Vars.Iter(v => createdVars.Add(v.Name));
            return node;
        }

        public HashSet<string> getCreatedVars()
        {
            return createdVars;
        }

        public HashSet<string> getUsedVars()
        {
            return usedVars;
        }
    }

    public class MergeAssignments : StandardVisitor
    {
        Program prog;
        Dictionary<string, HashSet<string>> equivVarMap;
        HashSet<string> globalsAndRets;

        public MergeAssignments(Program prog)
        {
            this.prog = prog;
            equivVarMap = new Dictionary<string, HashSet<string>>();
            globalsAndRets = new HashSet<string>();
            prog.GlobalVariables.Iter(g => globalsAndRets.Add(g.Name));
        }

        public void Merge()
        {
            prog.Blocks().Iter(blk => VisitBlock(blk));
        }

        public override Block VisitBlock(Block node)
        {
            equivVarMap.Clear();

            var getCreatedAndUsed = new createdAndUsedVarsVisitor(globalsAndRets);
            getCreatedAndUsed.VisitBlock(node);
            var usedVars = getCreatedAndUsed.getUsedVars();
            var createdVars = getCreatedAndUsed.getCreatedVars();

            var newCmds = new List<Cmd>();
            foreach (var cmd in node.cmds)
            {
                if (cmd is AssignCmd && isMergableAssign(cmd as AssignCmd, usedVars))
                {
                    foreach (var tuple in (cmd as AssignCmd).Lhss.Zip((cmd as AssignCmd).Rhss))
                    {
                        var lhs = tuple.Item1;
                        var rhs = tuple.Item2;

                        var head = getRhs(rhs);
                        if (head == null)
                        {
                            if (createdVars.Contains(rhs.ToString()))
                            {
                                return node;
                            }
                            else
                            {
                                equivVarMap[rhs.ToString()] = new HashSet<string>() { lhs.AsExpr.ToString() };
                            }
                        }
                        else
                        {
                            equivVarMap[head].Add(lhs.AsExpr.ToString());
                        }
                    }
                }
                else
                {
                    Visit(cmd);
                    newCmds.Add(cmd);
                }
            }

            // the last element may be a result of phi node
            //if (node.cmds.Count > 0)
            //{
            //    var lastCmd = node.cmds[node.cmds.Count - 1];
            //    if (lastCmd is AssignCmd && isMergableAssign(lastCmd as AssignCmd))
            //    {
            //        var newRhss = new List<Expr>();
            //        foreach (var tuple in (lastCmd as AssignCmd).Lhss.Zip((lastCmd as AssignCmd).Rhss))
            //        {
            //            var lhs = tuple.Item1;
            //            var rhs = tuple.Item2;
            //            var repl = getRhs(rhs);
            //            if (repl == null)
            //            {
            //                newRhss.Add(rhs);
            //            }
            //            else
            //            {
            //                newRhss.Add(new IdentifierExpr(Token.NoToken, repl, rhs.Type, rhs.Immutable));
            //            }
            //        }
            //        (lastCmd as AssignCmd).Rhss = newRhss;
            //        newCmds.Add(lastCmd);
            //    }
            //}
            node.cmds = newCmds;
            return node;
        }

        public override Expr VisitIdentifierExpr(IdentifierExpr node)
        {
            //Console.WriteLine(string.Join(", ", equivVarMap.Keys));
            //Console.WriteLine(node.ToString());            
            var repl = getRhs(node);

            //System.Diagnostics.Debugger.Launch();
            if (repl == null)
            {
                return node;
            }
            else
            {
                return new IdentifierExpr(Token.NoToken, repl, node.Type, node.Immutable);
            }
        }

        string getRhs(Expr rhs)
        {
            foreach (var equivVar in equivVarMap.Keys)
            {
                if (equivVarMap[equivVar].Contains(rhs.ToString()))
                    return equivVar;
            }
            return null;
        }

        bool isMergableAssign(AssignCmd aCmd, HashSet<string> usedVars)
        {
            return aCmd.Rhss.All(rhs => rhs is IdentifierExpr) &&
                aCmd.Lhss.All(lhs => !globalsAndRets.Contains(lhs.AsExpr.ToString())) &&
                aCmd.Rhss.All(rhs => !globalsAndRets.Contains(rhs.ToString())) &&
                aCmd.Lhss.All(lhs => usedVars.Contains(lhs.AsExpr.ToString()));
        }
    }

    public class Preprocess
    {
        Program prog;

        public Preprocess(Program prog)
        {
            this.prog = prog;
        }

        public Program Run()
        {
            var ci = new ConstantInliner(prog);
            ci.Inline();
            var fk = new ForkProcsWithoutImpls(prog);
            fk.Fork();
            var re = new RemoveOrInline(prog);
            re.Run();
            return TTUtil.ReResolveInMem(prog);
            //var inl = new InlineFunctionCalls(prog);
            //inl.Inline();
            //var meg = new MergeAssignments(prog);
            //meg.Merge();
            //return prog;
        }
    }
}
