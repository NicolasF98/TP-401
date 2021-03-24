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
    mov r3, #0

bigl:
    bl AlaLigne
    mov r0,#1
    cmp r3, #10
    bcs fin

    add r3, r3, #1
    b loop

loop:
    cmp r0, #11
    bcs bigl

    ldr r1, adr_barre
    bl EcrChn
    
    mul r1, r0, r3

    str r1, [r2]
    bl EcrNdecim32

esp:
    cmp r1,#10
    bcs fesp
    ldr r1, adr_espace
    bl EcrChn
    bl EcrChn

fesp:
    cmp r1,#100
    bcs fespp
    ldr r1, adr_espace
    bl EcrChn

fespp:

    add r0,r0,#1
    b loop

finloop:
    ldr r1, adr_barre
    bl EcrChn


fin: pop {lr}
     bx lr

ptr_debutTab : .word debutTab
adr_barre :    .word barre
adr_espace :   .word espace
adr_tirets :   .word tirets