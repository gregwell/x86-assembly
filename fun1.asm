section .text
global fun1
fun1:
	mov ebx, [rdi]
	mov r12d, 0

	cmp ebx,10
	jl _jedno

	cmp ebx, 100
	jl _dwa
	
	mov eax,3
	mov [rdi],ebx
	jmp _koniec
_jedno:
	mov eax,1
	mov [rdi], eax
	jmp _koniec
_dwa:
	mov eax, 2
	mov [rdi], eax
_koniec:
	ret 
	
