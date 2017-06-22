# cupti_transpose

The current OUTPUT:

**
dmu@Z87UB1604:~/Workspaces/cupti_transpose$ ./run.sh
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 321.252533
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 13 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 89 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	active_warps = 15930045326 (993388250, 994287808, 993268856, 993431960, 1001641902, 1001976064, 1000893220, 1000595932, 993396420, 993614808, 992608324, 993364472, 993998018, 995189990, 994304064, 994085238)
	active_warps (normalized) (15930045326 * 16) / 16 = 15930045326
	active_cycles = 265046438 (16530108, 16528999, 16529835, 16530167, 16666045, 16665021, 16665912, 16665532, 16527204, 16527309, 16526211, 16527104, 16538737, 16539628, 16539750, 16538876)
	active_cycles (normalized) (265046438 * 16) / 16 = 265046438
Metric achieved_occupancy = 0.939107
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.680603
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 90 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	branch = 6553600 (409612, 409744, 409424, 409520, 409244, 409460, 408952, 409216, 409956, 409564, 409720, 409936, 409888, 410084, 409452, 409828)
	branch (normalized) (6553600 * 16) / 16 = 6553600
	divergent_branch = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	divergent_branch (normalized) (0 * 16) / 16 = 0
Metric branch_efficiency = 100.000000%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 319.142975
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	fb_subp0_read_sectors = 13250439 (3312576, 3312602, 3312620, 3312641)
	fb_subp0_read_sectors (normalized) (13250439 * 4) / 4 = 13250439
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	fb_subp1_read_sectors = 13198068 (3299456, 3299480, 3299564, 3299568)
	fb_subp1_read_sectors (normalized) (13198068 * 4) / 4 = 13198068
/home/dmu/Workspaces/cupti_transpose/cupti_transpose.cu:551: error: function cuptiMetricGetValue(device, metricId, metricData.numEvents * sizeof(CUpti_EventID), metricData.eventIdArray, metricData.numEvents * sizeof(uint64_t), metricData.eventValueArray, kernelDuration, &metricValue) failed with error CUPTI_ERROR_INVALID_METRIC_VALUE.
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 318.334900
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	fb_subp0_write_sectors = 6556388 (1639084, 1639093, 1639112, 1639099)
	fb_subp0_write_sectors (normalized) (6556388 * 4) / 4 = 6556388
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	fb_subp1_write_sectors = 6556415 (1639078, 1639080, 1639141, 1639116)
	fb_subp1_write_sectors (normalized) (6556415 * 4) / 4 = 6556415
/home/dmu/Workspaces/cupti_transpose/cupti_transpose.cu:551: error: function cuptiMetricGetValue(device, metricId, metricData.numEvents * sizeof(CUpti_EventID), metricData.eventIdArray, metricData.numEvents * sizeof(uint64_t), metricData.eventValueArray, kernelDuration, &metricValue) failed with error CUPTI_ERROR_INVALID_METRIC_VALUE.
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 318.655212
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 104857600 (6806336, 6695360, 6827008, 6931392, 6419392, 6450880, 6538880, 6361088, 6513344, 6590784, 6563712, 6518848, 6411136, 6408576, 6418048, 6402816)
	event_name (normalized) (104857600 * 16) / 16 = 104857600
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Metric flop_count_sp = 104857600
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 319.235260
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 87 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 104857600 (6795008, 6689856, 6808384, 6935488, 6425856, 6456896, 6532416, 6359296, 6528832, 6608704, 6576000, 6525696, 6401344, 6409600, 6415296, 6388928)
	event_name (normalized) (104857600 * 16) / 16 = 104857600
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	elapsed_cycles_sm = 265111512 (16532517, 16532517, 16532517, 16532517, 16672202, 16672202, 16672202, 16672202, 16528645, 16528645, 16528645, 16528645, 16544514, 16544514, 16544514, 16544514)
	elapsed_cycles_sm (normalized) (265111512 * 16) / 16 = 265111512
Metric flop_sp_efficiency = 0.154501%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 319.765991
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 3 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	event_name = 19660776 (1228176, 1229016, 1228320, 1228392, 1229808, 1229112, 1228632, 1229544, 1228176, 1228800, 1228776, 1228656, 1229040, 1228848, 1228488, 1228992)
	event_name (normalized) (19660776 * 16) / 16 = 19660776
	event_name = 39321648 (2456352, 2458032, 2456592, 2456736, 2459616, 2458272, 2457264, 2459088, 2456400, 2457648, 2457552, 2457312, 2458080, 2457696, 2456976, 2458032)
	event_name (normalized) (39321648 * 16) / 16 = 39321648
Pass 2
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 314572800 (19646208, 19656768, 19647168, 19664256, 19737216, 19752384, 19744512, 19757184, 19535616, 19549056, 19545408, 19556352, 19681728, 19696896, 19698816, 19703232)
	event_name (normalized) (314572800 * 16) / 16 = 314572800
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Metric gld_efficiency = 66.666640%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.361359
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 89 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	event_name = 19660752 (1228728, 1228272, 1228872, 1230768, 1227960, 1227576, 1229136, 1229952, 1228728, 1229520, 1227960, 1228056, 1228464, 1228488, 1228656, 1229616)
	event_name (normalized) (19660752 * 16) / 16 = 19660752
	event_name = 39321696 (2457456, 2456544, 2457792, 2461536, 2455920, 2455152, 2458320, 2459904, 2457504, 2459088, 2455920, 2456064, 2456928, 2456976, 2457360, 2459232)
	event_name (normalized) (39321696 * 16) / 16 = 39321696
/home/dmu/Workspaces/cupti_transpose/cupti_transpose.cu:551: error: function cuptiMetricGetValue(device, metricId, metricData.numEvents * sizeof(CUpti_EventID), metricData.eventIdArray, metricData.numEvents * sizeof(uint64_t), metricData.eventValueArray, kernelDuration, &metricValue) failed with error CUPTI_ERROR_INVALID_METRIC_VALUE.
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 317.547974
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 87 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 6553576 (409272, 409848, 409568, 409872, 409696, 409912, 409368, 409992, 408952, 409880, 409064, 410000, 409544, 409776, 409152, 409680)
	event_name (normalized) (6553576 * 16) / 16 = 6553576
	event_name = 13107248 (818544, 819696, 819136, 819760, 819408, 819840, 818752, 820000, 817888, 819760, 818128, 819984, 819104, 819568, 818304, 819376)
	event_name (normalized) (13107248 * 16) / 16 = 13107248
/home/dmu/Workspaces/cupti_transpose/cupti_transpose.cu:551: error: function cuptiMetricGetValue(device, metricId, metricData.numEvents * sizeof(CUpti_EventID), metricData.eventIdArray, metricData.numEvents * sizeof(uint64_t), metricData.eventValueArray, kernelDuration, &metricValue) failed with error CUPTI_ERROR_INVALID_METRIC_VALUE.
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.362274
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	elapsed_cycles_sm = 265134992 (16532314, 16532314, 16532314, 16532314, 16673310, 16673310, 16673310, 16673310, 16531753, 16531753, 16531753, 16531753, 16546371, 16546371, 16546371, 16546371)
	elapsed_cycles_sm (normalized) (265134992 * 16) / 16 = 265134992
	active_cycles = 265070559 (16528646, 16528492, 16528733, 16528434, 16669504, 16669687, 16667317, 16668528, 16528054, 16527763, 16528062, 16527781, 16542625, 16542048, 16542401, 16542484)
	active_cycles (normalized) (265070559 * 16) / 16 = 265070559
Metric sm_activity = 99.975698%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.060486
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	elapsed_cycles_sm = 265039852 (16525896, 16525896, 16525896, 16525896, 16667308, 16667308, 16667308, 16667308, 16525653, 16525653, 16525653, 16525653, 16541106, 16541106, 16541106, 16541106)
	elapsed_cycles_sm (normalized) (265039852 * 16) / 16 = 265039852
	l2_subp0_total_read_sector_queries = 26309629 (1650284, 1650280, 1650300, 1650284, 1650344, 1650300, 14757529, 1650308)
	l2_subp0_total_read_sector_queries (normalized) (26309629 * 8) / 8 = 26309629
	l2_subp1_total_read_sector_queries = 26404790 (3300568, 3300576, 3300588, 3300568, 3300624, 3300584, 3300678, 3300604)
	l2_subp1_total_read_sector_queries (normalized) (26404790 * 8) / 8 = 26404790
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	l2_subp0_total_write_sector_queries = 6553600 (819200, 819200, 819200, 819200, 819200, 819200, 819200, 819200)
	l2_subp0_total_write_sector_queries (normalized) (6553600 * 8) / 8 = 6553600
	l2_subp1_total_write_sector_queries = 13107212 (1638408, 1638400, 1638400, 1638400, 1638400, 1638400, 1638404, 1638400)
	l2_subp1_total_write_sector_queries (normalized) (13107212 * 8) / 8 = 13107212
Metric l2_utilization = utilization level 3
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.132416
MEMORY_CPY [ ID 1/105/0 :: 67 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Metric local_hit_rate = 0.000000%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 321.096313
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	tex0_cache_sector_queries = 52428736 (3278080, 3278464, 3276480, 3280896, 3272704, 3276672, 3277696, 3282304, 3274752, 3275776, 3274368, 3277504, 3271808, 3276800, 3276480, 3277952)
	tex0_cache_sector_queries (normalized) (52428736 * 16) / 16 = 52428736
	tex1_cache_sector_queries = 104857728 (6556288, 6556928, 6552960, 6561792, 6545280, 6553344, 6555392, 6564608, 6549504, 6551552, 6548864, 6555008, 6543616, 6553472, 6553088, 6556032)
	tex1_cache_sector_queries (normalized) (104857728 * 16) / 16 = 104857728
	l2_subp0_read_tex_sector_queries = 26214400 (1638400, 1638400, 1638400, 1638400, 1638400, 1638400, 14745600, 1638400)
	l2_subp0_read_tex_sector_queries (normalized) (26214400 * 8) / 8 = 26214400
	l2_subp1_read_tex_sector_queries = 26214400 (3276800, 3276800, 3276800, 3276800, 3276800, 3276800, 3276800, 3276800)
	l2_subp1_read_tex_sector_queries (normalized) (26214400 * 8) / 8 = 26214400
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	l2_subp0_write_tex_sector_queries = 6553600 (819200, 819200, 819200, 819200, 819200, 819200, 819200, 819200)
	l2_subp0_write_tex_sector_queries (normalized) (6553600 * 8) / 8 = 6553600
	l2_subp1_write_tex_sector_queries = 13107200 (1638400, 1638400, 1638400, 1638400, 1638400, 1638400, 1638400, 1638400)
	l2_subp1_write_tex_sector_queries (normalized) (13107200 * 8) / 8 = 13107200
Metric tex_cache_hit_rate = 54.166685%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 320.511322
MEMORY_CPY [ ID 1/105/0 :: 66 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 89 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Pass 1
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 104857600 (6802752, 6711936, 6824448, 6937024, 6420672, 6431936, 6521280, 6335424, 6513408, 6615168, 6582592, 6533568, 6415552, 6405056, 6413696, 6393088)
	event_name (normalized) (104857600 * 16) / 16 = 104857600
Pass 2
Launching kernel: blocks 1638400, thread/block 64
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
	event_name = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	event_name (normalized) (0 * 16) / 16 = 0
Pass 3
Launching kernel: blocks 1638400, thread/block 64
	shared_ld_transactions = 0 (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
	shared_ld_transactions (normalized) (0 * 16) / 16 = 0
	shared_st_transactions = 3276800 (204924, 204976, 204838, 205014, 204740, 204920, 204910, 204790, 204802, 204812, 204394, 204694, 204730, 205004, 204594, 204658)
	shared_st_transactions (normalized) (3276800 * 16) / 16 = 3276800
Metric shared_efficiency = 100.000000%
-------------------------------------------------------
Usage: ./cupti_transpose [device_num] [metric_name]
CUDA Device Number: 0
CUDA Device Name: GeForce GTX 980
Launching kernel: blocks 1638400, thread/block 64
|    time 318.955017
MEMORY_CPY [ ID 1/105/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_CPY [ ID 1/106/0 :: 65 (ms) :: 419430400 (bytes) :: 1/1/3 (Kind)]
MEMORY_SET [ ID 1/107/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
MEMORY_SET [ ID 1/108/0 :: 2 (ms) :: 419430400 (bytes) :: 3 (Kind) :: 0 (value) ]
KERNEL_RUN [ ID 1/114/0 :: 12 (ms) :: 64/1/1 (block) :: 3 (gridID) :: 8 (RegPerThd) :: 0/256 (SharedMem) :: 0/38273024 (LocMem) ]
MEMORY_CPY [ ID 1/115/0 :: 88 (ms) :: 419430400 (bytes) :: 2/3/1 (Kind)]
Pass 0
Launching kernel: blocks 1638400, thread/block 64
	elapsed_cycles_sm = 265089944 (16530093, 16530093, 16530093, 16530093, 16671160, 16671160, 16671160, 16671160, 16527278, 16527278, 16527278, 16527278, 16543955, 16543955, 16543955, 16543955)
	elapsed_cycles_sm (normalized) (265089944 * 16) / 16 = 265089944
	active_cycles = 265020628 (16525825, 16525398, 16525980, 16525938, 16666423, 16667393, 16667393, 16666880, 16522993, 16523117, 16521717, 16522764, 16539894, 16539690, 16539604, 16539619)
	active_cycles (normalized) (265020628 * 16) / 16 = 265020628
Metric sm_efficiency = 99.973852%

