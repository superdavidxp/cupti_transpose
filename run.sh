#!/bin/bash
./cupti_transpose 0 achieved_occupancy
echo -------------------------------------------------------
./cupti_transpose 0 branch_efficiency
echo -------------------------------------------------------
./cupti_transpose 0 dram_read_throughput
echo -------------------------------------------------------
./cupti_transpose 0 dram_write_throughput
echo -------------------------------------------------------
./cupti_transpose 0 flop_count_sp
echo -------------------------------------------------------
./cupti_transpose 0 flop_sp_efficiency
echo -------------------------------------------------------
./cupti_transpose 0 gld_efficiency
echo -------------------------------------------------------
./cupti_transpose 0 gld_throughput
echo -------------------------------------------------------
./cupti_transpose 0 gst_throughput
echo -------------------------------------------------------
./cupti_transpose 0 sm_activity
echo -------------------------------------------------------
./cupti_transpose 0 l2_utilization
echo -------------------------------------------------------
./cupti_transpose 0 local_hit_rate
echo -------------------------------------------------------
./cupti_transpose 0 tex_cache_hit_rate
echo -------------------------------------------------------
./cupti_transpose 0 shared_efficiency
echo -------------------------------------------------------
./cupti_transpose 0 sm_efficiency
