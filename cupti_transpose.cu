#include <stdio.h>
#include <stdlib.h>
#include <cuda.h>
#include <cupti.h>

#define CUPTI_CALL(call)                                                    \
do {                                                                        \
    CUptiResult _status = call;                                             \
    if (_status != CUPTI_SUCCESS) {                                         \
      const char *errstr;                                                   \
      cuptiGetResultString(_status, &errstr);                               \
      fprintf(stderr, "%s:%d: error: function %s failed with error %s.\n",  \
              __FILE__, __LINE__, #call, errstr);                           \
      exit(-1);                                                             \
    }                                                                       \
} while (0)

#define DRIVER_API_CALL(apiFuncCall)                                           \
do {                                                                           \
    CUresult _status = apiFuncCall;                                            \
    if (_status != CUDA_SUCCESS) {                                             \
        fprintf(stderr, "%s:%d: error: function %s failed with error %d.\n",   \
                __FILE__, __LINE__, #apiFuncCall, _status);                    \
        exit(-1);                                                              \
    }                                                                          \
} while (0)

#define RUNTIME_API_CALL(apiFuncCall)                                          \
do {                                                                           \
    cudaError_t _status = apiFuncCall;                                         \
    if (_status != cudaSuccess) {                                              \
        fprintf(stderr, "%s:%d: error: function %s failed with error %s.\n",   \
                __FILE__, __LINE__, #apiFuncCall, cudaGetErrorString(_status));\
        exit(-1);                                                              \
    }                                                                          \
} while (0)

#define BUF_SIZE (8 * 1024)
#define ALIGN_SIZE (8)
#define ALIGN_BUFFER(buffer, align)                                            \
    (((uintptr_t) (buffer) & ((align)-1)) ? ((buffer) + (align) - ((uintptr_t) (buffer) & ((align)-1))) : (buffer))

#define TILE_DIM 32
#define BLOCK_ROWS 8
#define NUM_REPS 100

static const char *
getUvmCounterKindString(CUpti_ActivityUnifiedMemoryCounterKind kind)
{
    switch (kind)
    {
    case CUPTI_ACTIVITY_UNIFIED_MEMORY_COUNTER_KIND_BYTES_TRANSFER_HTOD:
        return "BYTES_TRANSFER_HTOD";
    case CUPTI_ACTIVITY_UNIFIED_MEMORY_COUNTER_KIND_BYTES_TRANSFER_DTOH:
        return "BYTES_TRANSFER_DTOH";
    default:
        break;
    }
    return "<unknown>";
}

static void
printActivity(CUpti_Activity *record)
{
    switch (record->kind)
    {
    case CUPTI_ACTIVITY_KIND_UNIFIED_MEMORY_COUNTER:
        {
            CUpti_ActivityUnifiedMemoryCounter2 *uvm = (CUpti_ActivityUnifiedMemoryCounter2 *)record;
            printf("UNIFIED_MEMORY_COUNTER [ %llu %llu ] kind=%s value=%llu src %u dst %u\n",
                (unsigned long long)(uvm->start),
                (unsigned long long)(uvm->end),
                getUvmCounterKindString(uvm->counterKind),
                (unsigned long long)uvm->value,
                uvm->srcId,
                uvm->dstId);
            break;
        }
    case CUPTI_ACTIVITY_KIND_MEMCPY:
        {
            CUpti_ActivityMemcpy *uvm = (CUpti_ActivityMemcpy *) record;
            printf( "MEMORY_CPY [ ID %d/%d/%d :: %llu (ms) :: %llu (bytes) :: %d/%d/%d (Kind)]\n",
                    (int) uvm->contextId, (int) uvm->correlationId, (int) uvm->deviceId,
                    (unsigned long long) ((uvm->end-uvm->start)/1e6),
                    (unsigned long long) (uvm->bytes),
                    uvm->copyKind, uvm->srcKind, uvm->dstKind);
            break;
        }
    case CUPTI_ACTIVITY_KIND_MEMSET:
        {
            CUpti_ActivityMemset *uvm = (CUpti_ActivityMemset *) record;
            printf( "MEMORY_SET [ ID %d/%d/%d :: %llu (ms) :: %llu (bytes) :: %d (Kind) :: %d (value) ]\n",
                    (int) uvm->contextId, (int) uvm->correlationId, (int) uvm->deviceId,
                    (unsigned long long) ((uvm->end-uvm->start)/1e6),
                    (unsigned long long) (uvm->bytes),
                    uvm->memoryKind,
                    uvm->value);
            break;
        }
    case CUPTI_ACTIVITY_KIND_KERNEL:
    case CUPTI_ACTIVITY_KIND_CONCURRENT_KERNEL:
        {
            CUpti_ActivityKernel3 *uvm = (CUpti_ActivityKernel3 *) record;
            printf( "KERNEL_RUN [ ID %d/%d/%d :: %llu (ms) :: %d/%d/%d (block) :: %d (gridID) :: \
%d (RegPerThd) :: %d/%d (SharedMem) :: %d/%d (LocMem) ]\n",
                    (int) uvm->contextId, (int) uvm->correlationId, (int) uvm->deviceId,
                    (unsigned long long) ((uvm->end-uvm->start)/1e6),
                    (int) uvm->blockX, (int) uvm->blockY, (int) uvm->blockZ,
                    (int) uvm->gridId, (int) uvm->registersPerThread,
                    (int) uvm->dynamicSharedMemory, (int) uvm->staticSharedMemory,
                    (int) uvm->localMemoryPerThread, (int) uvm->localMemoryTotal
                  );
            break;
        }
    default:
        printf("  <unknown>\n");
        break;
    }
}

static void CUPTIAPI
bufferRequested(uint8_t **buffer, size_t *size, size_t *maxNumRecords)
{
    uint8_t *rawBuffer;

    *size = BUF_SIZE;
    rawBuffer = (uint8_t *)malloc(*size + ALIGN_SIZE);

    *buffer = ALIGN_BUFFER(rawBuffer, ALIGN_SIZE);
    *maxNumRecords = 0;

    if (*buffer == NULL) {
        printf("Error: out of memory\n");
        exit(-1);
    }
}

static void CUPTIAPI
bufferCompleted(CUcontext ctx, uint32_t streamId, uint8_t *buffer, size_t size, size_t validSize)
{
    CUptiResult status;
    CUpti_Activity *record = NULL;

    do {
        status = cuptiActivityGetNextRecord(buffer, validSize, &record);
        if (status == CUPTI_SUCCESS) {
            printActivity(record);
        }
        else if (status == CUPTI_ERROR_MAX_LIMIT_REACHED) {
            break;
        }
        else {
            CUPTI_CALL(status);
        }
    } while (1);

    // report any records dropped from the queue
    size_t dropped;
    CUPTI_CALL(cuptiActivityGetNumDroppedRecords(ctx, streamId, &dropped));
    if (dropped != 0) {
        printf("Dropped %u activity records\n", (unsigned int)dropped);
    }

    free(buffer);
}

template<class T>
__host__ __device__ void checkData(const char *loc, T *data, int size, int expectedVal) {
    int i;

    for (i = 0; i < size / (int)sizeof(T); i++) {
        if (data[i] != expectedVal) {
            printf("Mismatch found on %s\n", loc);
            printf("Address 0x%p, Observed = 0x%x Expected = 0x%x\n", data+i, data[i], expectedVal);
            break;
        }
    }
}

template<class T>
__host__ __device__ void writeData(T *data, int size, int writeVal) {
    int i;

    for (i = 0; i < size / (int)sizeof(T); i++) {
        data[i] = writeVal;
    }
}

// No bank-conflict transpose
// Same as transposeCoalesced except the first tile dimension is padded
// to avoid shared memory bank conflicts.
__global__ void transposeNoBankConflicts(float *odata, const float *idata)
{
  __shared__ float tile[TILE_DIM][TILE_DIM+1];

  int x = blockIdx.x * TILE_DIM + threadIdx.x;
  int y = blockIdx.y * TILE_DIM + threadIdx.y;
  int width = gridDim.x * TILE_DIM;

  for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
     tile[threadIdx.y+j][threadIdx.x] = idata[(y+j)*width + x];

  __syncthreads();

  x = blockIdx.y * TILE_DIM + threadIdx.x;  // transpose block offset
  y = blockIdx.x * TILE_DIM + threadIdx.y;

  for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
     odata[(y+j)*width + x] = tile[threadIdx.x][threadIdx.y + j];
}

int main(int argc, char **argv)
{
    const int N = 1024*10;
    const int mem_size = N*N*sizeof(float);

    int deviceCount;
    float* h_idata = NULL;
    float* h_tdata = NULL;
    float* d_idata = NULL;
    float* d_tdata = NULL;

    dim3 dimGrid(N/TILE_DIM, N/TILE_DIM, 1);
    dim3 dimBlock(TILE_DIM, BLOCK_ROWS, 1);

    DRIVER_API_CALL( cuInit(0) );

    DRIVER_API_CALL( cuDeviceGetCount(&deviceCount) );

    if (deviceCount == 0) {
        printf("|    there is no device supporting CUDA.\n");
        exit(-1);
    }

    // register cupti activity buffer callbacks
    CUPTI_CALL( cuptiActivityRegisterCallbacks(bufferRequested, bufferCompleted) );

    CUPTI_CALL( cuptiActivityEnable(CUPTI_ACTIVITY_KIND_MEMCPY) );
    CUPTI_CALL( cuptiActivityEnable(CUPTI_ACTIVITY_KIND_MEMSET) );
    CUPTI_CALL( cuptiActivityEnable(CUPTI_ACTIVITY_KIND_KERNEL) );

    // allocate memory
    printf("|    allocation size in %d bytes\n", 2*mem_size);
    RUNTIME_API_CALL( cudaMallocHost((void**)&h_idata, mem_size) );
    RUNTIME_API_CALL( cudaMallocHost((void**)&h_tdata, mem_size) );

    // initialize memory
    RUNTIME_API_CALL( cudaMalloc((void**)&d_idata, mem_size) );
    RUNTIME_API_CALL( cudaMalloc((void**)&d_tdata, mem_size) );

    // transfer memory
    RUNTIME_API_CALL( cudaMemcpy(d_idata, h_idata, mem_size, cudaMemcpyHostToDevice) );

    // memory setting
    RUNTIME_API_CALL( cudaMemset(d_idata, 100, mem_size) );

    // ------------------------
    // transposeNoBankConflicts
    // ------------------------
    printf("|    conflict-free transpose\n");
    RUNTIME_API_CALL( cudaMemset(d_tdata, 0, mem_size) );

    // events for timing
    cudaEvent_t startEvent, stopEvent;
    RUNTIME_API_CALL( cudaEventCreate(&startEvent) );
    RUNTIME_API_CALL( cudaEventCreate(&stopEvent) );
    float ms;

    // warmup
    RUNTIME_API_CALL( cudaEventRecord(startEvent, 0) );
    transposeNoBankConflicts<<<dimGrid, dimBlock>>>(d_tdata, d_idata);
    // for (int i = 0; i < NUM_REPS; i++)
    //     transposeNoBankConflicts<<<dimGrid, dimBlock>>>(d_tdata, d_idata);
    RUNTIME_API_CALL( cudaEventRecord(stopEvent, 0) );
    RUNTIME_API_CALL( cudaEventSynchronize(stopEvent) );
    RUNTIME_API_CALL( cudaEventElapsedTime(&ms, startEvent, stopEvent) );
    RUNTIME_API_CALL( cudaMemcpy(h_tdata, d_tdata, mem_size, cudaMemcpyDeviceToHost) );
    // postprocess(gold, h_tdata, nx * ny, ms);

    RUNTIME_API_CALL( cudaDeviceSynchronize() );

    // free host memory
    RUNTIME_API_CALL(cudaFreeHost(h_idata));
    RUNTIME_API_CALL(cudaFreeHost(h_tdata));

    // free device memory
    RUNTIME_API_CALL(cudaFree(d_idata));
    RUNTIME_API_CALL(cudaFree(d_tdata));

    CUPTI_CALL(cuptiActivityFlushAll(0));

    // disable unified memory counter activity
    CUPTI_CALL( cuptiActivityDisable(CUPTI_ACTIVITY_KIND_MEMCPY) );
    CUPTI_CALL( cuptiActivityDisable(CUPTI_ACTIVITY_KIND_MEMSET) );
    CUPTI_CALL( cuptiActivityDisable(CUPTI_ACTIVITY_KIND_KERNEL) );

    printf("|    time %f\n", ms);

    cudaDeviceReset();

    return 0;
}
