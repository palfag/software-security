section .text
  global _start
    _start:
		BITS 32
		jmp short two
    one:
		pop ebx
		xor eax, eax
		mov [ebx+12], al
		mov [ebx+13], ebx ; al posto delle 4 AAAA
		mov [ebx+17], eax
		

		push eax
		push "a=11"
		pop ecx
		mov [ebx+21], ecx
		xor eax, eax
		mov [ebx+25], al 


		push eax
		push "b=22"
		pop ecx
		mov [ebx+26], ecx
		mov [ebx+30], al

		lea ecx, [ebx+21]
		mov [ebx+31], ecx ; ptr -> a=11
		
		lea ecx, [ebx+26]
		mov [ebx+35], ecx ; ptr -> b=22

		mov [ebx+39], eax ; fill with zero



		lea ecx, [ebx+13]
		lea edx, [ebx+31]

		mov al,  0x0b
		int 0x80
     two:
		call one
		db '/usr/bin/env*AAAABBBBCCCCDDDDEEEEFFFFGGGGHH' 
