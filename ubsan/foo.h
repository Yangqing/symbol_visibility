class Foo {};

template <class C>
class Holder {
 public:
  Holder() : obj_() {}

 private:
  C obj_;
};

typedef Holder<Foo> (*FunctionType)(Holder<Foo>);

extern __attribute__((visibility("default"))) FunctionType g_func;
