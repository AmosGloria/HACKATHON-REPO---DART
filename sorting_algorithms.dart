// sorting_algorithms.dart

import 'dart:core';
import 'dart:math';

// Bubble Sort
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (list[j] > list[j + 1]) {
        // Swap
        int temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
  return list;
}

// Quick Sort
List<int> quickSort(List<int> list) {
  if (list.length <= 1) {
    return list;
  }

  int pivot = list[list.length ~/ 2];
  List<int> less = list.where((x) => x < pivot).toList();
  List<int> equal = list.where((x) => x == pivot).toList();
  List<int> greater = list.where((x) => x > pivot).toList();

  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

// Function to test sorting algorithms
void testSortingAlgorithms() {
  List<int> data = List.generate(1000, (i) => Random().nextInt(1000));

  // Bubble Sort
  var start = DateTime.now();
  List<int> bubbleSorted = bubbleSort(List.from(data));
  var bubbleSortDuration = DateTime.now().difference(start);

  // Quick Sort
  start = DateTime.now();
  List<int> quickSorted = quickSort(List.from(data));
  var quickSortDuration = DateTime.now().difference(start);

  print('Bubble Sort Duration: ${bubbleSortDuration.inMilliseconds}ms');
  print('Quick Sort Duration: ${quickSortDuration.inMilliseconds}ms');

  // Verify the sorting
  print('Bubble Sort is correct: ${isSorted(bubbleSorted)}');
  print('Quick Sort is correct: ${isSorted(quickSorted)}');
}

bool isSorted(List<int> list) {
  for (int i = 0; i < list.length - 1; i++) {
    if (list[i] > list[i + 1]) {
      return false;
    }
  }
  return true;
}

void main() {
  testSortingAlgorithms();
}
