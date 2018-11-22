#!/bin/bash
EXECUTABLE="memsweep"
if [ ! -e $EXECUTABLE ] ; then
	echo "Compiling memsweep.c (requires GNU compiler collection) "
	gcc -O -o memsweep memsweep.c -lm
fi

echo "Running memsweep benchmark"
if [ "$SYSTEMROOT" = "C:\Windows" ] ; then
	./memsweep.exe
else
	./memsweep
fi
