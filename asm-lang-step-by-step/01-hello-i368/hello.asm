section .data                               ; Initialized data section
    msg: db "Hello World", 10
    .len: equ $-msg

section .bss                                ; Uninitialized data section

section .text                               ; Code section
    global _start                           ; Entry point

_start:
    nop                                     ; Make gdb happy...

    mov eax, 4                              ; SYS_write/__NR_write system call
    mov ebx, 1                              ; File Descriptor 1: stdout
    mov ecx, msg                            ; Message address
    mov edx, msg.len                        ; Message length
    int 0x80                                ; Make system call

    mov eax, 1                              ; SYS_exit/__NR_exit system call
    mov ebx, 0                              ; Normal exit: 0
    int 0x80                                ; Make system call
