section .data
    x dd 10          ; First integer
    y dd 20          ; Second integer
    z dd 30          ; Third integer
    result dd 0      ; Variable to store the sum

section .text
    global _start

_start:
    ; Push variables onto stack in reverse order to pass as arguments
    push dword [z]    
    push dword [y]       
    push dword [x]       

    call add_three

    ; Store the sum returned in eax into the result variable
    mov [result], eax

    ; Deallocate stack memory by adding 12 bytes (3 ints * 4 bytes) to esp
    add esp, 12

    ; System call to exit program
    mov eax, 1
    int 0x80

add_three:
    ; Prologue: save old ebp and set up new stack frame
    push ebp
    mov ebp, esp

    ; Access stack arguments using ebp offsets and add them together
    mov eax, [ebp+8]  
    add eax, [ebp+12]    
    add eax, [ebp+16]    

    ; Epilogue: restore old ebp and return to caller
    pop ebp
    ret
