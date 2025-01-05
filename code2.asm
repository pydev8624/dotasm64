section .text
    global _start
_start:
    ; System call: exit(code=0)
    mov rax, 60         ; System call number for exit
    xor rdi, rdi        ; Exit code 0
    syscall             ; Invoke the system call    
