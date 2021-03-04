using System;
using System.Text.RegularExpressions;

public class Validators
{
	public static bool IsValidOIB(string oib)
	{
		if (string.IsNullOrEmpty(oib) || !Regex.IsMatch(oib, "^[0-9]{11}$")) 
			return false;

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
}
