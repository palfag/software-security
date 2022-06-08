section .text
  global _start
    _start:
      ; Store the argument string on stack
      xor  rax, rax 
      push rax          ; Use 0 to terminate the string


; "/bin/bas"
; "h*******"

      mov rcx, "h*******"
      shl rcx, 56
      shr rcx, 56
      push rcx
      mov  rdx, "/bin/bas"
      push rdx
      mov  rdi, rsp     ; 1st argument

      ; Construct the argument array argv[]
      push rax          ; argv[1] = 0
      push rdi          ; argv[0] points "/bin/bash"
      mov  rsi, rsp     ; Get the address of argv[] - 2nd argument
   
      ; For environment variable 
      xor  rdx, rdx     ; No env variables  3rd argument

      ; Invoke execve()
      xor  rax, rax     ; eax = 0x00000000
      mov   al, 0x3b    ; eax = 0x0000000b
      syscall