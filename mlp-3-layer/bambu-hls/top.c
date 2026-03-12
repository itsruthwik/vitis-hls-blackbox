#include "top.h"

uint64_t mlp_wrapper_lo(uint64_t in_data);
uint64_t mlp_wrapper_hi(uint64_t in_data);

uint64_t run_mlp_lo(uint64_t in_data)
{
    return mlp_wrapper_lo(in_data);
}

uint64_t run_mlp_hi(uint64_t in_data)
{
    return mlp_wrapper_hi(in_data);
}
