String createPhoneNumber(List numbers) =>
    "(${numbers.join('').substring(0, 3)}) ${numbers.join('').substring(3, 6)}-${numbers.join('').substring(6)}";

main() {
  print(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]));
  print(createPhoneNumber([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]));
  print(createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]));
}
