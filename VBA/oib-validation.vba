' Excel Macro funkcija za provjeru kontrolne znamenke OIB-a
Public Function oibOk(oib As String) As Boolean
    Dim a As Integer
    Dim k As Integer
    If 11 = Len(oib) Then
        a = 10
        For i = 1 To Len(oib) - 1 Step 1
            o = Mid$(oib, i, 1)
            a = a + o
            a = a Mod 10
            If 0 = a Then
                a = 10
            End If
            a = a * 2
            a = a Mod 11
            
            If IsNumeric(o) Then
                sum = o + sum
            End If
        Next i
        k = 11 - a
        If 10 = k Then
            k = 0
        End If
        If k = Mid$(oib, i, 11) Then
            oibOk = True
        Else
            oibOk = False
        End If
    Else
        oibOk = False
    End If
End Function
