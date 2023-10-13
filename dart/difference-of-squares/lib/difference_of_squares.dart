import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) {
    int sum;
    if (n % 2 == 0) {
      sum = (n + 1) * (n / 2).floor();
    } else {
      sum = (n + 1) * (n / 2).floor() + (n / 2).ceil();
    }

    return pow(sum, 2);
  }

  int sumOfSquares(int n) {
    return (n * (n + 1) * (2 * n + 1)) ~/ 6;
  }

  num differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
