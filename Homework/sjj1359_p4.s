/******************************************************************************
* @file float_div.s
* @brief simple example of integer division with a scalar result using the FPU
*
* Simple example of using the ARM FPU to compute the division result of
* two integer values
*
* @author Christopher D. McMurrough
******************************************************************************/
@ VNEG.F32 S2, S3       S2 = -S3
@ VNDIV.F64
.global main
.func main
   
main:
    BL  _scanf
    MOV R4, R0
    BL  _scanf
    MOV R5, R0
    MOV R1, R4
    MOV R2, R5
    BL  _divide
    BL  _printf
    VCVT.F64.F32 D4, S0     @ covert the result to double precision for printing
    VMOV R1, R2, D4         @ split the double VFP register into two ARM registers
    BL  _printf_result      @ print the result
    B   main               @ branch to exit procedure with no return
   
_divide:
    VMOV S1, R1             @ move the numerator to floating point register
    VMOV S2, R2             @ move the denominator to floating point register
    VCVT.F32.S32 S1, S1     @ convert unsigned bit representation to single float
    VCVT.F32.S32 S2, S2     @ convert unsigned bit representation to single float
	
    VDIV.F32 S0, S1, S2     @ compute S2 = S0 / S1

_scanf:
    PUSH {LR}               @ store LR since scanf call overwrites
    SUB SP, SP, #4          @ make room on stack
    LDR R0, =format_str     @ R0 contains address of format string
    MOV R1, SP              @ move SP to R1 to store entry on stack
    BL scanf                @ call scanf
    LDR R0, [SP]            @ load value at SP into R0
    ADD SP, SP, #4          @ restore the stack pointer
    POP {PC}                @ return

_printf_result:
    PUSH {LR}               @ push LR to stack
    LDR R0, =result_str     @ R0 contains formatted string address
    BL printf               @ call printf
    POP {PC}                @ pop LR from stack and return

_printf:
    PUSH {LR}               @ push LR to stack
    LDR R0, =format_str     @ R0 contains formatted string address
    BL printf               @ call printf
    POP {PC}                @ pop LR from stack and return

.data
format_str:     .asciz      "%d / %d = "
result_str:     .asciz      "%f \n"
exit_str:       .ascii      "Terminating program.\n"
