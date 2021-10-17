import "dart:core";
import "dart:math";

int evaporator(double content, double evap_per_day, double threshold) {
	double per = (content / 100) * threshold;
	int times = 0;
	print(per);
	while (content > per) {
		content -= (content / 100) * evap_per_day;
		print(content);
		times++;
	}
	return times;
}

void main() {
	print("This is the result of ${evaporator(100, 5, 5)}");
}
