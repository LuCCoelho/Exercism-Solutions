class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    switch (number.length) {
      case 1:
        return true;
      case 2:
        return false;
      default:
        BigInt sum = BigInt.from(0);
        number.runes.forEach((var digitChar) {
          int length = number.length;
          var digit =
              BigInt.from(int.parse(new String.fromCharCode(digitChar)));

          sum += digit.pow(length);
        });
        return sum.toString() == number;
    }
  }
}
