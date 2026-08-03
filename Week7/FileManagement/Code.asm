section .data
    filename db 'quotes.txt', 0
    
    quote1 db 'To be, or not to be, that is the question.', 0xA, 0xA
    len1 equ $ - quote1
    quote2 db 'A fool thinks himself to be wise, but a wise man knows himself to be a fool.', 0xA, 0xA
    len2 equ $ - quote2
    
    quote3 db 'Better three hours too soon than a minute too late.', 0xA, 0xA
    len3 equ $ - quote3
    quote4 db 'No legacy is so rich as honesty.', 0xA
    len4 equ $ - quote4

section .bss
    fd_out resd 1

section .text
    global _start

_start:
    ; Create and write initial content
    mov eax, 5
    mov ebx, filename
    mov ecx, 577        ; O_CREAT | O_WRONLY | O_TRUNC
    mov edx, 0644q      
    int 0x80
    mov [fd_out], eax

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, quote1
    mov edx, len1
    int 0x80

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, quote2
    mov edx, len2
    int 0x80

    mov eax, 6
    mov ebx, [fd_out]
    int 0x80

    ; Append new content
    mov eax, 5
    mov ebx, filename
    mov ecx, 1          ; O_WRONLY
    int 0x80
    mov [fd_out], eax

    ; Move pointer to end of file
    mov eax, 19
    mov ebx, [fd_out]
    mov ecx, 0          
    mov edx, 2          
    int 0x80

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, quote3
    mov edx, len3
    int 0x80

    mov eax, 4
    mov ebx, [fd_out]
    mov ecx, quote4
    mov edx, len4
    int 0x80

    mov eax, 6
    mov ebx, [fd_out]
    int 0x80

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
