section .text
    global _start          ; must be declared for linker (ld)

_start:                    ; tell linker entry point
    mov rdx, 8            ; message length
    mov rsi, stars        ; message to write (pointer)
    mov rdi, 1            ; file descriptor (stdout)
    mov rax, 1            ; system call number (sys_write)
    syscall               ; call kernel

    mov rax, 60           ; system call number (sys_exit)
    xor rdi, rdi          ; exit code 0
    syscall               ; call kernel

section .data
stars   times 9 db 'A'
