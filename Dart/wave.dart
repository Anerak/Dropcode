List<String> wave(String str) {
  List<String> letters;
  List<String> result = [];

  for (int i = 0; i < str.length; i++) {
    letters = str.toLowerCase().split('');
    if (letters[i] == ' ') continue;
    letters[i] = letters[i].toUpperCase();
    result.add(letters.join());
  }

  return result;
}

void main() {
  print(wave("Hello"));
}
