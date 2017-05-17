using System;

public static class TTUtil
{
    public static int getWidthFromType(string type)
    {
        int width;
        if (type.Equals("ref"))
        {
            width = 64;
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
}
