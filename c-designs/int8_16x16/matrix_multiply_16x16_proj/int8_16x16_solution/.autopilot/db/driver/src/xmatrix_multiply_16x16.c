// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xmatrix_multiply_16x16.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMatrix_multiply_16x16_CfgInitialize(XMatrix_multiply_16x16 *InstancePtr, XMatrix_multiply_16x16_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMatrix_multiply_16x16_Start(XMatrix_multiply_16x16 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMatrix_multiply_16x16_IsDone(XMatrix_multiply_16x16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMatrix_multiply_16x16_IsIdle(XMatrix_multiply_16x16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMatrix_multiply_16x16_IsReady(XMatrix_multiply_16x16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMatrix_multiply_16x16_EnableAutoRestart(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMatrix_multiply_16x16_DisableAutoRestart(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_AP_CTRL, 0);
}

void XMatrix_multiply_16x16_Set_A(XMatrix_multiply_16x16 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_A_DATA, (u32)(Data));
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XMatrix_multiply_16x16_Get_A(XMatrix_multiply_16x16 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_A_DATA);
    Data += (u64)XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XMatrix_multiply_16x16_Set_B(XMatrix_multiply_16x16 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_B_DATA, (u32)(Data));
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XMatrix_multiply_16x16_Get_B(XMatrix_multiply_16x16 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_B_DATA);
    Data += (u64)XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XMatrix_multiply_16x16_Set_C(XMatrix_multiply_16x16 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_C_DATA, (u32)(Data));
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_C_DATA + 4, (u32)(Data >> 32));
}

u64 XMatrix_multiply_16x16_Get_C(XMatrix_multiply_16x16 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_C_DATA);
    Data += (u64)XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_C_DATA + 4) << 32;
    return Data;
}

void XMatrix_multiply_16x16_InterruptGlobalEnable(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_GIE, 1);
}

void XMatrix_multiply_16x16_InterruptGlobalDisable(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_GIE, 0);
}

void XMatrix_multiply_16x16_InterruptEnable(XMatrix_multiply_16x16 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_IER);
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_IER, Register | Mask);
}

void XMatrix_multiply_16x16_InterruptDisable(XMatrix_multiply_16x16 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_IER);
    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMatrix_multiply_16x16_InterruptClear(XMatrix_multiply_16x16 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMatrix_multiply_16x16_WriteReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_ISR, Mask);
}

u32 XMatrix_multiply_16x16_InterruptGetEnabled(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_IER);
}

u32 XMatrix_multiply_16x16_InterruptGetStatus(XMatrix_multiply_16x16 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMatrix_multiply_16x16_ReadReg(InstancePtr->Control_BaseAddress, XMATRIX_MULTIPLY_16X16_CONTROL_ADDR_ISR);
}

