#include <iostream>
#include "foo.h"

Holder<Foo> ActualFunctionInMain(Holder<Foo>) {
  std::cout << "Running actual function in foo_main.cc." << std::endl;
  return Holder<Foo>();
}

int main(int argc, char** argv) {
  Holder<Foo> dummy_holder;
  ActualFunctionInMain(dummy_holder);
  FunctionType pointer = g_func;
  pointer(dummy_holder);
  return 0;
}
