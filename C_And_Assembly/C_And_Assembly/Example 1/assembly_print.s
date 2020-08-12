.global assembly_print
.func assembly_print

assembly_print:
	MOV R7, #4			@ write syscall, 4
 	MOV R0, #1			@ output stream to monitor, 1
	MOV R2, #27 	        @ print string length
	LDR R1,=str		 	@ string at label str
	SWI 0               		@ execute syscall
	BX LR				@ Return to C

.data
str:  .ascii "Assembly Function Printing\n"
