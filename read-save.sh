#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo $(printf "%s\n" $(date +%s)",";./read.sh) >> measure-disk-sequential.csv
echo $(printf "%s\n" $(date +%s)",";./read-random.sh) >> measure-disk-random.csv
echo $(printf "%s\n" $(date +%s)",";./memsweep-edit.sh) >> memsweep-mem.csv
echo $(printf "%s\n" $(date +%s)",";./linpack-edit.sh) >> memsweep-cpu.csv



