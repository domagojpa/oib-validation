<%
Function CheckOIB(ByVal oib)
	Dim isValid, a, i, c, kontrolni

	isValid = False
	
	If Len(oib) = 11 Then
		If IsNumeric(oib) Then
			a = 10
			
			For i = 1 To 10
				c = Mid(oib, i, 1)

				If Not IsNumeric(c) Then
					CheckOIB = False
					exit function
				End If

				a = a + Clng(c)
				a = a Mod 10
				
				If a = 0 Then a = 10
				
				a = a * 2
				a = a Mod 11
			Next
			
			kontrolni = 11 - a
			
			If kontrolni = 10 Then kontrolni = 0
			If kontrolni = CLng(Mid(oib, 11, 1)) Then isValid = True
		End If
	End If
	
	CheckOIB = isValid
End function
%>