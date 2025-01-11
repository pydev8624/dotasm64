section .data
    ; Data section to hold variables
    num1 dq -1          ; Declare num1 with value -1 (64-bit signed integer)
    num2 dq 3           ; Declare num2 with value 3 (64-bit signed integer)

section .bss
    ; Uninitialized data section
    result resq 1       ; Reserve space for the result (64-bit)

section .text
    global _start       ; Entry point for the program

_start:
    ; Load values into registers
    mov rax, [num1]     ; Load the value of num1 into RAX
    mov rbx, [num2]     ; Load the value of num2 into RBX

    ; Perform addition
    add rax, rbx        ; Add RBX to RAX (result stored in RAX)

    ; Store the result in memory
    mov [result], rax   ; Store the result in the reserved space

    ; Exit the program
    mov rax, 60         ; Syscall number for exit
    xor rdi, rdi        ; Exit code 0
    syscall             ; Perform the syscall
