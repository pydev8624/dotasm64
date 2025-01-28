; Conditional Jump Demonstration Program
; Assembly x86-64 (NASM)

section .data
    ; Strings to print for each jump instruction
    msg_jz db "JZ (Jump if Zero) executed", 0xA, 0xD
    msg_jnz db "JNZ (Jump if Not Zero) executed", 0xA, 0xD
    msg_ja db "JA (Jump if Above) executed", 0xA, 0xD
    msg_jb db "JB (Jump if Below) executed", 0xA, 0xD
    msg_jg db "JG (Jump if Greater) executed", 0xA, 0xD
    msg_jl db "JL (Jump if Less) executed", 0xA, 0xD
    msg_jcxz db "JCXZ (Jump if CX Zero) executed", 0xA, 0xD

section .bss
    ; Uninitialized data
    temp resb 8

section .text
    global _start

_start:
    ; Example setup for flags and registers
    mov rax, 5        ; Set RAX = 5
    mov rbx, 5        ; Set RBX = 5
    mov rcx, 0        ; Set RCX = 0

    ; Conditional jumps with corresponding actions

    ; JE / JZ
    cmp rax, rbx      ; Compare RAX and RBX
    je print_jz        ; Jump if equal (ZF = 1)

    ; JNE / JNZ
    cmp rax, 10       ; Compare RAX with 10
    jne print_jnz      ; Jump if not equal (ZF = 0)

    ; JA (Jump if Above, unsigned comparison)
    mov rax, 10
    cmp rax, 5
    ja print_ja        ; Jump if CF = 0 and ZF = 0

    ; JB (Jump if Below, unsigned comparison)
    cmp rax, 15
    jb print_jb        ; Jump if CF = 1

    ; JG (Jump if Greater, signed comparison)
    mov rax, 5
    cmp rax, 3
    jg print_jg        ; Jump if ZF = 0 and SF = OF

    ; JL (Jump if Less, signed comparison)
    cmp rax, 10
    jl print_jl        ; Jump if SF ≠ OF

    ; JCXZ (Jump if CX = 0)
    cmp rcx, 0         ; Compare RCX with 0
    je print_jcxz      ; Jump if RCX is 0 (ZF = 1)

    ; Exit program if no jump occurs
    mov rax, 60        ; syscall: exit
    xor rdi, rdi       ; status: 0
    syscall

; Printing routines

print_jz:
    ; Print the message for JZ
    mov rsi, msg_jz   ; Correctly move the message address to RSI
    mov rdx, 28       ; Set the correct length of msg_jz (28 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_jnz:
    ; Print the message for JNZ
    mov rsi, msg_jnz
    mov rdx, 31       ; Set the correct length of msg_jnz (31 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_ja:
    ; Print the message for JA
    mov rsi, msg_ja
    mov rdx, 28       ; Set the correct length of msg_ja (28 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_jb:
    ; Print the message for JB
    mov rsi, msg_jb
    mov rdx, 29       ; Set the correct length of msg_jb (29 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_jg:
    ; Print the message for JG
    mov rsi, msg_jg
    mov rdx, 30       ; Set the correct length of msg_jg (30 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_jl:
    ; Print the message for JL
    mov rsi, msg_jl
    mov rdx, 30       ; Set the correct length of msg_jl (30 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall
    jmp end_program   ; Jump to end after printing

print_jcxz:
    ; Print the message for JCXZ
    mov rsi, msg_jcxz
    mov rdx, 33       ; Set the correct length of msg_jcxz (33 bytes)
    ; syscall: write
    mov rax, 1        ; syscall: write
    mov rdi, 1        ; file descriptor: stdout
    syscall

end_program:
    ; Exit program
    mov rax, 60        ; syscall: exit
    xor rdi, rdi       ; status: 0
    syscall
