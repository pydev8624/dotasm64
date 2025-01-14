section .data
    divisor dq 4     ; Define divisor as 64-bit integer

section .bss
    quotient resq 1             ; Reserve space for quotient
    remainder resq 1            ; Reserve space for remainder

section .text
    global _start

_start:
    ; Load dividend into RAX and RDX
    mov rax, 8         ; Lower 64 bits of dividend
    mov rdx, 0         ; Upper 64 bits of dividend (high)

    ; Load divisor into RBX
    mov rbx, [divisor]          ; Load divisor into RBX

    ; Perform unsigned division
    div rbx                     ; RDX:RAX / RBX
                                ; Quotient -> RAX, Remainder -> RDX

    ; Store results
    mov [quotient], rax         ; Store quotient
    mov [remainder], rdx        ; Store remainder

    ; Exit program (Linux syscall)
    mov rax, 60                 ; Syscall: exit
    xor rdi, rdi                ; Exit code: 0
    syscall
