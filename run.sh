#!/bin/bash
./cupti_vecadd 0 achieved_occupancy
echo -------------------------------------------------------
./cupti_vecadd 0 branch_efficiency
echo -------------------------------------------------------
./cupti_vecadd 0 dram_read_throughput
echo -------------------------------------------------------
./cupti_vecadd 0 dram_write_throughput
echo -------------------------------------------------------
./cupti_vecadd 0 flop_count_sp
echo -------------------------------------------------------
./cupti_vecadd 0 flop_sp_efficiency
echo -------------------------------------------------------
./cupti_vecadd 0 gld_efficiency
echo -------------------------------------------------------
./cupti_vecadd 0 gld_throughput
echo -------------------------------------------------------
./cupti_vecadd 0 gst_throughput
echo -------------------------------------------------------
./cupti_vecadd 0 sm_activity
echo -------------------------------------------------------
./cupti_vecadd 0 l2_utilization
echo -------------------------------------------------------
./cupti_vecadd 0 local_hit_rate
echo -------------------------------------------------------
./cupti_vecadd 0 tex_cache_hit_rate
echo -------------------------------------------------------
./cupti_vecadd 0 shared_efficiency
echo -------------------------------------------------------
./cupti_vecadd 0 sm_efficiency
