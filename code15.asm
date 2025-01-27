section .data
    msg_ja db "JA", 10, 0  ; "JA" with newline
    msg_jb db "JB", 10, 0  ; "JB" with newline

section .bss

section .text
    global _start

_start:
    ; Assume RAX and RBX hold two unsigned numbers to compare
    mov rax, 30  ; First number
    mov rbx, 20  ; Second number

    ; Compare RAX and RBX
    cmp rax, rbx

    ; Use JA (Jump if Above)
    ja .is_ja  ; Jump if RAX > RBX

    ; Use JB (Jump if Below)
    jb .is_jb  ; Jump if RAX < RBX

    ; Default: Exit if equal (not required to print anything for equality)
    jmp .exit

.is_ja:
    ; Print "JA"
    lea rsi, [rel msg_ja]  ; Load address of msg_ja
    call print
    jmp .exit

.is_jb:
    ; Print "JB"
    lea rsi, [rel msg_jb]  ; Load address of msg_jb
    call print

.exit:
    ; Exit program
    mov rax, 60      ; syscall: exit
    xor rdi, rdi     ; exit code 0
    syscall

; Print function (minimal example using syscall write)
print:
    mov rax, 1      ; syscall: write
    mov rdi, 1      ; file descriptor: stdout
    mov rdx, 3      ; message length ("JA\n" or "JB\n" = 3 bytes)
    syscall
    ret
