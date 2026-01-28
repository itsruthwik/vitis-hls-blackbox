// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMATRIX_MULTIPLY_32X32_H
#define XMATRIX_MULTIPLY_32X32_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmatrix_multiply_32x32_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XMatrix_multiply_32x32_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMatrix_multiply_32x32;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMatrix_multiply_32x32_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMatrix_multiply_32x32_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMatrix_multiply_32x32_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMatrix_multiply_32x32_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XMatrix_multiply_32x32_Initialize(XMatrix_multiply_32x32 *InstancePtr, UINTPTR BaseAddress);
XMatrix_multiply_32x32_Config* XMatrix_multiply_32x32_LookupConfig(UINTPTR BaseAddress);
#else
int XMatrix_multiply_32x32_Initialize(XMatrix_multiply_32x32 *InstancePtr, u16 DeviceId);
XMatrix_multiply_32x32_Config* XMatrix_multiply_32x32_LookupConfig(u16 DeviceId);
#endif
int XMatrix_multiply_32x32_CfgInitialize(XMatrix_multiply_32x32 *InstancePtr, XMatrix_multiply_32x32_Config *ConfigPtr);
#else
int XMatrix_multiply_32x32_Initialize(XMatrix_multiply_32x32 *InstancePtr, const char* InstanceName);
int XMatrix_multiply_32x32_Release(XMatrix_multiply_32x32 *InstancePtr);
#endif

void XMatrix_multiply_32x32_Start(XMatrix_multiply_32x32 *InstancePtr);
u32 XMatrix_multiply_32x32_IsDone(XMatrix_multiply_32x32 *InstancePtr);
u32 XMatrix_multiply_32x32_IsIdle(XMatrix_multiply_32x32 *InstancePtr);
u32 XMatrix_multiply_32x32_IsReady(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_EnableAutoRestart(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_DisableAutoRestart(XMatrix_multiply_32x32 *InstancePtr);

void XMatrix_multiply_32x32_Set_A(XMatrix_multiply_32x32 *InstancePtr, u64 Data);
u64 XMatrix_multiply_32x32_Get_A(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_Set_B(XMatrix_multiply_32x32 *InstancePtr, u64 Data);
u64 XMatrix_multiply_32x32_Get_B(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_Set_C(XMatrix_multiply_32x32 *InstancePtr, u64 Data);
u64 XMatrix_multiply_32x32_Get_C(XMatrix_multiply_32x32 *InstancePtr);

void XMatrix_multiply_32x32_InterruptGlobalEnable(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_InterruptGlobalDisable(XMatrix_multiply_32x32 *InstancePtr);
void XMatrix_multiply_32x32_InterruptEnable(XMatrix_multiply_32x32 *InstancePtr, u32 Mask);
void XMatrix_multiply_32x32_InterruptDisable(XMatrix_multiply_32x32 *InstancePtr, u32 Mask);
void XMatrix_multiply_32x32_InterruptClear(XMatrix_multiply_32x32 *InstancePtr, u32 Mask);
u32 XMatrix_multiply_32x32_InterruptGetEnabled(XMatrix_multiply_32x32 *InstancePtr);
u32 XMatrix_multiply_32x32_InterruptGetStatus(XMatrix_multiply_32x32 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
