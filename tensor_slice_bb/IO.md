
---

### Inputs:
1. **`clk`**:
   - **Clock signal** used to synchronize computations.
   
2. **`reset`**:
   - **Reset signal** used to initialize the module to a known state.

3. **`pe_reset`**:
   - Enables a **"partial reset"** for the processing elements (PEs). Can also be thought of as an **accumulation reset**.

4. **`start_mat_mul`**:
   - Signal to **start the matrix multiplication** process.

5. **`a_data`**: 
   - Matrix A data input. The width is `(`BB_MAT_MUL_SIZE * BB_DWIDTH - 1)`. This represents the matrix A values being fed into this computation.

6. **`b_data`**:
   - Matrix B data input. Similar to `a_data`, this input provides matrix B values for the computation.

7. **`a_data_in`**:
   - Systolically shifted **incoming data** from previous stage for matrix A.

8. **`b_data_in`**:
   - Systolically shifted **incoming data** from previous stage for matrix B.

9. **`validity_mask_a_rows`**:
   - Bitmask indicating which **rows of matrix A** are valid (used to handle variable-sized matrices or sparsity).

10. **`validity_mask_a_cols_b_rows`**:
    - Bitmask indicating the **valid rows or columns** at the interface between matrix A's columns and matrix B's rows.

11. **`validity_mask_b_cols`**:
    - Bitmask indicating which **columns of matrix B** are valid.

12. **`slice_dtype`**:
    - 2-bit signal to specify the **data type or precision** of the slice operation:
      - `00`: INT8
      - `10`: FP16

13. **`slice_mode`**:
    - Determines the **operation mode** of the module.
    - Example modes:
      - `0`: Tensor Mode
      - `1`: Individual PE Mode

14. **`op`**:
    - 3-bit signal specifying the **operation** to perform:
      - `000`: Matrix multiplication
      - `001`: Element-wise multiplication
      - `010`: Element-wise addition
      - `011`: Element-wise subtraction
   
15. **`preload`**:
    - Preloading flag for managing **initial data configuration** for matrix multiplication.

16. **`final_mat_mul_size`**:
    - 8-bit value specifying the **final size of the matrix multiplication**, used to adjust behavior for smaller matrix multiplications.

17. **`a_loc`**:
    - 5-bit input indicating the **location of matrix A** within the systolic array.

18. **`b_loc`**:
    - 5-bit input indicating the **location of matrix B** within the systolic array.

19. **`no_rounding`**:
    - A flag to **disable rounding** when performing computations (use raw/unrounded outputs).

---

### Outputs:

1. **`done_mat_mul_port`**:
   - Signals when the **matrix multiplication process is completed**.

2. **`c_data_out`**:
   - Result data output for **matrix multiplication** or other operations.
   - Width: `2*BB_MAT_MUL_SIZE*BB_DWIDTH`.

3. **`a_data_out`**:
   - Systolically shifted **data output** for matrix A that passes through to the next stage in the systolic array.

4. **`b_data_out`**:
   - Systolically shifted **data output** for matrix B that passes through to the next stage in the systolic array.

5. **`flags_port`**:
   - 4-bit flags output. Reserved for extra status or operation metadata.

6. **`c_data_available_port`**:
   - Signals when **computed output data is ready** and available.

---

### Summary:
The `tensor_slice` module acts as a systolic processing unit for performing matrix computations (matrix-matrix multiplication, element-wise operations, etc.). It supports configurable precision, masking invalid elements, cascading/systolic shifting of data, and preloading. The ports are arranged to handle matrix inputs, provide control signals for activation and reset, and give access to the results and intermediate outputs. This flexibility allows it to be used as part of a larger systolic array or standalone matrix computation.