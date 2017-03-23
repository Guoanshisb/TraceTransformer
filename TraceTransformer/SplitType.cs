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
        Dictionary<Procedure, List<HashSet<string>>> typeSolutions;

        public SplitType(Program prog, string entryPoint)
        {
            this.prog = prog;
            this.entryPoint = prog.TopLevelDeclarations.OfType<Implementation>().Where(impl => impl.Name == entryPoint).FirstOrDefault();
            this.varTypes = new Dictionary<Procedure, Dictionary<string, Microsoft.Boogie.Type>>();
            this.typeConstraints = new Dictionary<Procedure, List<List<string>>>();
            bvOps = new List<string>() {"$and", "$or", "$lshr", "$shl", "$xor"};
            this.typeSolutions = new Dictionary<Procedure, List<HashSet<string>>>();
        }

        public void Run()
        {
            generateConstraints();
            solveConstraints();
        }

        public void generateConstraints()
        {
            //foreach (var impl in prog.Implementations)
            //{
            //    VisitImplementation(impl);
            //}
            VisitImplementation(entryPoint);
            // prune literals
            foreach (var procCons in typeConstraints.Values)
            {
                for (int i = procCons.Count - 1; i >= 0; --i)
                {
                    int n;
                    //if (procCons[i].Any(cons => int.TryParse(cons, out n)))
                    //{
                    //    procCons.RemoveAt(i);
                    //}
                }
            }
        }

        public void solveConstraints()
        {
            //foreach (var procSols in typeConstraints.Values)
            //{
                //Console.WriteLine("*************************************");
                //foreach (var group in procSols)
                //{
                //    Console.WriteLine(string.Join(", ", group));
                //}
            //}
            foreach (var item in typeConstraints)
            {
                var procCons = item.Value;
                var proc = item.Key;
                var procSolutions = new List<HashSet<string>>();
                typeSolutions[proc] = procSolutions;
                Func<string, int> findSet = delegate (string t)
                {
                    //foreach (var group in procSolutions)
                    //{
                    //    Console.WriteLine(string.Join(", ", group));
                    //}
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
                    int n;
                    if (singleCons.Count == 2 && singleCons.Any(cons => int.TryParse(cons, out n)))
                        continue;
                    Dictionary<string, int> groupId = new Dictionary<string, int>();
                    foreach (var tc in singleCons)
                    {
                        if (!tc.Equals("BV"))
                            groupId[tc] = findSet(tc);
                    }

                    // merge groups if found
                    //HashSet<string> merged = new HashSet<string>();
                    //List<HashSet<string>> newList = new List<HashSet<string>>();
                    //foreach (var id in groupId)
                    //{
                    //    if (id != -1)
                    //        merged.Union(procSolutions.ElementAt(id));
                    //    //procSolutions.RemoveAt(id);
                    //    Console.WriteLine(string.Join(", ", procSolutions.ElementAt(id)));
                    //}
                    //for (int i = 0; i < procSolutions.Count; ++i)
                    //{
                    //    if (!groupId.Contains(i))
                    //        newList.Add(procSolutions.ElementAt(i));
                    //}

                    //newList.Add(merged);
                    //procSolutions = newList;

                    // create a group needed
                    if (groupId.Values.All(id => id == -1))
                    {
                        var group = new HashSet<string>();
                        procSolutions.Add(group);
                        foreach (var tc in singleCons)
                        {
                            if (int.TryParse(tc, out n))
                                continue;
                            else
                                group.Add(tc);
                        }
                    }
                    else
                    {
                        //var group = procSolutions.ElementAt(groupId.First());
                        //foreach (var tc in singleCons)
                        //{
                        //    if (int.TryParse(tc, out n))
                        //        continue;
                        //    else
                        //        group.Add(tc);
                        //}
                        HashSet<int> ids = new HashSet<int>(groupId.Values.Where(id => id != -1));
                        if (ids.Count == 1)
                        {
                            var group = procSolutions.ElementAt(ids.First());
                            foreach (var tc in singleCons)
                            {
                                if (int.TryParse(tc, out n))
                                    continue;
                                else
                                    group.Add(tc);
                            }
                        }
                        else
                        {
                            // merge lists
                            //Console.WriteLine("****************1********************");
                            //Console.WriteLine(string.Join(", ", ids));
                            //foreach (var group in procSolutions)
                            //{
                            //    Console.WriteLine(string.Join(", ", group));
                            //}
                            HashSet<string> merged = new HashSet<string>();
                            List<HashSet<string>> newList = new List<HashSet<string>>();
                            foreach (var id in ids)
                            {
                                merged.UnionWith(new HashSet<string>(procSolutions.ElementAt(id)));
                            }
                            foreach (var tc in singleCons)
                            {
                                if (int.TryParse(tc, out n))
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
                            //Console.WriteLine("*****************2*******************");
                            //Console.WriteLine(string.Join(", ", ids));
                            //Console.WriteLine(string.Join(", ", groupId.Keys));
                            //foreach (var group in procSolutions)
                            //{
                            //    Console.WriteLine(string.Join(", ", group));
                            //}
                        }
                    }
                }
            }
            foreach (var procSols in typeSolutions.Values)
            {
                Console.WriteLine("************************************************************************");
                foreach (var group in procSols)
                {
                    Console.WriteLine(string.Join(", ", group.Where(mem => !mem.Contains("."))));
                }
            }
        }

        public override Implementation VisitImplementation(Implementation node)
        {
            Dictionary<string, Microsoft.Boogie.Type> varInitTypes = new Dictionary<string, Microsoft.Boogie.Type>();
            varTypes[node.Proc] = varInitTypes;
            currProc = node.Proc;
            typeConstraints[currProc] = new List<List<string>>();
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
                typeConstraints[currProc].Add(new List<string>() { lhs.AsExpr.ToString(), rhs.ToString() });
                VisitExpr(lhs.AsExpr);
                VisitExpr(rhs);
            }
            return node;
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
                else if (e.Fun.FunctionName.Equals("=="))
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
