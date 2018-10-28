# luv

**luv** is a binding to [libuv][libuv], the native async I/O library that powers Node.js.

libuv does things like file I/O, TCP servers, and DNS resolution. It is supported on Linux, macOS, Windows, and many other platforms.

luv, the binding, takes care of all the difficult parts of interfacing libuv with Reason/OCaml, such as memory management and OCaml threading support. It aims to be...

- **Minimalist** &mdash; luv does the minimum wrapping necessary to do memory management and provide a decent ML API. luv tries to be as unopinionated as possible.
- **Maintainable** &mdash; luv uses [Ctypes][ctypes] to minimize the need for writing C code, and [vendors][vendor] libuv.

<br/>

## Trying

luv is a work in progress, currently a prototype. Only TCP is implemented, but it is implemented correctly (i.e., with memory management, etc).

The only thing to do with luv right now is to run its test cases, and try the [examples][examples].

```
git clone --recursive-submodules https://github.com/aantron/luv.git
cd luv
opam install --unset-root alcotest ctypes dune
make libuv
make test
dune exec example/http_get.exe
```

This probably only works on Linux at the moment.

<br/>

## Roadmap

- [x] File I/O.
- [x] Process API, pipes.
- [ ] TTYs, UDP.
- [ ] FS events, FS polling.
- [ ] The rest (thread pool, DNS, `dlopen`).
- [ ] OCaml threading, signals, exceptions.
- [ ] Look into using luv for native Node.js modules.
- [ ] Vendor correctly on macOS, Windows.

[libuv]: http://libuv.org/
[ctypes]: https://github.com/ocamllabs/ocaml-ctypes
[vendor]: https://github.com/aantron/luv/tree/master/src/vendor
[examples]: https://github.com/aantron/luv/tree/master/example