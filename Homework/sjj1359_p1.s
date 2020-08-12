/******************************************************************************
* @file sjj1359_p1.s
*
* Basic calculator with the functions sum(+), or(|), max(m), and right shift(>).
*
* @author Seth J Jaksik ID:1001541359
******************************************************************************/
 
.global main
.func main
   
main:
	BL _scanf
	MOV R1, R0
    BL  _getchar            
    MOV R2, R0              
    BL _scanf
    MOV R3, R0				
    BL  _compare            
    BL  _printf
    BL  _printnewline
    B   main              

   
_getchar:
	MOV R10, R1
    MOV R7, #3              
    MOV R0, #0              
    MOV R2, #1              
    LDR R1, =read_char      
    SWI 0                  
    LDR R0, [R1]            
    AND R0, #0xFF           
    MOV R1, R10
    MOV PC, LR              
    
_scanf:
    PUSH {LR}
    MOV R10, R1               
    MOV R11, R2
    SUB SP, SP, #4          
    LDR R0, =format_str     
    MOV R1, SP              
    BL scanf                
    LDR R0, [SP]            
    ADD SP, SP, #4          
    MOV R1, R10
    MOV R2, R11
    POP {PC}                
 
_compare:
	MOV R12, LR
    CMP R2, #'+'            
    BLEQ _sum           
    CMP R2, #'|'            
    BLEQ _or            
    CMP R2, #'m'            
    BLEQ _max           
    CMP R2, #'>'            
    BLEQ _shift_right           
    MOV PC, R12
    
_printf:
    MOV R4, LR              
    MOV R1, R0
    LDR R0, =format_str     
    BL printf               
    MOV PC, R4              
    
_printnewline:
    MOV R4, LR              
    LDR R0, =newline_str     
    BL printf               
    MOV PC, R4                           
    
    
_sum:
	MOV R0, R1
	ADD R0, R3
	MOV PC, LR
	
_or:
	MOV R0, R1
	ORR R0, R3
	MOV PC, LR
	
_max:
	CMP R1, R3
	MOVGT R0, R1
	MOVLS R0, R3
	MOV PC, LR
	
_shift_right:
	MOV R0, R1
	LSR R0, R3
	MOV PC, LR
 
 
.data
read_char:      .ascii      " "
format_str:     .asciz      "%d"
newline_str:     .asciz      "\n"
