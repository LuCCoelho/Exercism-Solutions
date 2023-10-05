import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(number) {
    switch (number.length) {
      case 1:
        return true;
      case 2:
        return false;
      default:
        num sum = 0;
        number.runes.forEach((c) {
          String digit = new String.fromCharCode(c);
          num power = pow(num.parse(digit), number.length);
          print('Digit: $digit\nSum: $sum\nPower: $power');
          sum += pow(num.parse(digit), number.length);
          print('Sum: $sum');
        });
        return sum == num.parse(number);
    }
  }
}
