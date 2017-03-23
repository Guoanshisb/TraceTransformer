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
            var st = new SplitType(program, "main_trace_1");
            st.Run();
        }
    }
}
