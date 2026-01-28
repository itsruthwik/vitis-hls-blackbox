set ModuleHierarchy {[{
"Name" : "matrix_multiply_32x32","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "entry_proc_U0","ID" : "1","Type" : "sequential"},
	{"Name" : "Block_VITIS_LOOP_57_3_proc_U0","ID" : "2","Type" : "sequential"},
	{"Name" : "Loop_VITIS_LOOP_47_1_proc2_U0","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_47_1","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_57_3_proc_U0","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_57_3","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "int8_32x32_wrapper_wrapper_1_U0","ID" : "7","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "int8_32x32_wrapper_U0","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_70_5_proc3_U0","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_70_5_VITIS_LOOP_72_6","ID" : "10","Type" : "pipeline"},]},]
}]}