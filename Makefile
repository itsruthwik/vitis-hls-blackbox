


c-designs: int8_8x8 int8_16x16 int8_32x32

int8_8x8:
	cd c-designs/int8_8x8 && \
	vitis_hls -f run_hls.tcl && \
	./run_vtr.sh && \
	vivado -mode tcl -source run_vivado.tcl

int8_16x16:
	cd c-designs/int8_16x16 && \
	vitis_hls -f run_hls.tcl && \
	./run_vtr.sh && \
	vivado -mode tcl -source run_vivado.tcl

int8_32x32:
	cd c-designs/int8_32x32 && \
	vitis_hls -f run_hls.tcl && \
	./run_vtr.sh && \
	vivado -mode tcl -source run_vivado.tcl




clean:
	rm -rf c-designs/*/matrix_multiply_*_proj
	rm -rf c-designs/*/*.jou
	rm -rf c-designs/*/*.log
	rm -rf c-designs/*/.Xil
	rm -rf c-designs/*/*xpr
	rm -rf c-designs/*/*.rpt
	rm -rf c-designs/*/*.edf
	rm -rf c-designs/*/*user_files/
	rm -rf c-designs/*/*.cache/
	rm -rf c-designs/*/*.hw/
	rm -rf c-designs/*/*.cache/
	rm -rf c-designs/*/temp/



	rm -rf c-designs-no-bb-beh/*/matrix_multiply_*_proj
	rm -rf c-designs-no-bb-beh/*/vitis_hls.log
