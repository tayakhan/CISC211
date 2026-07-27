section .data
    char db 0
    newline db 10

section .text
    global _start

_start:
    mov al, 'A'
    mov [char], al

main_loop:
    cmp byte [char], 'Z'
    jg end_program     ; Exit if we pass 'Z'

    call print_char_proc

    inc byte [char]    ; Move to next letter
    jmp main_loop

end_program:
    mov eax, 1         ; sys_exit
    mov ebx, 0
    int 0x80

; Procedure to handle output
print_char_proc:
    mov eax, 4         ; sys_write
    mov ebx, 1
    mov ecx, char
    mov edx, 1
    int 0x80

    mov eax, 4         ; sys_write
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ret
