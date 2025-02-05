section .data
    num dq 10

section .text
    global _start
_start:
    mov rax, num
    inc rax

; Exit program
    mov rax, 60     ; syscall: exit
    xor rdi, rdi    ; status 0
    syscall
