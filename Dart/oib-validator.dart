 
  bool checkOIB(String oib) {
    if (oib.length != 11) return false;

    int a = 10;
    for (int i = 0; i < 10; i++) {
      int broj;
      try {
        broj = int.tryParse(oib.substring(i, i + 1)) ?? 0;
      } catch (e) {
        return false;
      }

      a += broj;
      a = a % 10;
      if (a == 0) a = 10;
      a *= 2;
      a = a % 11;
    }
    int kontrolni = 11 - a;
    if (kontrolni == 10) kontrolni = 0;

    int broj;

    try {
      broj = int.tryParse(oib.substring(10)) ?? 0;
    } catch (e) {
      return false;
    }
    return kontrolni == broj;
  }
