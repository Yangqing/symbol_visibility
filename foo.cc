#include <iostream>
#include "foo.h"

namespace my {
void Foo() {
	std::cout << "my foo." << std::endl;
	Bar();
}
}