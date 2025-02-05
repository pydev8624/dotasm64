section .bss
    buffer resb 20  ; Reserve space for string conversion

section .data
    num dq 10          ; Declare and initialize x with 5
    newline db 10   ; Newline character

section .text
    global _start

_start:
    ; Increment num
    ;inc qword [num]
    ; Decrement num
    ;dec qword [num]
    
    mov rax,[num]
    ; increment rax
    inc rax
    ; Decremeny rax
    ;dec rax
    mov [num],rax

    ; Convert num to string
    mov rax, [num]    ; Load x into RAX
    mov rdi, buffer ; Set destination buffer
    call int_to_str ; Convert integer to string

    ; Print the result
    mov rsi, buffer ; String address
    mov rdx, 20     ; Max length
    call print_str  ; Print string

    ; Print newline
    mov rsi, newline
    mov rdx, 1
    call print_str

    ; Exit program
    mov rax, 60     ; syscall: exit
    xor rdi, rdi    ; status 0
    syscall

; Convert integer in RAX to string at RDI
int_to_str:
    mov rbx, 10     ; Divisor for base 10
    mov rcx, 0      ; Counter
    mov r8, rdi     ; Save buffer pointer

.reverse:
    xor rdx, rdx    ; Clear RDX for division
    div rbx         ; RAX /= 10, remainder in RDX
    add dl, '0'     ; Convert remainder to ASCII
    mov [rdi], dl   ; Store character
    inc rdi         ; Move buffer pointer
    inc rcx         ; Increase count
    test rax, rax   ; Check if RAX is zero
    jnz .reverse    ; Repeat if not zero

    mov rdi, r8     ; Restore buffer pointer
    add rdi, rcx    ; Move to end of string
    mov byte [rdi], 0  ; Null-terminate
    ret

; Print string at RSI with length RDX
print_str:
    mov rax, 1      ; syscall: write
    mov rdi, 1      ; file descriptor: stdout
    syscall
    ret
