set ModuleHierarchy {[{
"Name" : "matrix_multiply_8x8","ID" : "0","Type" : "dataflow",
"SubInsts" : [
	{"Name" : "entry_proc_U0","ID" : "1","Type" : "sequential"},
	{"Name" : "Loop_VITIS_LOOP_45_1_proc1_U0","ID" : "2","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_45_1","ID" : "3","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_55_3_proc2_U0","ID" : "4","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_55_3","ID" : "5","Type" : "pipeline"},]},
	{"Name" : "int8_8x8_wrapper_wrapper_1_U0","ID" : "6","Type" : "dataflow",
		"SubInsts" : [
		{"Name" : "int8_8x8_wrapper_U0","ID" : "7","Type" : "pipeline"},]},
	{"Name" : "Loop_VITIS_LOOP_68_5_proc3_U0","ID" : "8","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_68_5_VITIS_LOOP_70_6","ID" : "9","Type" : "pipeline"},]},]
}]}