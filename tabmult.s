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
    mov r0, #0          @ r0 = 0
    mov r3, #0          @ r3 = 0

bigl:
    bl AlaLigne    
    mov r0,#1           @ r0 = 1, r0 correspond au nombre de colone, on reinitialise sa valeur a 1
    cmp r3, #10         @ r3 == 10 ?
    bcs fin             @ si oui, on a fini car r3 correspond au nombre de ligne 

    add r3, r3, #1      @ sinon r3 = r3 + 1
    b loop              @ on rentre dans notre boucle

loop:
    cmp r0, #11         @ r0 == 11 ?
    bcs bigl            @ si oui on retourne dans bigl

    ldr r1, adr_barre   @ on affiche une Barre
    bl EcrChn         
    
    mul r1, r0, r3      @ r1 = r0 * r3

    str r1, [r2]        @ on stock r1, qui correspond a mul
    bl EcrNdecim32      @ on affiche la valeur multiplié

compar:
    cmp r1,#10          @ r1 < 10 ?
    bcs comparr         @ si oui on va directement dans comparr 

    ldr r1, adr_espace  @ on affiche 2 espace
    bl EcrChn
    bl EcrChn

comparr:
    cmp r1,#100         @ r1 < 100 ?
    bcs fcompar         @ si oui on va directement dans fcompar 

    ldr r1, adr_espace  @ on affiche 1 espace
    bl EcrChn

fcompar:

    add r0,r0,#1        @ r0 = r0 + 1
    b loop              @ on retourne dans loop

finloop:
    ldr r1, adr_barre 
    bl EcrChn


fin: pop {lr}
     bx lr

ptr_debutTab : .word debutTab
adr_barre :    .word barre
adr_espace :   .word espace
adr_tirets :   .word tirets

