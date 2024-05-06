//euler challenge 5 devsplug , code by paul_lilian
import 'dart:io';

int even_fibonacci(int limit) {

  /* this program returns the sum of 
    fibonacci numbers up to a limit
   */

  int sum = 0;

  if (limit == 0 || limit == 1) return limit;

  int previous_sum = 0, next_sum = 1;

  for (int i = 2; i <= limit; i++) {
    int total = previous_sum + next_sum;
    previous_sum = next_sum;
    next_sum = total;

    if (total >= limit) return sum;

    if (next_sum % 2 == 0) {
      sum += next_sum;
    }
  }

  return sum;
}

void main() {

  stdout.write("enter the limit: ");
  int user_limit = int.parse(stdin.readLineSync()!);
  int result = even_fibonacci(user_limit);
  print('the sum is $result');
  
}
