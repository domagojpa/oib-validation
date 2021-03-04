using System;

/// <summary>
/// Summary description for oib
/// </summary>
public class oib
{
	public static bool CheckOIB(string oib)
	{
		if (string.IsNullOrEmpty(oib) || oib.Length != 11) 
			return false;

		if (!long.TryParse(oib, out _)) 
			return false;

		try
		{
			var a = 10;
			for (var i = 0; i < 10; i++)
			{
				a = a + Convert.ToInt32(oib.Substring(i, 1));
				a = a % 10;

				if (a == 0) 
					a = 10;

				a *= 2;
				a = a % 11;
			}

			var kontrolni = 11 - a;

			if (kontrolni == 10) 
				kontrolni = 0;

			return kontrolni == Convert.ToInt32(oib.Substring(10, 1));
		}
		catch (Exception)
		{
			return false;
		}
	}
}
