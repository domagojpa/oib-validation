//
//  OIBCheck.swift
//
//  Created by Tomislav Jakopec
//

func checkOIB(oib: String) -> Bool {
    if(oib.count != 11){
        return false
    }
    let broj = Int(oib)
    if  broj == nil {
        return false
    }
    var x = 10
    for i in 0..<10{
        let b:Int = Int(String(oib[oib.index(oib.startIndex, offsetBy: i)]))!
        x = x + b
        x = x % 10
            if (x == 0){
                x = 10
            }
        x *= 2
        x = x % 11
    }
    var kontrolni = 11 - x
    if (kontrolni == 10){
        kontrolni = 0
    }
    return kontrolni == Int(String(oib[oib.index(oib.startIndex, offsetBy: 10)]))!
}

print(checkOIB(oib: "67805710685")) //true
print(checkOIB(oib: "05943632515")) //true
print(checkOIB(oib: "05943632514")) //false
