function checkOib(oib : String) : boolean;
var ii, br : integer;

Begin
  result := false;
  if length(oib) = 11 Then Begin
     try
       StrToFloat(oib);
       br := 10;
       For ii := 1 To 10 Do Begin
         br := br + StrToInt(oib[ii]);
         br := br mod 10;
         if (br = 0 ) Then
            br := 10;
         br := br * 2;
         br := br MOD 11;
       End;
       br := 11 - br;
       if br = 10 Then
         br := 0;
       result := br = StrToInt(oib[11]);
     except

     end;
  End;
End;
