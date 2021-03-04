 
  bool oibIsValid(String input) {
    if (input == null || input.length != 11 || int.tryParse(input) == null) return false;
    
    int isoVar = 10;
   
    for (int i = 0; i < 10; i++) {
      int currentElement;
     
      currentElement = int.parse(input.substring(i, i + 1));

      isoVar += currentElement;
      isoVar = a % 10;
      if (isoVar == 0) isoVar = 10;
      isoVar *= 2;
      isoVar = isoVar % 11;
    }
   
    int lastDigit = 11 - isoVar;
    if (lastDigit == 10) lastDigit = 0;
    
    return lastDigit == int.parse(input.substring(10);
}
