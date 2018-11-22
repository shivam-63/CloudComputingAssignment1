#DD_OUTPUT=$(dd if=/dev/zero of=test.img bs=1000000 count=100 2>&1)
#100+0 records in 100+0 records out 100000000 bytes (100 MB) cecho $DD_HUMANIZED
DD_OUTPUT=$(dd if=/dev/zero of=test.img bs=1000000 count=100 2>&1)
#100+0 records in 100+0 records out 100000000 bytes (100 MB) copied, 0.0450804 s, 2.2 GB/s
#echo $DD_OUTPUT
DD_HUMANIZED=$(echo "$DD_OUTPUT" | sed -r '/.*records /d' | tr -d '()' | awk '{printf "%.0f\n", ($8*1024)*1024*1024 }')
echo $DD_HUMANIZED

