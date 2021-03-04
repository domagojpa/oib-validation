function CheckOIB(oib) {
    oib = oib.toString();
    if (oib.length != 11) return false;

    var b = parseInt(oib, 10);
    if (isNaN(b)) return false;

    var a = 10;
    for (var i = 0; i < 10; i++) {
        a = a + parseInt(oib.substr(i, 1), 10);
        a = a % 10;
        if (a == 0) a = 10;
        a *= 2;
        a = a % 11;
    }
    var kontrolni = 11 - a;
    if (kontrolni == 10) kontrolni = 0;

    return kontrolni == parseInt(oib.substr(10, 1));
}
