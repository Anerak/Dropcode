import 'dart:math';

int fact(int n, {int c = 1}) {
  if (n > 0) {
    c *= n;
    n--;
    c = fact(n, c: c);
  }
  return c;
}

BigInt factString2Dec(String str) {
  List<BigInt> values = str
      .split("")
      .reversed
      .map((digit) => digit.codeUnitAt(0) > 57
          ? BigInt.from(digit.codeUnitAt(0) - 55)
          : BigInt.from(int.parse(digit)))
      .toList();
  BigInt res = BigInt.zero;
  BigInt aux = BigInt.zero;
  for (BigInt i = BigInt.zero;
      i < BigInt.from(values.length);
      i += BigInt.one) {
    if (values[int.parse(i.toString())] == BigInt.zero) continue;
    res += (values[int.parse(i.toString())] *
        BigInt.from(fact(int.parse(i.toString()))));
  }
  return res;
}

String dec2FactString(int n) {
  List<String> remainders = [];
  BigInt result = BigInt.from(n);

  for (int i = 1; result > BigInt.zero; i++) {
    BigInt remainder = result % BigInt.from(i);
    remainders.insert(
        0,
        (int.parse(remainder.toString()) > 9)
            ? String.fromCharCode(
                int.parse((remainder + BigInt.from(55)).toString()))
            : remainder.toString());
    result = BigInt.from((result / BigInt.from(i)).floor());
  }

  return remainders.join("");
}

Map<String, dynamic> testing(
    dynamic value, dynamic expected, Function callback) {
  dynamic result = callback(value);
  print("Result: $result");
  print("Pass: ${result == expected}");
}

main() {
  print("${BigInt.from(371993326789901217)}");
  testing(371993326789901217, "5B5544150121110", dec2FactString);
  testing("5B5544150121110", 371993326789901217, factString2Dec);
  //print(fact(n: 3));
  //print(factString2Dec("341010"));
  //print(dec2FactString(463));
  //print(dec2FactString(2982));
  //print(dec2FactString((3.72 * pow(10, 41)).floor()));
}
