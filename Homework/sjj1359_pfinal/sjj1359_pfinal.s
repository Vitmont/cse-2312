@ Seth Jaksik
@ 10015413589
@ sjj1359_pfinal.s

.global flipEndian
.func flipEndian

flipEndian:
	REV R0, R0	@ Call word byte reverse from ARM
    BX LR;		@ branch back to c program

.endfunc

.global reverseOrder
.func reverseOrder

reverseOrder:	
    MOV R1, R0		@ set reverse num = input
    MOV R2, #31		@ set counter to size of word
    LSR R0, R0, #1	@ shift num right 1
loopReverse:
	LSL R1, R1, #1	@ shift reverse num left 1
	AND R3, R0, #1	@ bitwise and num and 1
	ORR R1, R1, R3	@ bitwise or the result of the prev and reverse num
	LSR R0, R0, #1	@ shift num right 1
	SUB R2, R2, #1	@ decrement counter by 1
	CMP R2, #0		@ compare counter to 0
	BNE loopReverse	@ branch if not equal
	LSL R1, R1, R2	@ shift reverse num left remaining number of bits
	MOV R0, R1		@ move reverse num to return
    BX LR;			@ branch back to c program
    
.endfunc
