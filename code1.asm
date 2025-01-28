; nasm -f elf64 code.asm -o code.o
; ld code.o -o code
; ./code

; code1
section .data
    message db "Hello, World!", 0xA ; String to print with a newline
    message_len equ $ - message     ; Calculate length of the string

section .text
    global _start                  ; Define entry point

_start:
    ; Write syscall (sys_write)
    mov rax, 1                     ; Syscall number for write (1)
    mov rdi, 1                     ; File descriptor (1 = stdout)
    mov rsi, message               ; Address of the message
    mov rdx, message_len           ; Length of the message
    syscall                        ; Invoke the system call

    ; Exit syscall (sys_exit)
    mov rax, 60                    ; Syscall number for exit (60)
    xor rdi, rdi                   ; Exit code (0)
    syscall                        ; Invoke the system call
