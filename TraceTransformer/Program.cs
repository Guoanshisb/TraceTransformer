using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Boogie;
using cba.Util;

namespace TraceTransformer
{
    class Driver
    {
        static void Main(string[] args)
        {
            CommandLineOptions.Install(new CommandLineOptions());
            CommandLineOptions.Clo.PrintInstrumented = true;
            CommandLineOptions.Clo.DoModSetAnalysis = true;

            var program = BoogieUtil.ReadAndResolve(args[0], false);
            var pre = new Preprocess(program);
            program = pre.Run();
            var st = new SplitType(program);
            st.Run();
            var rw = new Rewritter(program, st.getTypes(), args[1]);
            rw.Rewrite();
        }
    }
}
