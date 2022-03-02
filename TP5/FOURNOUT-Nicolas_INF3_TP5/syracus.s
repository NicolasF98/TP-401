    .data
X : .word 14
  
  .text
  .global main
main:
   LDR r0, ptr_X
   LDR r0, [r0]

   MOV r0, #14  @ X <- 14 

tq:  MOV r1, r0
     BL EcrNdecimal32
     CMP r0, #1
     BEQ fintq
        TST r0, #1 			@ r0 est il paire ?
	BNE impair
	ASR r0, r0, #1        	@ si oui r0 <- r0/2  
     B   tq
impair:
	MOV r1, r0			@ on sauvegarde la valeure r0 dans r1	
	LSL r0, r0, #1			@ sinon r0 <- r0*2
	ADD r0, r0, r1			@ r0 <- r0*2 + r0
	ADD r0, r0, #1			@ r0 <- r0*3 + 1 
	B tq
pair:
	B tq

fintq:  @ X = 0

fin:  BX LR

ptr_X: .word X
