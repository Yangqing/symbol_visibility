g++ -fPIC -c foo.cc
g++ -fPIC -c -fvisibility=hidden foo_bar.cc
g++ -fPIC -c another_bar.cc
g++ -fPIC -c main.cc

g++ -shared -o libfoo.so foo.o foo_bar.o
g++ -shared -o libanother_bar.so another_bar.o

g++ -o main1 main.cc -L. -lfoo -lanother_bar
g++ -o main2 main.cc -L. -lanother_bar -lfoo 

echo "MAIN1"
LD_LIBRARY_PATH=. strace ./main1


echo "MAIN2"
LD_LIBRARY_PATH=. strace ./main2