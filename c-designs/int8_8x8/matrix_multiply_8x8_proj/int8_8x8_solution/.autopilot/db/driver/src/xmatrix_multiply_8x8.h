// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XMATRIX_MULTIPLY_8X8_H
#define XMATRIX_MULTIPLY_8X8_H

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
#include "xmatrix_multiply_8x8_hw.h"

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
} XMatrix_multiply_8x8_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMatrix_multiply_8x8;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMatrix_multiply_8x8_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMatrix_multiply_8x8_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMatrix_multiply_8x8_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMatrix_multiply_8x8_ReadReg(BaseAddress, RegOffset) \
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
int XMatrix_multiply_8x8_Initialize(XMatrix_multiply_8x8 *InstancePtr, UINTPTR BaseAddress);
XMatrix_multiply_8x8_Config* XMatrix_multiply_8x8_LookupConfig(UINTPTR BaseAddress);
#else
int XMatrix_multiply_8x8_Initialize(XMatrix_multiply_8x8 *InstancePtr, u16 DeviceId);
XMatrix_multiply_8x8_Config* XMatrix_multiply_8x8_LookupConfig(u16 DeviceId);
#endif
int XMatrix_multiply_8x8_CfgInitialize(XMatrix_multiply_8x8 *InstancePtr, XMatrix_multiply_8x8_Config *ConfigPtr);
#else
int XMatrix_multiply_8x8_Initialize(XMatrix_multiply_8x8 *InstancePtr, const char* InstanceName);
int XMatrix_multiply_8x8_Release(XMatrix_multiply_8x8 *InstancePtr);
#endif

void XMatrix_multiply_8x8_Start(XMatrix_multiply_8x8 *InstancePtr);
u32 XMatrix_multiply_8x8_IsDone(XMatrix_multiply_8x8 *InstancePtr);
u32 XMatrix_multiply_8x8_IsIdle(XMatrix_multiply_8x8 *InstancePtr);
u32 XMatrix_multiply_8x8_IsReady(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_EnableAutoRestart(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_DisableAutoRestart(XMatrix_multiply_8x8 *InstancePtr);

void XMatrix_multiply_8x8_Set_A(XMatrix_multiply_8x8 *InstancePtr, u64 Data);
u64 XMatrix_multiply_8x8_Get_A(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_Set_B(XMatrix_multiply_8x8 *InstancePtr, u64 Data);
u64 XMatrix_multiply_8x8_Get_B(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_Set_C(XMatrix_multiply_8x8 *InstancePtr, u64 Data);
u64 XMatrix_multiply_8x8_Get_C(XMatrix_multiply_8x8 *InstancePtr);

void XMatrix_multiply_8x8_InterruptGlobalEnable(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_InterruptGlobalDisable(XMatrix_multiply_8x8 *InstancePtr);
void XMatrix_multiply_8x8_InterruptEnable(XMatrix_multiply_8x8 *InstancePtr, u32 Mask);
void XMatrix_multiply_8x8_InterruptDisable(XMatrix_multiply_8x8 *InstancePtr, u32 Mask);
void XMatrix_multiply_8x8_InterruptClear(XMatrix_multiply_8x8 *InstancePtr, u32 Mask);
u32 XMatrix_multiply_8x8_InterruptGetEnabled(XMatrix_multiply_8x8 *InstancePtr);
u32 XMatrix_multiply_8x8_InterruptGetStatus(XMatrix_multiply_8x8 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
