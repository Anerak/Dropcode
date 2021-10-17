Map<String, int> hexToRGB(String hex) {
  hex = hex.replaceAll('#', '');
  Map<String, int> rgb = {
    'r': int.parse(hex.substring(0, 2), radix: 16),
    'g': int.parse(hex.substring(2, 4), radix: 16),
    'b': int.parse(hex.substring(4, 6), radix: 16),
  };
  return rgb;
}

main() {
  String foo = "#FF9933";
  print(hexToRGB(foo));
}
