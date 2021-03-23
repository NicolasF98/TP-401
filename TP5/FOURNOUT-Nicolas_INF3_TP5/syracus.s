   .data
X : .short 15
   
main:
   ldr r0, X

     mov r0, #15                @ X <- 15               
tq:  cmp r0, #1                
     beq fintq
        ldr r0, X        @ r0 <- X
        tst r0, #1                    @ r0 est il paire ?
        addeq mov r0,r0,LSR 1         @ si oui r0 <- r0%2 
        addne add r0,r0,#1,LSL #3     @ sinon, r0 <- 1 + r0*3 
     b   tq
fintq:  @ X = 0

fin:  BX LR