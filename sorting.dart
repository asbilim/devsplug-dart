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

  void swap(int index_1, index_2) {
    int temp = this.userArray![index_1];
    this.userArray![index_1] = this.userArray![index_2];
    this.userArray![index_2] = temp;
  }

  void displayArray() {
    for (int i = 0; i < this.arraySize!; i++) {
      stdout.write("${this.userArray![i]} ");
    }
  }

  void showArraySize() {
    print("the current array size is ${this.arraySize}");
  }

  int quickSortPartition(List<int> array, int lowIndex, int highIndex) {
    int pivot = array[highIndex];
    int tempIndex = lowIndex;

    for (int i = lowIndex; i < highIndex; i++) {
      if (array[i] <= pivot) {
        swap(array[tempIndex], array[highIndex]);
        tempIndex++;
      }
    }

    swap(array[tempIndex], array[highIndex]);
    return tempIndex;
  }

  void quickSort() {
    
  }

  void mergeSort() {}

  void heapSort() {}

  void bubbleSort() {
    for (int i = 0; i < this.arraySize!; i++) {
      for (int j = 0; j < this.arraySize! - i - 1; j++) {
        int next = j + 1;
        if (this.userArray![j] > this.userArray![next]) {
          swap(j, j + 1);
        }
      }
    }
    displayArray();
  }
}

void main() {
  Sorter mysorter = new Sorter(40);
  mysorter.displayArray();
  print("\n");
  mysorter.bubbleSort();
}
