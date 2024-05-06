int sum_of_multiple_of_3_or_5(int limit) {
  int sum = 0;

  for (int i = 0; i < limit; i++) {
    if (i % 5 == 0 || i % 3 == 0) {
      sum += i;
    }
  }

  return sum;
}

void main() {
  print(sum_of_multiple_of_3_or_5(100));
}
