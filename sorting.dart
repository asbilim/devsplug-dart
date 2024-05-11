import "dart:io";
import "dart:math";

class Sorter {
  int? arraySize;
  int? size = 10;
  List<int>? userArray;

  Sorter(this.size) {
    this.userArray = List<int>.filled(size!, 0);
    for (int i = 0; i < size!; i++) {
      this.userArray![i] = Random().nextInt(100) + 1;
    }
    this.arraySize = userArray!.length;
  }

  void regenerate() {
    for (int i = 0; i < size!; i++) {
      this.userArray![i] = Random().nextInt(100) + 1;
    }
  }

  void swap(List<int> array, int index_1, index_2) {
    int temp = this.userArray![index_1];
    this.userArray![index_1] = this.userArray![index_2];
    this.userArray![index_2] = temp;
  }

  void displayArray() {
    for (int i = 0; i < this.arraySize!; i++) {
      stdout.write("${this.userArray![i]} ");
    }
    print("\n");
  }

  void showArraySize() {
    print("the current array size is ${this.arraySize}");
  }

  int quickSortPartition(List<int> array, int lowIndex, int highIndex) {
    int pivot = array[highIndex];
    int tempIndex = lowIndex;

    for (int i = lowIndex; i < highIndex; i++) {
      if (array[i] <= pivot) {
        swap(array, tempIndex, i);
        tempIndex++;
      }
    }

    swap(array, tempIndex, highIndex);
    return tempIndex;
  }

  void quickSort(int lowIndex, int highIndex) {
    if (lowIndex < highIndex) {
      int partitionIndex =
          quickSortPartition(this.userArray!, lowIndex, highIndex);

      quickSort(lowIndex, partitionIndex - 1);
      quickSort(partitionIndex + 1, highIndex);
    }
  }

  void compareSorts() {
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    this.bubbleSort();
    stopwatch.stop();
    int bubbleTime = stopwatch.elapsedMilliseconds;
    stopwatch.reset();
    this.regenerate();

    stopwatch.start();
    quickSort(0, this.arraySize! - 1);
    stopwatch.stop();
    int quickTime = stopwatch.elapsedMilliseconds;

    print("Bubble Sort Time: $bubbleTime ms");
    print("Quick Sort Time: $quickTime ms");
  }

  void bubbleSort() {
    for (int i = 0; i < this.arraySize!; i++) {
      for (int j = 0; j < this.arraySize! - i - 1; j++) {
        int next = j + 1;
        if (this.userArray![j] > this.userArray![next]) {
          swap(this.userArray!, j, j + 1);
        }
      }
    }
  }

  void displayMenu() {
    print("===============================================");
    print("||               Sorting Menu                ||");
    print("===============================================");
    print("|| 1. Display Current Array                  ||");
    print("|| 2. Sort Using Bubble Sort                 ||");
    print("|| 3. Sort Using Quick Sort                  ||");
    print("|| 4. Regenerate Array                       ||");
    print("|| 5. Compare Sorting Efficiency             ||");
    print("|| 6. Exit                                   ||");
    print("===============================================");
  }
}

void main() {
  stdout.write("let's start by defining the array size: ");
  int size = int.parse(stdin.readLineSync()!);

  Sorter sorter = Sorter(size);

  while (true) {
    sorter.displayMenu();
    stdout.write("Choose an option: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        sorter.displayArray();
        break;
      case "2":
        sorter.bubbleSort();
        sorter.displayArray();
        break;
      case "3":
        sorter.quickSort(0, sorter.arraySize! - 1);
        sorter.displayArray();
        break;
      case "4":
        sorter.regenerate();
        sorter.displayArray();
        break;
      case "5":
        sorter.compareSorts();
        break;
      case "6":
        print("Exiting the program...");
        return;
      default:
        print("Invalid choice. Please try again.");
        break;
    }
  }
}
