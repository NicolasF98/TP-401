   .data
debutTAB: .skip 2*4 @ reservation de 8 octets
                @ sans valeur initiale

   .text
   .global main
main:
   ldr r0, ptr_debutTAB
   mov r1, #8   @ x = 7

tq:
   cmp r1, #1
   beq fintq
   ldr r0, ptr_debutTAB

   
   tst r1,#1 @x paire ?
   mov r1, r1, asr #1 @ si oui division par 2
   add r0, r0, #4
   str r1, [r0]
	
   mov r2, r1     @ on sauvegard la valeur de x dans r2
   str r2, [r1]   @ on sauvegard la valeur de x dans r2
   lsl r1, r1, #1 @ si non multiplication par 2
   add r1, r1, r2 @ on ajoute x a 2x
   add r1, r1, #1 @ on ajoute 1 a 3x
   add r0, r0, #4
   str r1, [r0]

   b tq
 
fintq: @ X = 0

fin:  BX LR

ptr_debutTAB : .word debutTAB

