#include <iostream>
#include <vector>
// Test cppcheck and clang-tidy
int main() {
  int *ptr = new int(42);  // cppcheck: memory leak
  int x;                   // cppcheck: uninitialized variable
  std::vector<int> v;
  v.push_back(1);
  v.push_back(2);

  for (int i = 0; i < v.size(); i++) {  // clang-tidy: use range-based for
    std::cout << v[i] << std::endl;
  }

  std::cout << "Value: " << *ptr << std::endl;
  return 0;
}
