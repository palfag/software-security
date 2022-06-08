section .text
  global _start
    _start:
      BITS 32
      jmp short two

    one:
      pop ebx
      xor eax, eax
      mov [ebx+12], al
      mov [ebx+13], ebx
      mov [ebx+17], eax
      mov [ebx+25], al
      mov [ebx+30], al
      mov [ebx+39], eax
      lea ecx, [ebx+21]
      mov [ebx+31], ecx
      lea ecx, [ebx+26]
      mov [ebx+35], ecx
      lea edx, [ebx+31]
      lea ecx, [ebx+13]
      xor eax, eax
      mov al, 0x0b
      int 0x80

    two:
      call one
      db '/usr/bin/env*AAAABBBBa=11*b=22*CCCCDDDDEEEE';