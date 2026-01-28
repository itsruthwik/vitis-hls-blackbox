// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xmatrix_multiply_32x32.h"

extern XMatrix_multiply_32x32_Config XMatrix_multiply_32x32_ConfigTable[];

#ifdef SDT
XMatrix_multiply_32x32_Config *XMatrix_multiply_32x32_LookupConfig(UINTPTR BaseAddress) {
	XMatrix_multiply_32x32_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMatrix_multiply_32x32_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMatrix_multiply_32x32_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMatrix_multiply_32x32_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_32x32_Initialize(XMatrix_multiply_32x32 *InstancePtr, UINTPTR BaseAddress) {
	XMatrix_multiply_32x32_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_32x32_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_32x32_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMatrix_multiply_32x32_Config *XMatrix_multiply_32x32_LookupConfig(u16 DeviceId) {
	XMatrix_multiply_32x32_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMATRIX_MULTIPLY_32X32_NUM_INSTANCES; Index++) {
		if (XMatrix_multiply_32x32_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMatrix_multiply_32x32_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_32x32_Initialize(XMatrix_multiply_32x32 *InstancePtr, u16 DeviceId) {
	XMatrix_multiply_32x32_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_32x32_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_32x32_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

