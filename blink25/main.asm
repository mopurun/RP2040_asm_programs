.syntax unified
.cpu cortex-m0plus
.thumb

.include "boot2.asm"


.section .vt, "ax"


.word 0         // stack init value (unused)
.word main      // entry point


.type main, %function
.global main
main:
    ldr  r0, =0x4000c000
    ldr  r2, [r0, 0] //reset
    movs r1, 0x20 //IO_BANK
    bics r2,r2,r1
    str  r2,  [r0, 0]
main2:
    ldr  r2,  [r0, 8] //RESET_DONE
    ands r2,r2,r1
    beq  main2

  // p13 p28 p47  p46

    ldr  r0, =0x400140cc //p13 SIO p247
    movs r1, #5
    str  r1, [r0, 0]

    ldr  r0, =0xd0000000 //p28
    ldr  r1, =0x02000000 //gpio25
    str  r1 , [r0 , 0x024]


loop:

    str  r1 , [r0 , 0x01c]
    bl wait


    b loop


wait:
    movs r4, #0
wait3:
    movs r3, #0
wait1:
    movs r2, #0 
wait2:

    adds r2, r2, #1
    cmp r2, #255
    bne wait2

    adds r3, r3, #1    
    cmp r3, #255
    bne wait1

    adds r4, r4, #1    
    cmp r4, #5
    bne wait3    

    bx lr


