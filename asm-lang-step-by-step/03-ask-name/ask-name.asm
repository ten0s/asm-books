section .data           ; Section containing initialised data
    msg1: db "What's your name? "
    .len: equ $ - msg1
    msg2: db "Hello, "
    .len: equ $ - msg2
    msg3: db "!", 0x0a
    .len: equ $ - msg3
	
section .bss            ; Section containing uninitialized data	
    buff: resb 255
    .len: equ $ - buff
    read: resb 1

section .text           ; Section containing code
    global _start       ; Linker needs this to find the entry point!

_start:
    nop                 ; This no-op keeps gdb happy...

    mov eax, 4          ; Specify sys_write call
    mov ebx, 1          ; Specify File Descriptor 1: Standard Output
    mov ecx, msg1       ; Pass offset of the message
    mov edx, msg1.len   ; Pass the length of the message
    int 0x80            ; Make kernel call

	mov eax, 3          ; Specify sys_read call
    mov ebx, 0          ; Specify File Descriptor 0: Standard Input
    mov ecx, buff       ; Pass offset of the buffer
    mov edx, buff.len   ; Pass the length of the buffer
    int 0x80            ; Make kernel call
	
	;; EAX holds read buff length including New Line
	dec eax             ; Get rid of New Line
    mov [read], eax     ; Store read buffer length without Lew Line

    mov eax, 4          ; Specify sys_write call
    mov ebx, 1          ; Specify File Descriptor 1: Standard Output
    mov ecx, msg2       ; Pass offset of the message
    mov edx, msg2.len   ; Pass the length of the message
    int 0x80            ; Make kernel call

	mov eax, 4          ; Specify sys_write call
    mov ebx, 1          ; Specify File Descriptor 1: Standard Output
    mov ecx, buff       ; Pass offset of the message
    mov edx, [read]     ; Pass the length of the message
    int 0x80            ; Make kernel call

	mov eax, 4          ; Specify sys_write call
    mov ebx, 1          ; Specify File Descriptor 1: Standard Output
    mov ecx, msg3       ; Pass offset of the message
    mov edx, msg3.len   ; Pass the length of the message
    int 0x80            ; Make kernel call

    mov eax, 1          ; Code for sys_exit call
    mov ebx, 0          ; Return a code of zero
    int 0x80            ; Make kernel call
