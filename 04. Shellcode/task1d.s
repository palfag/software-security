section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  eax, eax

      ;4***
      push eax
      mov eax, "4***"   ;0x2A2A2A34
      shl eax, 24       ;0x34000000
      shr eax, 24       ;0x00000034
      push eax


      xor eax, eax
      
      push "=123"
      push "cccc"
      mov ecx, esp

      push eax
      push "5678"
      push "bbb="
      mov edx, esp
      
      
      push eax
      push "1234"
      push "aaa="
      mov ebx, esp


      ; For environment variable 
      ; array envp[]
      push eax
      push ecx
      push edx
      push ebx
      mov edx, esp 
      
      push eax          ; Use 0 to terminate the string
      push "/env"
      push "/bin"
      push "/usr"
      mov  ebx, esp     ; Get the string address 

      ; Construct the argument array argv[]
      push eax          ; argv[1] = 0
      push ebx          ; argv[0] points "/usr/bin/env"
      mov  ecx, esp     ; Get the address of argv[]
      

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
