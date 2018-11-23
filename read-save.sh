#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo $(printf "%s\n" $(date +%s)",";./cloud/read.sh) >> measure-disk-sequential.csv
echo $(printf "%s\n" $(date +%s)",";./cloud/read-random.sh) >> measure-disk-random.csv
echo $(printf "%s\n" $(date +%s)",";./cloud/memsweep-edit.sh) >> memsweep-mem.csv
echo $(printf "%s\n" $(date +%s)",";./cloud/linpack-edit.sh) >> memsweep-cpu.csv



