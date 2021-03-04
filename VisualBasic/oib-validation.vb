Public Class OIB

    ''' <summary>
    ''' Checks the validity of OIB
    ''' </summary>
    ''' <param name="OIB"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Shared Function CheckOIB(ByVal OIB As String) As Boolean

        If (OIB.Length <> 11) Then
            Return False
        End If

        Dim OIBInt As Long
        If Not Long.TryParse(OIB, OIBInt) Then
            Return False
        End If

        Dim sum As Integer = 10
        For i As Short = 0 To 9
            sum = sum + CInt(OIB.Substring(i, 1))
            sum = sum Mod 10

            If (sum = 0) Then
                sum = 10
            End If

            sum *= 2
            sum = sum Mod 11
        Next

        Dim kontrolni As Integer = 11 - sum
        If kontrolni = 10 Then
            kontrolni = 0
        End If

        If (kontrolni = CInt(OIB.Substring(10, 1))) Then
            Return True
        Else
            Return False
        End If
    End Function
End Class