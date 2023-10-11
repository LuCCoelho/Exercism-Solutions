class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    switch (number.length) {
      case 1:
        return true;
      case 2:
        return false;
      default:
        BigInt sum = BigInt.from(0);
        print("Number $number");
        number.runes.forEach((var digitChar) {
          int length = number.length;
          var digit =
              BigInt.from(int.parse(new String.fromCharCode(digitChar)));
          // print("Digit: $digit, length: $length");

          print("Digit: $digit, length: $length, power: ${digit.pow(length)}");
          // int eight = pow(8, 22).truncate();
          // print('Eight: $eight\n\nSum: $sum\nDigit: $digit\nLength: $length\nPower: $power');
          sum += digit.pow(length);
          print('Sum: $sum\n');
        });
        return sum.toString() == number;
    }
  }
}
