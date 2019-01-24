# When ubsan is turned on, we will see type mismatch.
UBSAN_FLAG="-fsanitize=undefined"
# When ubsan is turned off, everything will be fine.
#UBSAN_FLAG=""

COMPILER_FLAG="$UBSAN_FLAG -fPIC -fvisibility=hidden -fvisibility-inlines-hidden"

g++ $COMPILER_FLAG -c foo.cc
g++ $COMPILER_FLAG -c foo_register.cc
g++ $COMPILER_FLAG -c foo_main.cc

g++ -shared $UBSAN_FLAG -o libfoo.so foo.o
g++ -shared $UBSAN_FLAG -o libfoo_register.so foo_register.o -L. -lfoo
g++ $UBSAN_FLAG -o main foo_main.cc -L. -lfoo -lfoo_register
