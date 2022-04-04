section .data                       ; Initialized data section

section .bss                        ; Uninitialized data section

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
