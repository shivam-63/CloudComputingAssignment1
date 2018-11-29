#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

echo $(printf "%s\n" $(date +%s)",";./measure-disk-sequential.sh) >> measure-disk-sequential.csv
echo $(printf "%s\n" $(date +%s)",";./measure-disk-random.sh) >> measure-disk-random.csv
echo $(printf "%s\n" $(date +%s)",";./measure-mem.sh) >> memsweep-mem.csv
echo $(printf "%s\n" $(date +%s)",";./measure-cpu.sh) >> measure-cpu.csv



