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
#include "xmatrix_multiply_16x16.h"

extern XMatrix_multiply_16x16_Config XMatrix_multiply_16x16_ConfigTable[];

#ifdef SDT
XMatrix_multiply_16x16_Config *XMatrix_multiply_16x16_LookupConfig(UINTPTR BaseAddress) {
	XMatrix_multiply_16x16_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XMatrix_multiply_16x16_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XMatrix_multiply_16x16_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XMatrix_multiply_16x16_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_16x16_Initialize(XMatrix_multiply_16x16 *InstancePtr, UINTPTR BaseAddress) {
	XMatrix_multiply_16x16_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_16x16_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_16x16_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XMatrix_multiply_16x16_Config *XMatrix_multiply_16x16_LookupConfig(u16 DeviceId) {
	XMatrix_multiply_16x16_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMATRIX_MULTIPLY_16X16_NUM_INSTANCES; Index++) {
		if (XMatrix_multiply_16x16_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMatrix_multiply_16x16_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMatrix_multiply_16x16_Initialize(XMatrix_multiply_16x16 *InstancePtr, u16 DeviceId) {
	XMatrix_multiply_16x16_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMatrix_multiply_16x16_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMatrix_multiply_16x16_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

