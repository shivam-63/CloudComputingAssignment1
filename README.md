# CCAssignmentOne
## CPU, Memory and Disk Benchmarking

CPU benchmark answers:

1. The Linpack Benchmark is a measure of a computers floating-point rate of execution.
 It is determined by running a computer program that solves a dense system of linear equations.

2. Linpack benchmark measures how fast a computer can solve a dense system of linear equation (generally addition and multiplication).
 The output is a rate of execution represented by a number of floating point operations per second (flops/sec).

Paravirtualization should not affect the Linpack benchmark as no privileged operations are being executed during the benchmark test (no traps needed).
 The only those operations performed, are executed on a CPU.
 Thus, as long as the virtualised machines have dedicated access to the host's resources, paravirtualization will not affect the benchmark results. 

3. Google Cloud supports nested virtualization using the KVM hypervisor, while AWS AMI uses the Xen hypervisor bare metal.
 Bare metal is the highest performing hypervisor for virtualization based on KVM.
 Also, CPU speeds of AWS could be a little better as it uses a bit stronger hardware.
 Thus, AWS gives better and more consistent results which matched our expected result.

 
Memory benchmark answers:

1. The Memsweep benchmark measures memory access time at different locations.
 It accesses the memory such that it hits the heap memory and then releases the space.

We would not expect virtualization to affect the performance tremendously, since every guest system manages its page tables on its own.
 The differences between the virtualized machines should be the result of different memory and a different clock speed of the actual CPU

2. Yes, the memsweep measurements are consistent. The performance of AWS is better than the performance of Google Cloud,
 one of the reasons behind it could be that different type of CPUs are used by both instances.
 They also use differnt hypervisors (XEN vs KVM) and differnt block storages (Elastic Block Store vs. Persistent disk)


Disk benchmark answers:

1. In online benchmarks Google Cloud storage performs significantly better than storage provided by AWS.
 Up to 40,000 IOPs for reads and 30,000 for writes against up to 20,000 IOPs offered by AWS.
 However, in our case results are exactly the opposite. AWS performed much better.
 It turned out that for our small compute engine instance on gcloud the disk performance is limited to 7.50 IOPS for read and 15 IOPS for write,
 while the AWS did not impose such limitations. Thus, our small AWS instance performed better than our small gcloud instance.

2. There is a huge difference between between sequential and random memory access.
 If our data is stored in a continuous block and can be read in a sequential run, then it can be read very quickly as the drive finds the beginning of the sequence.
 On the other hand, if data is spread all over the drive, each portion has to be found independently. Increased access time is essentially wasted time.


