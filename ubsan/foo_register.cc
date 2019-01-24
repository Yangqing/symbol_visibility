#include <iostream>
#include "foo.h"

Holder<Foo> ActualFunction(Holder<Foo>) {
  std::cout << "Running actual function in foo_register.cc." << std::endl;
  return Holder<Foo>();
}

static class HolderFunctionRegisterer {
 public:
  HolderFunctionRegisterer() {
    std::cout << "Registering holder function." << std::endl;
    g_func = &ActualFunction;
  }
} g_registerer;
