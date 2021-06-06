SHELL := /bin/bash

CXX := gcc
CXXFLAGS := -std=c99 -fno-stack-protector -m32 -z execstack
BIN := vuln
SRC := vuln.c

build:	clean
	$(CXX) $(CXXFLAGS) -o $(BIN) $(SRC)

clean:
	rm $(BIN) || true

debug: build
	gdb -q $(BIN)
