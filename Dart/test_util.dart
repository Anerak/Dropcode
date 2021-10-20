bool testing(
    {dynamic value = 0, dynamic expected = 0, Function callback = print}) {
  dynamic result = callback(value);
  bool match = expected == result;
  print("$expected == $result: $match\n");
  return match;
}
