section .data                       ; Initialized data section

section .bss                        ; Uninitialized data section
    buff resb 1024
    .len equ $-buff

section .text                       ; Code section
    global _start                   ; Entry point

_start:
    nop                             ; Make gdb happy...

read:
    mov eax, 3                      ; SYS_read call
    mov ebx, 0                      ; stdin
    mov ecx, buff                   ; Buff address
    mov edx, buff.len               ; Buff length
    int 0x80                        ; Make system call
    cmp eax, 0                      ; Check bytes read count
    jz exit                         ; If read zero bytes goto 'exit'

    mov esi, eax                    ; Save bytes read count
    mov ecx, eax                    ; Init counter

scan:
    cmp byte [buff-1+ecx], 'a'      ; Compare current byte with 'a'
    jl next                         ; If it's less than 'a', then goto 'next'
    cmp byte [buff-1+ecx], 'z'      ; Compare current byte with 'z'
    jg next                         ; If it's greater than 'z', then goto 'next'
    sub byte [buff-1+ecx], 32       ; Subtract 32 from current byte to make it uppercase
next:
    dec ecx                         ; Decrement counter
    jnz scan                        ; If counter is not zero goto 'scan'

write:
    mov eax, 4                      ; SYS_write call
    mov ebx, 1                      ; stdout
    mov ecx, buff                   ; Buff address
    mov edx, esi                    ; Buff length
    int 0x80                        ; Make system call
    jmp read

exit:
    mov eax, 1                      ; SYS_exit call
    mov ebx, 0                      ; Success: 0
    int 0x80                        ; Make system call
