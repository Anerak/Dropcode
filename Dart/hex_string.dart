import './test_util.dart';

/// Return an hexadecimal [String] from the runes of the original string.
String str2Hex(String str) {
  Runes codes = str.runes;
  String hexStr = codes.map((rune) => rune.toRadixString(16)).toList().join("");
  return hexStr;
}

/// Takes an hexadecimal [String] and parses its values to a regular [String]
String hex2String(String str) {
  RegExp regExp = new RegExp("([0-9a-z]){2}");
  String result = '';
  regExp.allMatches(str).forEach((d) {
    for (int i = 0; i < d.groupCount; i++) {
      result +=
          String.fromCharCode(int.parse(d.group(i).toString(), radix: 16));
    }
  });

  return result;
}

void main() {
  testing(
      value: 'Hello world!',
      expected: '48656c6c6f20776f726c6421',
      callback: str2Hex);
  testing(
      value: 'This is a test',
      expected: '5468697320697320612074657374',
      callback: str2Hex);
  testing(
      value: 'This is another test',
      expected: '5468697320697320616e6f746865722074657374',
      callback: str2Hex);

  testing(
      value: '48656c6c6f20776f726c6421',
      expected: 'Hello world!',
      callback: hex2String);
  testing(
      value: '5468697320697320612074657374',
      expected: 'This is a test',
      callback: hex2String);
  testing(
      value: '5468697320697320616e6f746865722074657374',
      expected: 'This is another test',
      callback: hex2String);
}
