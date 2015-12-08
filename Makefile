cc := arm-linux-androideabi-gcc

sys_root := /Users/Edgar/.opam/4.02.3+32bit/lib/android-ndk/platforms/android-21/arch-arm

includes := /Users/Edgar/.opam/4.02.3+32bit/arm-linux-androideabi/include

ml_includes := /Users/Edgar/.opam/4.02.3+32bit/arm-linux-androideabi/lib/ocaml/

libs := /Users/Edgar/.opam/4.02.3+32bit/arm-linux-androideabi/lib

# Be sure to do export LD_LIBRARY_PATH=. and then run the program.
# Not sure how to do static linking yet, this will only dynamically
# link the program
complete: lib
	$(cc) --sysroot $(sys_root) -I$(includes) -L$(libs) \
	-pie -I$(ml_includes) hello.so main.c -o Finished

lib:
	ocamlfind -toolchain android ocamlopt -output-complete-obj \
	-cclib '-lm -shared' hello.ml -o hello.so

# This is a pure OCaml exectuable
exec:
	ocamlfind -toolchain android ocamlopt \
	-verbose -ccopt '-fPIE' -cclib '-pie' hello.ml -o hello

.PHONY: clean
clean:
	@rm -rf *.{cmi,cmt,o,cmx,so} Finished
