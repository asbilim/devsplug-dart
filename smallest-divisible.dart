import "dart:math";
import "dart:io";

int lowestCommonMultiple(int a, int b) {
  return (a * b) ~/ a.gcd(b);
}

int smallestFactor(int range) {
  int lcm = 1;

  for (int i = 2; i < range; i++) {
    lcm = lowestCommonMultiple(lcm, i + 1);
  }

  return lcm;
}

void main() {
  print(smallestFactor(20)); //output 232792560
  print("hello world!");
}
