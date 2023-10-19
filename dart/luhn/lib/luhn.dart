class Luhn {
  bool valid(String number) {
    List<String> validCharacters = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];

    number = number.replaceAll(' ', '');
    int result = 0;
    List<String> numberDigits = number.split('');
    
    if (numberDigits.length < 2) {
      return false;
    }

    for (int i = (numberDigits.length - 2); i > -1; i -= 2) {
      if (validCharacters.contains(numberDigits[i])) {
        int digit = int.parse(numberDigits[i]);
        int digitDouble = digit * 2;
        if (digitDouble > 9) {
          digitDouble -= 9;
        }
        numberDigits[i] = digitDouble.toString();
      } else {
        return false;
      }
    }

    for (int i = 0; i < numberDigits.length; i++) {
      if (validCharacters.contains(numberDigits[i])) {
        result += int.parse(numberDigits[i]);
      } else {
        return false;
      }
    }

    return result % 10 == 0;
  }
}
