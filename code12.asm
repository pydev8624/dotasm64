section .data
    value dq 0x0F0F0F0F0F0F0F0F
section .text
    global _start
_start:
    mov rax, [value]    ; Load value into RAX
    not rax             ; Perform NOT operation
    ; RAX = 0xF0F0F0F0F0F0F0F0
; Exit cleanly
    mov rax, 60                       ; syscall: exit
    xor rdi, rdi                      ; exit code 0
    syscall
