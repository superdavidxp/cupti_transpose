# cupti_transpose

The current OUTPUT:

dmu@Z87UB1604:~/Workspaces/cupti_transpose$ ./cupti_transpose
|    allocation size in 838860800 bytes
|    conflict-free transpose
MEMORY_CPY [ ID 1/98/0 :: 33 (ms) :: 419430400 (bytes) :: 1/2/3 (Kind)]
MEMORY_SET [ ID 1/99/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 100 (value) ]
MEMORY_SET [ ID 1/100/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/107/0 :: 5 (ms) :: 32/8/1 (block) :: 3 (gridID) :: 18 (RegPerThd) :: 0/4224 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/111/0 :: 33 (ms) :: 419430400 (bytes) :: 2/3/2 (Kind)]
|    time 5.814304
