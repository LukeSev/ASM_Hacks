@FE8 Perfect Luck
@Originally by Scraiza, adapted to FE8 by osfe
.thumb

Crit:
lsl     r0,r0,#0x0      @ NOP just for fun (:
push    {r4-r6,r14}
mov     r2,r0
mov     r6,r1
mov     r1,r2
add     r1,#0x66
mov     r0,r6
add     r0,#0x68
ldrh    r1,[r1]
ldrh    r0,[r0]
sub     r1,r1,r0
mov     r5,r2
add     r5,#0x6A        
ldrb    r3,[r4,#0xB]    @ Everything up until this point has matched the base crit calculation
mov     r2,#0x80        @ Start checking for enemy
and     r3,r2
cmp     r3,#0x0        
beq     PlayerCritCheck @ Enemy uses different crit calculation (floor instead of ceil)
cmp     r1,#0x0         @ 
ble     NoCrit
b       PerfectCrit

PlayerCritCheck:
cmp     r1,#0x64
bge     PerfectCrit

NoCrit:
mov     r1,#0x0
b       Done

PerfectCrit:
mov     r1,#0x64

Done:
mov     r4,#0x0
strh    r1,[r5]
ldr     r3,RetAddr   
bx      r3        

.align 4 
RetAddr: .long 0x802ACAC+1
