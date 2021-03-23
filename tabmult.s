@ Programme tabmult : Affiche les tables de multiplication de de 1 a 10
N_MAX= 10
   .data
barre :  .byte '|'
         .byte 0
espace : .byte ' '
         .byte 0
tirets : .asciz "---"

debutTab:    .skip N_MAX*N_MAX*4   @ adresse du debut du tableau

   .text
   .global main
main: push {lr}

    @ remplissage du tableau
        @ a completer...

    @ affichage du tableau
        @ a completer...
    mov r0, #0
readloop:
    cmp r0, #100 
    beq finreadloop                 @fin si r0=100
    ldr r1, =debutTab
    lsl r2, r0, #2
    ldr r1, [R2]
    add r2, r1, r2
    ldr r1, [r2]


    add r0, r0, #1              @r0=r0+1
    b readloop
finreadloop:

fin: pop {lr}
     bx lr

ptr_debutTab : .word debutTab
adr_barre :    .word barre
adr_espace :   .word espace
adr_tirets :   .word tirets
