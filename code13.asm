section .data
    msg db "ZF=1", 0xA ; Message to print followed by a newline
    len equ $ - msg      ; Length of the message

section .bss

section .text
    global _start

_start:
    ; Perform the addition: -1 + 1
    mov rax, -1          ; Load -1 into rax
    add rax, 1           ; Add 1 to rax

    ; Check if the zero flag is set (ZF == 1)
    je .zero_flag_set    ; Jump if ZF is set

.exit:
    ; Exit program
    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; status: 0
    syscall

.zero_flag_set:
    ; Write "ZF=1" to stdout
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; file descriptor: stdout
    mov rsi, msg         ; message to write
    mov rdx, len         ; message length
    syscall

    jmp .exit
