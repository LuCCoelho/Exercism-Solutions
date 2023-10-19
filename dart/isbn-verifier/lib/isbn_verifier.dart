bool isValid(String id) {
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
    '9',
    'X'
  ];

  id = id.replaceAll('-', '');
  int result = 0;
  List<String> idDigits = id.split('');

  if (idDigits.length != 10) {
    return false;
  }

  for (int i = 0; i < 10; i++) {
    if (validCharacters.contains(idDigits[i])) {
      if (idDigits[i] == 'X') {
        if (i == 9) {
          result += 10;
        } else {
          return false;
        }
      } else {
        int digit = int.parse(idDigits[i]);
        result += (10 - i) * digit;
      }
    } else {
      return false;
    }
  }

  return result % 11 == 0;
}
