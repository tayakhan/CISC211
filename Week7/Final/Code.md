```asm
section .data
    msg         db 'tea'              ; One-word message
    msg_len     equ 3
    
    key         db 'DOG'              ; One-word key
    
    label1      db 'Plain text: ', 0
    l1_len      equ 12
    
    label2      db 10, 'Key: ', 0
    l2_len      equ 6
    
    label3      db 10, 'Encrypted text: ', 0
    l3_len      equ 17
    
    label4      db 10, 'Decrypted text: ', 0
    l4_len      equ 17
    newline     db 10

section .bss
    encrypted   resb 3
    decrypted   resb 3

section .text
    global _start

_start:
    ; Encryption 
    mov ecx, 3
    mov esi, 0
encrypt:
    mov al, [msg + esi]
    mov bl, [key + esi]
    xor al, bl
    mov [encrypted + esi], al
    inc esi
    loop encrypt

    ; Decryption 
    mov ecx, 3
    mov esi, 0
decrypt:
    mov al, [encrypted + esi]
    mov bl, [key + esi]
    xor al, bl
    mov [decrypted + esi], al
    inc esi
    loop decrypt

    
    ; Print Plain text label and 'tea'
    mov eax, 4
    mov ebx, 1
    mov ecx, label1
    mov edx, l1_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 3
    int 0x80

    ; Print Key label and 'DOG'
    mov eax, 4
    mov ebx, 1
    mov ecx, label2
    mov edx, l2_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, key
    mov edx, 3
    int 0x80

    ; Print Encrypted label and the symbols
    mov eax, 4
    mov ebx, 1
    mov ecx, label3
    mov edx, l3_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, encrypted
    mov edx, 3
    int 0x80

    ; Print Decrypted label and original 'tea'
    mov eax, 4
    mov ebx, 1
    mov ecx, label4
    mov edx, l4_len
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, decrypted
    mov edx, 3
    int 0x80

    ; Print final newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

     ; Exit Program 
    mov eax, 1                       
    xor ebx, ebx                     
    int 0x80
