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

            var traceProgram = BoogieUtil.ReadAndResolve(args[0], false);
            var wholeProgram = BoogieUtil.ReadAndResolve(args[1], false);
            var tracePre = new Preprocess(traceProgram);
            var traceDg = new Diagnoser(traceProgram);
            var wholePre = new Preprocess(wholeProgram);
            var wholeDg = new Diagnoser(wholeProgram);
            SplitType traceSt = null;
            SplitType wholeSt = null;
            List<HashSet<string>> localSol = null;
            List<HashSet<string>> globalSol = null;
            traceDg.Diagnose();
            if (args.Any(arg => arg.Equals("/preprocess")))
            {
                tracePre.Run();
                BoogieUtil.PrintProgram(traceProgram, "temp.bpl");
                return;
            }
            if (args.Any(arg => arg.Equals("/transform")))
            {
                traceProgram = tracePre.Run();
                traceSt = new SplitType(traceProgram, traceDg.getMapSizes());
                traceSt.Run();
                localSol = traceSt.getSolsInTvFromSolsInInt();
                //foreach (var sol in localSol)
                //{
                //    Console.WriteLine(string.Join(", ", sol));
                //}
                var rw = new Rewritter(traceProgram, traceSt.getTypes(), args[2]);
                rw.Rewrite();
                //return;
            }
            if (args.Any(arg => arg.Equals("/peek")))
            {
                wholeProgram = wholePre.Run();
                wholeSt = new SplitType(wholeProgram, wholeDg.getMapSizes());
                wholeSt.Solve();
                globalSol = wholeSt.getSolsInTv();
                //foreach (var sol in globalSol)
                //{
                //    Console.WriteLine(string.Join(", ", sol));
                //}
            }
            if (args.Any(arg => arg.Equals("/update")))
            {
                wholeSt.Merge(localSol);
                globalSol = wholeSt.getSolsInTv();
                foreach (var sol in globalSol)
                {
                    Console.WriteLine(string.Join(", ", sol));
                }
                wholeSt.updateSolsInInt();
                wholeSt.updateExprTypes();
                wholeSt.showUpdatedTypes();
                var rw = new Rewritter(wholeProgram, wholeSt.getTypes(), args[3]);
                rw.Rewrite();
            }
        }
    }
}
