include $(shell ocamlc -where)/Makefile.config

COMPFLAGS=-w +A-4-9-40-42
OCAMLC=ocamlc $(COMPFLAGS)
OCAMLOPT=ocamlopt $(COMPFLAGS)
EASYCALC=../src/easyCalc.mli ../src/easyCalc.ml
LIB=easyCalc.mli easyCalc.ml
SRC=test.ml


all: $(EASYCALC) $(SRC)
	cp ../src/easyCalc.ml* .
	$(OCAMLC) -o test $(LIB) $(SRC)
	rm -f easyCalc.*
	./test

opt: $(EASYCALC) $(SRC)
	$(OCAMLOPT) -o test $(LIB) $(SRC)
	rm -f easyCalc.*
	./test

clean:
	rm -f test *.cm*
