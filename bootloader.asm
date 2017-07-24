org 0x7C00
;jmp _start
;section .bss
;section .data
;section .text
;global _start
;BITMASK equ 0xFF

;_start:
;mov dx, 0x7C02
;mov es, dx
;mov ah, 0x13
;mov bh, 0x00
;mov cx, 8
;mov dh, 0x00
;mov dl, 0x00
;mov bp, msg
;int 0x10

;mov ah, 0x01
;mov ch, 0x00	
;mov cl, 0x00		;0x60 = 0100 0000 bit6 on
;int 0x10

mov ah, 0x02
mov bh, 0x00
mov dh, 0x01
mov dl, 0x00
int 0x10

mov ah, 0x0A
mov al, '>'
mov bh, 0x00
mov cx, 0x01
int 0x10

mov ah, 0x02
mov bh, 0x00
inc dl
int 0x10

putchar:
mov ah, 0x00
int 0x16

cmp al, 0x02
je case_stx
cmp al, 0x03
je case_etx
cmp al, 0x08
je case_bs
cmp al, 0x09
je case_tb
cmp al, 0x0A
je case_ent
jmp def

case_stx:		;inicio
mov ah, 0x02
mov bh, 0x00
mov dl, 1
int 0x10
jmp switch_end

case_etx:
jmp switch_end

case_bs:		;backspace
mov ah, 0x02
mov bh, 0x00
cmp dl, 1
je switch_end
dec dl
int 0x10
mov ah, 0x0A
mov al, ' '
mov bh, 0x00
mov cx, 0x01
int 0x10
jmp switch_end

case_tb:		;tab
mov ah, 0x02
mov bh, 0x00
add dl, 4
int 0x10
jmp switch_end

case_ent:		;enter
mov ah, 0x02
mov bh, 0x00
inc dh
int 0x10
mov ah, 0x0A
mov al, '>'
mov bh, 0x00
mov cx, 0x01
int 0x10
mov ah, 0x02
mov bh, 0x00
inc dl
int 0x10
jmp switch_end

def:			;default
mov ah, 0x0A
mov bh, 0x00
mov cx, 0x01
int 0x10
mov ah, 0x02
mov bh, 0x00
inc dl
int 0x10

switch_end:
jmp putchar

;msg: db "Welcome!"
times 0x0200 - 2 - ($ - $$) db 0
dw 0x0AA55

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;section stage2;, vstart=0x00
;sector_2:
