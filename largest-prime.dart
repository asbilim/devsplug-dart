import 'dart:math';
import 'dart:io';

int largestPrimeFactor(int limit) {
  int p = 2;

  while (limit >= pow(p, 2)) {
    if (limit % p == 0) {
      limit = (limit / p).round();
    } else {
      p++;
    }
  }

  return limit;
}

void main() {
  stdout.write("please enter a limit: ");
  int limit = int.parse(stdin.readLineSync()!);
  print(largestPrimeFactor(limit));
}
