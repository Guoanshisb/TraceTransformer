using System;
using System.Linq;
using System.Collections.Generic;

namespace TraceTransformer
{
    // this class should be a general expression type unifier
    // it implements a very simple unification algorithm
    public class Unifier
    {
        List<List<int>> cons;
        List<HashSet<int>> sols;

        public Unifier(List<List<int>> cons)
        {
            this.cons = cons;
            this.sols = new List<HashSet<int>>();
        }

        public List<HashSet<int>> Unify()
        {
            // finds groups for all expression types
            foreach (var con in cons)
            {
                var groups = findGroup(con);
                // if no goup exists
                if (groups.All(g => g == -1))
                {
                    // create a group
                    var newSol = new HashSet<int>(con);
                }
                var foundGroups = groups.Where(g => g != -1);
                if (foundGroups.Count() == 1)
                {
                    // only one group found
                    // add all expression types to the group
                    sols[foundGroups.First()].UnionWith(con);
                }
                else
                {
                    // multiple groups found
                    // merge these groups
                    var mergedGroup = new HashSet<int>();
                    var newSols = new List<HashSet<int>>();
                    // add found groups to the merged group
                    // and remove them
                    foreach (var gi in foundGroups)
                    {
                        mergedGroup.UnionWith(sols[gi]);
                    }
                    for (int i = 0; i < sols.Count; ++i)
                    {
                        if (foundGroups.Contains(i))
                            continue;
                        else
                            newSols.Add(sols[i]);
                    }
                    mergedGroup.UnionWith(con);
                    newSols.Add(mergedGroup);
                    sols = newSols;
                }
            }
            return sols;
        }

        public HashSet<int> findGroup(List<int> con)
        {
            var ret = new HashSet<int>();
            foreach (var t in con)
            {
                int group = -1;
                for (int i = 0; i < sols.Count; ++i)
                {
                    if (sols[i].Contains(t))
                    {
                        group = i;
                        break;
                    }
                }
                ret.Add(group);
            }
            return ret;
        }
    }
}
