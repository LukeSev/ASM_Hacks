@FE8 Perfect Luck
@Originally by Scraiza, adapted to FE8 by osfe
.thumb

Hit:
mov     r2, r0
add     r2,#0x60
add     r1,#0x62
ldrh    r2,[r2]         @Load hit
ldrh    r1,[r1]         @Load avoid
sub     r1,r2,r1        @Calculate real hit = hit - avo
ldrb    r3,[r4,#0xB]
mov     r2,#0x80
and     r3,r2
cmp     r3,#0x80
beq     EnemyHitCheck   @Check if enemy (branch if enemy)
cmp     r1,#0x0         @Check if player's hit is > 0
ble     SetZero         @If zero hit  set combat hit value to zero
b       SetHundo        @Otherwise set to 100

EnemyHitCheck:
cmp     r1,#0x64        @For enemy  set hit to 0 if < 100 (i.e. enemy only hits if hit = 100)
bge     SetHundo 

SetZero:
mov     r1,#0x0
b       SetHundo+2

SetHundo:
mov     r1,#0x64        @Set hit to 100
mov     r2,r0
add     r2,#0x64
strh    r1,[r2]
lsl     r1,r1,#0x10
asr     r1,r1,#0x10
cmp     r1,#0x64
ble     SetZeroEnemy
mov     r0,#0x64
strh    r0,[r2]

SetZeroEnemy:
mov     r1,#0x0
ldsh    r0,[r2,r1]
cmp     r0,#0x0
bge     Done
mov     r0,#0x0
strh    r0,[r2]

Done:
bx      r14
