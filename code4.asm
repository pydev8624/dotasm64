section .text
    global _start             ; Must be declared for linker

_start:
   

    ; Changing the name to 'Amir Ali'
    mov dword [name], 'Amir'  ; Update first 4 bytes to 'NuhA'
    
    ; Writing the updated name 'Amir Ali'
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
    name db 'Dara Ali ', 0    ; Null-terminated string
