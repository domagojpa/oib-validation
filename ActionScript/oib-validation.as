package
{
	public class OIB
	{		
		public static function checkOIB(oib:String):Boolean {
			
			if (oib.length != 11) return false;
			
			if (isNaN(parseInt(oib))){
				return false;
			}
			
			var a:int = 10;
			for (var i:int = 0; i < 10; i++)
			{
				a = a + parseInt(oib.substr(i, 1));
				a = a % 10;
				if (a == 0) a = 10;
				a *= 2;
				a = a % 11;
			}
			var kontrolni:int = 11 - a;
			if (kontrolni == 10) kontrolni = 0;
			
			return kontrolni == parseInt(oib.substr(10, 1));
		}			
	}
}