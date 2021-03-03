
	 ; arguemnty przekazywane do funkcji po kolei w asmie (rdi, rsi, rdx, rcx,r8,r9)
section .text
global suma
suma:
	add edi, esi
	
	mov eax, edi
	ret
	
