import 'dart:math';

/**
 * Factorial generator
 */
int fact(int n, {int c = 1}) {
  if (n > 0) {
    c *= n;
    n--;
    c = fact(n, c: c);
  }
  return c;
}

/**
 * Convert factorial strings to decimal numbers
 * Better use BigInt to keep precision and avoid unexpected results
 */
int factString2Dec(String str) {
  List<BigInt> values = str
      .split("")
      .reversed
      .map((digit) => digit.codeUnitAt(0) > 57
          ? BigInt.from(digit.codeUnitAt(0) - 55)
          : BigInt.parse(digit))
      .toList();

  BigInt res = BigInt.zero;

  for (int i = 0; i < values.length; i++) {
    if (values[i] == BigInt.zero) continue;
    res += values[i] * BigInt.from(fact(i));
  }

  return res.toInt();
}

/**
 * First attempt to convert factorial strings to decimal numbers
 */
int AfactString2Dec(String str) {
  List<int> values = str
      .split("")
      .reversed
      .map((digit) => digit.codeUnitAt(0) > 57
          ? digit.codeUnitAt(0) - 55
          : int.parse(digit))
      .toList();
  int res = 0;
  int aux = 0;
  for (int i = 0; i < values.length; i++) {
    if (values[i] == 0) continue;
    res += (values[i] * fact(i));
  }
  return res;
}

/**
 * Generate a factorial string from a decimal number.
 * BigInt ensures that the input won't be modified by the compiler.
 */
String dec2FactString(int n) {
  List<BigInt> remainders = [];
  BigInt res = BigInt.from(n);

  for (int i = 1; res > BigInt.zero; i++) {
    remainders.add(res.remainder(BigInt.from(i)));
    res = res ~/ BigInt.from(i);
  }
  return remainders.reversed
      .map((digit) => digit.toInt() > 9
          ? String.fromCharCode(digit.toInt() + 55)
          : digit.toInt().toString())
      .toList()
      .join("");
}

/**
 * First attempt to convert decimals to factorial strings
 */
String Adec2FactString(int n) {
  List<String> remainders = [];
  int result = n;

  for (int i = 1; result > 0; i++) {
    int remainder = result % i;
    remainders.add((remainder > 9)
        ? String.fromCharCode(remainder + 55)
        : remainder.toString());
    result = (result / i).floor();
  }

  return remainders.reversed.join("");
}

/**
 * Second attempt to convert decimals to factorial strings
 */
String Bdec2FactString(int n) {
  List<String> remainders = [];
  BigInt result = BigInt.from(n);
  print("$result");
  for (int i = 1; result > BigInt.zero; i++) {
    BigInt remainder = result.remainder(BigInt.from(i));
    remainders.add((remainder > BigInt.from(9))
        ? String.fromCharCode(
            int.parse((remainder + BigInt.from(55)).toString()))
        : remainder.toString());
    //result = BigInt.from((result / BigInt.from(i)).floor());
    result = BigInt.from(result / BigInt.from(i));

    print("$result\t $remainder\t $remainders");
  }
  return remainders.reversed.join("");
}

/**
 * Simple unit test function
 */
void testing(
    {dynamic value = 0, dynamic expected = 0, Function callback = print}) {
  dynamic result = callback(value);
  print("$expected == $result: ${result == expected}\n");
}

void main() {
  testing(value: 463, expected: "341010", callback: dec2FactString);
  testing(value: 2982, expected: "4041000", callback: dec2FactString);
  testing(value: 36288000, expected: "A0000000000", callback: dec2FactString);
  testing(
      value: 371993326789901217,
      expected: "311E55B5544150121110",
      callback: dec2FactString);
}
