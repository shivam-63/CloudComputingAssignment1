#!/bin/bash 
EXECUTABLE="linpack"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling linpack.c (requires GNU compiler collection)"
	gcc -O -o linpack linpack.c -lm
fi

echo "Running linpack benchmark"

if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
	result=$(./linpack.exe | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
else
	result=$(./${EXECUTABLE} | tail -1 | sed "s/[[:blank:]]\+/ /g" | cut -d " " -f 7)
fi
echo "Benchmark result: $result KFLOPS"
