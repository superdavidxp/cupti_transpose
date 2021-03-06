/*
 * Copyright 2011-2015 NVIDIA Corporation. All rights reserved
 *
 * Sample app to demonstrate use of CUPTI library to obtain metric values
 * using callbacks for CUDA runtime APIs
 *
 */

#include <stdio.h>
#include <cuda.h>

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

#define TILE_DIM 64
#define BLOCK_ROWS 8
#define NUM_REPS 100

// Device code
__global__ void VecAdd(const float* A, const float* B, float* C, int N)
{
  __shared__ float tile[TILE_DIM];
  tile[threadIdx.x] = A[threadIdx.x];

  int i = blockDim.x * blockIdx.x + threadIdx.x;

  if (i < N)
    C[i] = A[i] + B[i];
}

static void
initVec(float *vec, int n)
{
  for (int i=0; i< n; i++)
    vec[i] = i;
}

static void
cleanUp(float *h_A, float *h_B, float *h_C, float *d_A, float *d_B, float *d_C)
{
  if (d_A)
    cudaFree(d_A);
  if (d_B)
    cudaFree(d_B);
  if (d_C)
    cudaFree(d_C);

  // Free host memory
  if (h_A)
    free(h_A);
  if (h_B)
    free(h_B);
  if (h_C)
    free(h_C);
}

static void
runPass()
{
  int N = 10240 * 10240;
  size_t size = N * sizeof(float);
  int threadsPerBlock = 0;
  int blocksPerGrid = 0;
  float *h_A, *h_B, *h_C;
  float *d_A, *d_B, *d_C;
  int i, sum;

  // Allocate input vectors h_A and h_B in host memory
  h_A = (float*)malloc(size);
  h_B = (float*)malloc(size);
  h_C = (float*)malloc(size);

  // Initialize input vectors
  initVec(h_A, N);
  initVec(h_B, N);
  memset(h_C, 0, size);

  // Allocate vectors in device memory
  cudaMalloc((void**)&d_A, size);
  cudaMalloc((void**)&d_B, size);
  cudaMalloc((void**)&d_C, size);

  // Copy vectors from host memory to device memory
  cudaMemcpy(d_A, h_A, size, cudaMemcpyHostToDevice);
  cudaMemcpy(d_B, h_B, size, cudaMemcpyHostToDevice);

  cudaMemset(d_A, 0, size);
  cudaMemset(d_B, 0, size);

  // Invoke kernel
  threadsPerBlock = 64;
  blocksPerGrid = (N + threadsPerBlock - 1) / threadsPerBlock;
  printf("Launching kernel: blocks %d, thread/block %d\n",
         blocksPerGrid, threadsPerBlock);
  VecAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, N);

  // Copy result from device memory to host memory
  // h_C contains the result in host memory
  cudaMemcpy(h_C, d_C, size, cudaMemcpyDeviceToHost);

  cleanUp(h_A, h_B, h_C, d_A, d_B, d_C);
}

int
main(int argc, char *argv[])
{

  runPass();

  return 0;
}
