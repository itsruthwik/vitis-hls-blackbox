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
#include "xmatrix_multiply_8x8.h"

extern XMatrix_multiply_8x8_Config XMatrix_multiply_8x8_ConfigTable[];

#ifdef SDT
XMatrix_multiply_8x8_Config *XMatrix_multiply_8x8_LookupConfig(UINTPTR BaseAddress) {
	XMatrix_multiply_8x8_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMatrix_multiply_8x8_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMatrix_multiply_8x8_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMatrix_multiply_8x8_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_8x8_Initialize(XMatrix_multiply_8x8 *InstancePtr, UINTPTR BaseAddress) {
	XMatrix_multiply_8x8_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_8x8_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_8x8_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMatrix_multiply_8x8_Config *XMatrix_multiply_8x8_LookupConfig(u16 DeviceId) {
	XMatrix_multiply_8x8_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMATRIX_MULTIPLY_8X8_NUM_INSTANCES; Index++) {
		if (XMatrix_multiply_8x8_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMatrix_multiply_8x8_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_8x8_Initialize(XMatrix_multiply_8x8 *InstancePtr, u16 DeviceId) {
	XMatrix_multiply_8x8_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_8x8_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_8x8_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

