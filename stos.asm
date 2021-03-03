extern scanf, printf
default rel
global main
section .data
	liczba dd 0
	format db "%d",0
	spacja db 10
section .text
main:
	push rbp
	mov rbp, rsp
	
	mov r12d,0
_petla:
	mov rdi, format
	mov rsi, liczba
	xor rax, rax
	call scanf wrt ..plt

	mov eax,[liczba]
	cmp eax,0
	je _wypisz

	inc r12d	
	push rax                    ; wypycha si 8 bajtow - zabezpieczenie stosu - wypychasz 2 rejestry - chuj nie wiem czemu dokladnie
	push r12
	jmp _petla
_wypisz:
	cmp r12d, 0 
	je _koniec
	
	mov rdi, format
	pop rax
	pop rsi
	xor rax, rax
	call printf wrt ..plt

	mov rdi, spacja
	xor rax, rax
	call printf wrt ..plt
	
	dec r12d
	jmp _wypisz
_koniec:
	mov rsp, rbp
	pop rbp 
	ret
	
	
