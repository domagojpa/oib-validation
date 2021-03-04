using System;
using System.Web;

/// <summary>
/// Summary description for oib
/// </summary>
public class oib
{
    public static bool CheckOIB(string oib)
    {
        if (oib.Length != 11) return false;

        long b;
        if (!long.TryParse(oib, out b)) return false;

        int a = 10;
        for (int i = 0; i < 10; i++)
        {
            a = a + Convert.ToInt32(oib.Substring(i, 1));
            a = a % 10;
            if (a == 0) a = 10;
            a *= 2;
            a = a % 11;
        }
        int kontrolni = 11 - a;
        if (kontrolni == 10) kontrolni = 0;

        return kontrolni == Convert.ToInt32(oib.Substring(10, 1));
    }
}
