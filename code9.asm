section .data
    value1 dq 0x0F0F0F0F0F0F0F0F      ; Define a 64-bit value
    value2 dq 0xFFFF0000FFFF0000      ; Define another 64-bit value

section .text
    global _start
_start:
    mov rax, [value1]                 ; Load value1 into RAX
    mov rbx, [value2]                 ; Load value2 into RBX
    and rax, rbx                      ; Perform AND operation (RAX = RAX AND RBX)
    ; At this point, RAX contains 0x0F0F00000F0F0000
    
    ; Exit cleanly
    mov rax, 60                       ; syscall: exit
    xor rdi, rdi                      ; exit code 0
    syscall
