﻿using System;
using Microsoft.Boogie;
using System.Linq;
using System.Collections.Generic;

public class InvalidProg : System.ApplicationException
{
    public InvalidProg(string msg) : base(msg) { }

};

public static class TTUtil
{
    public static int getWidthFromType(string type)
    {
        int width;
        if (type.Equals("ref"))
        {
            width = 64;
        }
        else if (type.Equals("float"))
        {
            width = 32;
        }
        else
        {
            string prefix = type.StartsWith("i") ? "i" : "bv";
            if (int.TryParse(type.Substring(prefix.Length), out width))
            {
                // pass
            }
            else
            {
                Console.WriteLine("Cannot parse type: " + type);
            }
        }
        return width;
    }

    public static bool ResolveProgram(Program p, string filename)
    {
        int errorCount = p.Resolve();
        if (errorCount != 0)
            Console.WriteLine(errorCount + " name resolution errors in " + filename);
        return errorCount != 0;
    }

    public static void PrintProgram(Program p, string filename)
    {
        var outFile = new TokenTextWriter(filename);
        p.Emit(outFile);
        outFile.Close();
    }

    public static bool TypecheckProgram(Program p, string filename)
    {
        int errorCount = p.Typecheck();
        if (errorCount != 0)
        {
            PrintProgram(p, "error.bpl");
            Console.WriteLine(errorCount + " type checking errors in " + filename);
        }
        return errorCount != 0;
    }

    public static Program ReResolveInMem(Program p, bool doTypecheck = true)
    {
        Program output;
        using (var writer = new System.IO.MemoryStream())
        {
            var st = new System.IO.StreamWriter(writer);
            var tt = new TokenTextWriter(st);
            p.Emit(tt);
            writer.Flush();
            st.Flush();

            writer.Seek(0, System.IO.SeekOrigin.Begin);
            var s = ParserHelper.Fill(writer, new List<string>());

            var v = Parser.Parse(s, "ReResolveInMem", out output);
            if (ResolveProgram(output, "ReResolveInMem"))
            {
                throw new InvalidProg("Cannot resolve " + "ReResolveInMem");
            }
            if (doTypecheck && TypecheckProgram(output, "ReResolveInMem"))
            {
                throw new InvalidProg("Cannot typecheck " + "ReResolveInMem");
            }
        }
        return output;
    }

    public static Program ReadAndResolve(string filename, bool doTypecheck = true)
    {
        Program p = ParseProgram(filename);

        if (p == null)
        {
            throw new InvalidProg("Parse errors in " + filename);
        }

        if (ResolveProgram(p, filename))
        {
            throw new InvalidProg("Cannot resolve " + filename);
        }
        if (doTypecheck && TypecheckProgram(p, filename))
        {
            throw new InvalidProg("Cannot typecheck " + filename);
        }

        return p;
    }

    public static Program ParseProgram(string f)
    {
        Program p = new Program();

        try
        {
            if (Parser.Parse(f, new List<string>(), out p) != 0)
            {
                Console.WriteLine("Failed to read " + f);
                return null;
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
            return null;
        }
        return p;
    }
}
