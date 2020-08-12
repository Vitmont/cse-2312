.global main
.func main
   
main:
    BL  _scanf              @ branch to scan procedure with return
    MOV R9, R0              @ store n in R9
    BL  _scanf
    MOV R10, R0             @ store m in R10
    MOV R1, R9              @ n in R1
    MOV R2, R10             @ m in R2
    MOV R3, #0
    BL  _partition               @ branch to factorial procedure with return
    BL  _printf             @ branch to print procedure with return
    B   main               @ branch to exit procedure with no return
       
_printf:
    PUSH {LR}               @ store the return address
    MOV R1, R0
    LDR R0, =printf_str     @ R0 contains formatted string address
    MOV R2, R9
    MOV R3, R10
    BL printf               @ call printf
    POP {PC}                @ restore the stack pointer and return
   
_scanf:
    PUSH {LR}               @ store the return address
    PUSH {R1}               @ backup regsiter value
    LDR R0, =format_str     @ R0 contains address of format string
    SUB SP, SP, #4          @ make room on stack
    MOV R1, SP              @ move SP to R1 to store entry on stack
    BL scanf                @ call scanf
    LDR R0, [SP]            @ load value at SP into R0
    ADD SP, SP, #4          @ remove value from stack
    POP {R1}                @ restore register value
    POP {PC}                @ restore the stack pointer and return
 
_partition:
    PUSH {LR}               @ store the return address
    CMP R1, #0              @ compare the input argument to 1
    MOVEQ R0, #1            @ set return value to 1 if equal
    POPEQ {PC}              @ restore stack pointer and return if equal
    CMP R1, #0              @ compare the input argument to 1
    MOVLT R0, #0            @ set return value to 1 if equal
    POPLT {PC}              @ restore stack pointer and return if equal
    CMP R2, #0              @ compare the input argument to 1
    MOVEQ R0, #0            @ set return value to 1 if equal
    POPEQ {PC}              @ restore stack pointer and return if equal
   
    PUSH {R1}               @ backup input argument value
    PUSH {R2}  
    SUB R1, R1, R2          @ decrement the input argument
    BL _partition           @ compute fact(n-1)
    MOV R3, R0				@ save the return address
    POP {R2}
    POP {R1}                @ restore input argument
    PUSH {R3}
    SUB R2, R2, #1
    BL _partition
    POP {R3}
    ADD R0, R0, R3
    POP  {PC}               @ restore the stack pointer and return
 
.data
format_str:     .asciz      "%d"
printf_str:     .asciz      "There are %d partitions of %d using integers up to %d\n"
