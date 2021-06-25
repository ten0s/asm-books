section .data                               ; Initialized data section
    msg: db "Hello World", 10
    .len: equ $-msg

section .bss                                ; Uninitialized data section

section .text                               ; Code section
    global _start                           ; Entry point

_start:
    nop                                     ; Make gdb happy...

    mov rax, 1                              ; SYS_write/__NR_write system call
    mov rdi, 1                              ; File Descriptor 1: stdout
    mov rsi, msg                            ; Message address
    mov rdx, msg.len                        ; Message length
    syscall                                 ; Make system call

    mov rax, 60                             ; SYS_exit/__NR_exit system call
    mov rdi, 0                              ; Normal exit: 0
    syscall                                 ; Make system call
