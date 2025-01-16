section .data
    value1 dq 0x0F0F0F0F0F0F0F0F
    value2 dq 0xFFFF0000FFFF0000
section .text
    global _start
_start:
    mov rax, [value1]    ; Load value1 into RAX
    or rax, [value2]     ; Perform OR operation with value2
    ; RAX = 0xFFFF0F0FFFFF0F0F
 ; Exit cleanly
    mov rax, 60                       ; syscall: exit
    xor rdi, rdi                      ; exit code 0
    syscall
