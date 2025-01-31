section .text
    global _start
_start:

    ; System call: exit(code=0)

    mov rax, 60         ; System call number for exit
    xor rdi, rdi        ; Exit code 0 clear output

    ; 0110 1100
    ; 0110 1100
    ; 0000 0000 --> ZF=1

    syscall             ; Invoke the system call    32-bit int 0x80
