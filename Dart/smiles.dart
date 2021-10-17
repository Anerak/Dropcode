int countSmileys(List<String> arr) {
  if (arr.isEmpty) return 0;
  RegExp rx = RegExp(r"[:;]{1}[-~]{0,1}[)D]{1}");
  return arr.where((smile) => rx.hasMatch(smile)).length;
}

void main() {
  print(countSmileys([]));
  print(countSmileys([':)', ';)', ':~D']));
  print(countSmileys([':(', ';-)', ':~D']));
}
