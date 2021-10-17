bool validParentheses(String p) => RegExp(r"^\((\(.*\))\)$").hasMatch(p);

void main() {
  print(validParentheses("()()((()"));
  print(validParentheses("(())((()((()))))"));
  print(validParentheses("()()()"));
  print(validParentheses("()(()"));
  print(validParentheses(")()()"));
}
