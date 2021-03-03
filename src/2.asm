extern printf, scanf
default rel
global main
section .data
	tab times 100 db 0
	formint db "ilosc duzych liter to : %d",0
	forchar db "%c",0 
section .text
main:
	push rbp
	mov rbp ,rsp
	
	mov r15, tab
	mov r13d, 0
	mov r12d, 100
_petla:
	cmp r12d, 0
	je _dalej
	
	dec r12d   ; rownowazne = sub r12d, 1

	mov rdi, forchar
	mov rsi, r15
	xor rax, rax
	call scanf wrt ..plt

	mov al, [r15]
	cmp al, 10       ; wyjscie z petli przy enterze 
	je _dalej

	cmp al, 'A'
	jl _nie
	cmp al, 'Z'
	jg _nie
	
        inc r13d
	
	_nie:

	add r15, 1    ; kolejny element tablicy dodajesz jeden bo to byte, gdyby byl dd to ys dodal 4 => wynika z wielkosci zmiennych
	jmp _petla
_dalej:
	mov rdi, formint 
	mov esi, r13d
	xor rax ,rax
	call printf wrt ..plt

	mov rsp, rbp
	pop rbp
	ret
