// palindrome_checker.dart

import 'dart:core';

bool isPalindrome(String input) {
  // Remove spaces, punctuation, and convert to lowercase
  String cleaned = input.replaceAll(RegExp(r'[\W_]+'), '').toLowerCase();

  // Check if cleaned string is equal to its reverse
  return cleaned == cleaned.split('').reversed.join('');
}

void main() {
  // Example usage
  print(isPalindrome("A man, a plan, a canal, Panama")); // true
  print(isPalindrome("Hello, World!")); // false
}
