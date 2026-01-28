// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMATRIX_MULTIPLY_16X16_H
#define XMATRIX_MULTIPLY_16X16_H

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
#include "xmatrix_multiply_16x16_hw.h"

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
} XMatrix_multiply_16x16_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMatrix_multiply_16x16;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMatrix_multiply_16x16_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMatrix_multiply_16x16_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMatrix_multiply_16x16_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMatrix_multiply_16x16_ReadReg(BaseAddress, RegOffset) \
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
int XMatrix_multiply_16x16_Initialize(XMatrix_multiply_16x16 *InstancePtr, UINTPTR BaseAddress);
XMatrix_multiply_16x16_Config* XMatrix_multiply_16x16_LookupConfig(UINTPTR BaseAddress);
#else
int XMatrix_multiply_16x16_Initialize(XMatrix_multiply_16x16 *InstancePtr, u16 DeviceId);
XMatrix_multiply_16x16_Config* XMatrix_multiply_16x16_LookupConfig(u16 DeviceId);
#endif
int XMatrix_multiply_16x16_CfgInitialize(XMatrix_multiply_16x16 *InstancePtr, XMatrix_multiply_16x16_Config *ConfigPtr);
#else
int XMatrix_multiply_16x16_Initialize(XMatrix_multiply_16x16 *InstancePtr, const char* InstanceName);
int XMatrix_multiply_16x16_Release(XMatrix_multiply_16x16 *InstancePtr);
#endif

void XMatrix_multiply_16x16_Start(XMatrix_multiply_16x16 *InstancePtr);
u32 XMatrix_multiply_16x16_IsDone(XMatrix_multiply_16x16 *InstancePtr);
u32 XMatrix_multiply_16x16_IsIdle(XMatrix_multiply_16x16 *InstancePtr);
u32 XMatrix_multiply_16x16_IsReady(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_EnableAutoRestart(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_DisableAutoRestart(XMatrix_multiply_16x16 *InstancePtr);

void XMatrix_multiply_16x16_Set_A(XMatrix_multiply_16x16 *InstancePtr, u64 Data);
u64 XMatrix_multiply_16x16_Get_A(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_Set_B(XMatrix_multiply_16x16 *InstancePtr, u64 Data);
u64 XMatrix_multiply_16x16_Get_B(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_Set_C(XMatrix_multiply_16x16 *InstancePtr, u64 Data);
u64 XMatrix_multiply_16x16_Get_C(XMatrix_multiply_16x16 *InstancePtr);

void XMatrix_multiply_16x16_InterruptGlobalEnable(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_InterruptGlobalDisable(XMatrix_multiply_16x16 *InstancePtr);
void XMatrix_multiply_16x16_InterruptEnable(XMatrix_multiply_16x16 *InstancePtr, u32 Mask);
void XMatrix_multiply_16x16_InterruptDisable(XMatrix_multiply_16x16 *InstancePtr, u32 Mask);
void XMatrix_multiply_16x16_InterruptClear(XMatrix_multiply_16x16 *InstancePtr, u32 Mask);
u32 XMatrix_multiply_16x16_InterruptGetEnabled(XMatrix_multiply_16x16 *InstancePtr);
u32 XMatrix_multiply_16x16_InterruptGetStatus(XMatrix_multiply_16x16 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
