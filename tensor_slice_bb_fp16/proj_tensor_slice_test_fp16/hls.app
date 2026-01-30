<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" top="tensor_slice_test_fp16" name="proj_tensor_slice_test_fp16" ideType="classic">
    <files>
        <file name="../../result.golden.dat" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../tensor_slice_test_fp16_tb.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="tensor_slice_wrapper_fp16.json" sc="0" tb="false" cflags="" csimflags="" blackbox="1"/>
        <file name="tensor_slice_wrapper_fp16.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="0"/>
        <file name="tensor_slice_test_fp16.h" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="tensor_slice_test_fp16.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="solution1" status=""/>
    </solutions>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

