String spinWords(String str) => str
    .split(" ")
    .map((word) => word.length >= 5 ? word.split("").reversed.join("") : word)
    .join(" ");

main() {
  print(spinWords("Welcome"));
  print(spinWords("Hey fellow warriors"));
  print(spinWords("This is a test"));
  print(spinWords("This is another test"));
}
