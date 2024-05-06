import "dart:io";
import "dart:math";

bool isPalindrome(int number) {
  int original = number;
  int reversed = 0;

  while (number > 0) {
    reversed = reversed * 10 + number % 10;
    number = number ~/ 10;
  }

  return original == reversed;
}

int largestPalindrome(int len) {
  int largest = 0;

  int upperLimit = pow(10, len).round();
  int lowerLimit = pow(10, len - 1).round();

  for (int i = upperLimit; i >= lowerLimit; i--) {
    for (int j = i; j >= lowerLimit; j--) {
      int product = i * j;
      if (isPalindrome(product) && product > largest) {
        largest = product;
      }
    }
  }

  return largest;
}

void main() {
  int userChoice = 0;

  while (userChoice != -1) {
    print("Enter a number to check if it is a palindrome, print -1 to stop\n");
    stdout.write("your choice here: ");
    userChoice = int.parse(stdin.readLineSync()!);
    if (userChoice == -1) {
      break;
    }
    print(isPalindrome(userChoice));
  }
}
