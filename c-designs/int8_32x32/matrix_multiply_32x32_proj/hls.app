<AutoPilot:project xmlns:AutoPilot="com.autoesl.autopilot.project" projectType="C/C++" top="matrix_multiply_32x32" name="matrix_multiply_32x32_proj" ideType="classic">
    <files>
        <file name="../../result.golden.dat" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../matrix_multiply_32x32_tb.cpp" sc="0" tb="1" cflags="-Wno-unknown-pragmas" csimflags="" blackbox="false"/>
        <file name="../../library/int8_32x32/int8_32x32_wrapper.json" sc="0" tb="false" cflags="" csimflags="" blackbox="1"/>
        <file name="../../library/int8_32x32/int8_32x32_wrapper.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="0"/>
        <file name="matrix_multiply_32x32.cpp" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions>
        <solution name="int8_32x32_solution" status=""/>
    </solutions>
    <Simulation argv="">
        <SimFlow name="csim" setup="false" optimizeCompile="false" clean="false" ldflags="" mflags=""/>
    </Simulation>
</AutoPilot:project>

