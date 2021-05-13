#!/bin/bash
ca65 test.s -o test.o
ld65 -C test.cfg test.o -o test.bin
pushd ..
python3 ./py/MakeMem.py
popd