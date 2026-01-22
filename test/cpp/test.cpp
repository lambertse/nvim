#include <iostream>
#include <vector>
// Test cppcheck and clang-tidy
int main() {
  int *ptr = new int(42); // cppcheck: memory leaktest
  int x;                  // cppcheck: uninitialized variable
}
