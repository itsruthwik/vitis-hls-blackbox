#!/usr/bin/env python3
"""
Fix non-constant for-loop bounds in Verilog functions for Yosys compatibility.

Yosys requires for-loop bounds to be constants. This script finds patterns like:
    for (i = 0; i < variable; i = i + 1)
        statement;

And replaces them with:
    for (i = 0; i < CONSTANT; i = i + 1)
        if (i < variable)
            statement;
"""

import re
import sys
import os
from pathlib import Path


def fix_for_loops_in_function(content):
    """
    Fix for-loops inside Verilog functions and procedural blocks that use variable bounds.
    
    Pattern to match:
    - Function definition with localparam that could be used as constant bound
    - For-loop with variable bound (not a number or CAPS_CONSTANT)
    """
    
    # Pattern to find functions with for-loops using variable bounds
    # This pattern looks for: for (i = 0; i < <variable>; i = i + 1)
    # where <variable> is not a number or CONSTANT_NAME
    
    lines = content.split('\n')
    modified = False
    result_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        
        # Check if this line contains a for-loop with potential variable bound
        # Match: for (var = 0; var < something; var = var + 1)
        for_match = re.search(r'for\s*\(\s*(\w+)\s*=\s*0\s*;\s*\1\s*<\s*(\w+)\s*;', line)
        
        if for_match:
            loop_var = for_match.group(1)
            bound_var = for_match.group(2)
            # print(f"DEBUG: Found for-loop: var={loop_var}, bound={bound_var}")
            
            # Check if bound is not a constant (not all caps or a number)
            if not (bound_var.isupper() or bound_var.isdigit()):
                # print(f"DEBUG: {bound_var} is not a constant, looking for replacement...")
                # This is likely a variable bound that needs fixing
                # Find the corresponding constant by looking backwards for localparam
                # Common pattern: TOTAL_PADS is the constant, din/len/etc is the variable
                
                # Look backwards to find relevant localparam
                constant_candidate = None
                for j in range(i-1, max(0, i-100), -1):
                    # print(f"DEBUG: Checking line {j}: {lines[j][:50]}...")
                    # Look for localparam definitions - handle both single-line and multi-line
                    # Single line: localparam TOTAL_PADS = ...
                    # Multi-line: localparam\n    TOTAL_PADS = ...
                    param_match = re.search(r'localparam\s+(\w+)\s*=', lines[j])
                    if param_match:
                        param_name = param_match.group(1)
                        # print(f"DEBUG: Found localparam: {param_name}")
                        # Heuristic: look for TOTAL_* or similar all-caps constants
                        if param_name.isupper() and 'TOTAL' in param_name:
                            constant_candidate = param_name
                            # print(f"DEBUG: Found constant candidate: {constant_candidate}")
                            break
                    # Also check if this line starts with a parameter name after localparam
                    elif re.search(r'^\s*(\w+)\s*=', lines[j]):
                        param_match = re.search(r'^\s*(\w+)\s*=', lines[j])
                        param_name = param_match.group(1)
                        # print(f"DEBUG: Found parameter definition: {param_name}")
                        if param_name.isupper() and 'TOTAL' in param_name:
                            constant_candidate = param_name
                            # print(f"DEBUG: Found constant candidate: {constant_candidate}")
                            break
                
                if constant_candidate:
                    # print(f"DEBUG: Applying fix with constant: {constant_candidate}")
                    # Get the indentation of the for-loop
                    indent_match = re.match(r'(\s*)', line)
                    indent = indent_match.group(1) if indent_match else ''
                    
                    # Check if the loop body is on the same line or next line
                    # Extract the statement after the for-loop
                    statement_match = re.search(r'for\s*\([^)]+\)\s*(.+)', line)
                    
                    if statement_match:
                        # print(f"DEBUG: Same-line statement found: {statement_match.group(1)}")
                        # Statement is on the same line (function style)
                        statement = statement_match.group(1).strip()
                        
                        # Replace the for-loop bound
                        new_for_line = re.sub(
                            r'(for\s*\(\s*' + loop_var + r'\s*=\s*0\s*;\s*' + loop_var + r'\s*<\s*)' + bound_var,
                            r'\1' + constant_candidate,
                            line
                        )
                        
                        # Remove the statement from the for line
                        new_for_line = re.sub(r'\)\s*.+$', ')', new_for_line)
                        
                        # Add the conditional and statement
                        result_lines.append(new_for_line)
                        result_lines.append(indent + '    if (' + loop_var + ' < ' + bound_var + ')')
                        result_lines.append(indent + '        ' + statement)
                        
                        modified = True
                        i += 1
                        continue
                    else:
                        # print(f"DEBUG: Multi-line statement, checking next line...")
                        # Statement is on next line(s) - procedural style
                        # Replace the bound in the for-loop
                        new_for_line = re.sub(
                            r'(for\s*\(\s*' + loop_var + r'\s*=\s*0\s*;\s*' + loop_var + r'\s*<\s*)' + bound_var,
                            r'\1' + constant_candidate,
                            line
                        )
                        result_lines.append(new_for_line)
                        i += 1
                        
                        # Next line should be the statement - wrap it in an if
                        if i < len(lines):
                            next_line = lines[i]
                            stmt_indent_match = re.match(r'(\s*)', next_line)
                            stmt_indent = stmt_indent_match.group(1) if stmt_indent_match else indent + '    '
                            
                            # Add the conditional
                            result_lines.append(stmt_indent + 'if (' + loop_var + ' < ' + bound_var + ')')
                            result_lines.append(next_line.replace(stmt_indent, stmt_indent + '    ', 1))
                            i += 1
                            modified = True
                            continue
                # else:
                    # print(f"DEBUG: No constant candidate found for {bound_var}")
        
        result_lines.append(line)
        i += 1
    
    return '\n'.join(result_lines), modified


def fix_file(filepath):
    """Fix for-loops in a single file."""
    try:
        with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
            content = f.read()
        
        new_content, modified = fix_for_loops_in_function(content)
        
        if modified:
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"--- ✓ Fixed: {filepath}")
            return True
        else:
            # print(f"---  No changes: {filepath}")
            return False
    except Exception as e:
        print(f"--- ✗ Error processing {filepath}: {e}")
        return False


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 fix_for_loops.py <file_or_directory>")
        print("Example: python3 fix_for_loops.py matrix_multiply_8x8_proj/matrix_multiply_8x8_solution/syn/verilog/")
        sys.exit(1)
    
    target = sys.argv[1]
    
    if os.path.isfile(target):
        # Single file
        fix_file(target)
    elif os.path.isdir(target):
        # Directory - find all .v files
        verilog_files = list(Path(target).rglob('*.v'))
        print(f"    - Found {len(verilog_files)} Verilog files")
        
        fixed_count = 0
        for vfile in verilog_files:
            if fix_file(str(vfile)):
                fixed_count += 1
        
        print(f"\n    - Summary: Fixed {fixed_count} file(s)")
    else:
        print(f"    - Error: {target} is not a valid file or directory")
        sys.exit(1)


if __name__ == '__main__':
    main()
