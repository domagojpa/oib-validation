const isValidOIB = (oib:string): boolean => {
    if (!/^[0-9]{11}$/.test(oib)) 
        return false;

    let a = 10;
    for(const digit of oib.substring(0, 10)) {
        a += parseInt(digit);
        a %= 10;
        if (a === 0) 
            a = 10;
        a *= 2;
        a %= 11;
    }

    let kontrolni = 11 - a;
    if (kontrolni === 10) 
        kontrolni = 0;

    return kontrolni === parseInt(oib.substr(10, 1));
}
