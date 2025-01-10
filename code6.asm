section .data
    msg1 db 'Python is better but', 0xA, 0xD
    len1 equ $ - msg1

    msg2 db 'Assembly is the best', 0xA, 0xD
    len2 equ $ - msg2

section .text
    global _start

_start:
    ; Write msg1 to STDOUT
    mov rax, 1          ; syscall: SYS_WRITE
    mov rdi, 1          ; file descriptor: STDOUT
    mov rsi, msg1       ; pointer to message
    mov rdx, len1       ; message length
    syscall

    ; Write msg2 to STDOUT
    mov rax, 1          ; syscall: SYS_WRITE
    mov rdi, 1          ; file descriptor: STDOUT
    mov rsi, msg2       ; pointer to message
    mov rdx, len2       ; message length
    syscall

 

    ; Exit the program
    mov rax, 60         ; syscall: SYS_EXIT
    xor rdi, rdi        ; exit code 0
    syscall
