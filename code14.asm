section .data
    msg db "ZF=0", 0xA ; Message to print followed by a newline
    len equ $ - msg      ; Length of the message

section .bss

section .text
    global _start

_start:
    ; Perform the addition: -1 + 1
    mov rax, 2          ; Load -1 into rax
    add rax, 4           ; Add 1 to rax

    ; Check if the zero flag is set (ZF == 0)
    jnz .zero_flag_not_set    ; Jump if ZF is not set

.exit:
    ; Exit program
    mov rax, 60          ; syscall: exit
    xor rdi, rdi         ; status: 0
    syscall

.zero_flag_not_set:
    ; Write "ZF=0" to stdout
    mov rax, 1           ; syscall: write
    mov rdi, 1           ; file descriptor: stdout
    mov rsi, msg         ; message to write
    mov rdx, len         ; message length
    syscall

    jmp .exit
