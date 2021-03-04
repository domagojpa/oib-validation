const isValidOIB = (oib:string): boolean => {
    if (!/^[0-9]{11}$/.test(oib)) 
        return false;

    let a = 10;
    for (let idx = 0; idx < 10; idx++) {
        a = a + parseInt(oib.substr(idx, 1), 10);
        a = a % 10;
        if (a === 0) 
            a = 10;
        a *= 2;
        a = a % 11;
    }

    let kontrolni = 11 - a;
    if (kontrolni === 10) 
        kontrolni = 0;

    return kontrolni === parseInt(oib.substr(10, 1));
}