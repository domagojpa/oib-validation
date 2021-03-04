class oib (object):
    def  CheckOIB(self,oib=""):
        if (len(oib) != 11):
            return False

        
        if not oib.isdigit():
            return False

        a = 10
        for i in range(0,10):
            a = a + int(oib[i:i+1])
            a = a % 10
            if a == 0:
                a = 10
            a *= 2
            a = a % 11
            
        kontrolni = 11 - a
        if kontrolni == 10:
            kontrolni = 0
        return kontrolni == int(oib[10:11])


if __name__ == "__main__":

    o = oib()
    print o.CheckOIB("ovdje upisi oib")
