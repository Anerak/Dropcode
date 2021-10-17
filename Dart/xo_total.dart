bool XO(str) => 'x'.allMatches(str.toLowerCase()).length == 'o'.allMatches(str.toLowerCase()).length;

void main() {
	print("${XO('xo')}, ${XO('XO')}, ${XO('xxo')}");

}
