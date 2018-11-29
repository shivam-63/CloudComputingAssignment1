# Perform a random read test on a random 32MB file

# grep the line containing aggregated read speed result
# get the 3rd item of the output line (aggrb)
# Leave only digits in the output to get a read speed in KB/s
var=$(fio --name=randread --ioengine=libaio --iodepth=2 --rw=randread --bs=4k --direct=0 --size=16M --numjobs=1 --runtime=15 --group_reporting | grep aggrb | awk '{printf $3}' | sed 's/[^0-9]//g')
# multiply by 1024 to get a number of bytes/s
echo $(($var * 1024))
