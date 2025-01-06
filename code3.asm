section .text
    global _start             ; Must be declared for linker

_start:
    ; Writing the name 'Zara Ali'
    mov rdx, 9                ; Message length
    mov rsi, name             ; Pointer to message
    mov rdi, 1                ; File descriptor (stdout)
    mov rax, 1                ; System call number (sys_write)
    syscall                   ; Call kernel

    ; Changing the name to 'Nuha Ali'
    mov dword [name], 'NuhA'  ; Update first 4 bytes to 'NuhA'
    mov word [name + 4], ' l' ; Update next 2 bytes to ' l'
    
    ; Writing the updated name 'Nuha Ali'
    mov rdx, 8                ; Message length
    mov rsi, name             ; Pointer to updated message
    mov rdi, 1                ; File descriptor (stdout)
    mov rax, 1                ; System call number (sys_write)
    syscall                   ; Call kernel

    ; Exit the program
    mov rax, 60               ; System call number (sys_exit)
    xor rdi, rdi              ; Exit status 0
    syscall                   ; Call kernel

section .data
    name db 'Zara Ali ', 0    ; Null-terminated string
