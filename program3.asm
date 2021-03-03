extern printf, scanf
default rel
global main
section .data
	format db "%d",0    ;   scanf("%d",&liczba)
	liczba dd 0 	; liczba - adres , [liczba] - wartosc (32b bo dd ),     C++   -  int *liczba
	gwiazdka db "*",0
section .text
main:
	push rbp
	mov rbp, rsp

	mov rdi, format
	mov rsi, liczba 
	xor rax, rax
	call scanf 

	mov r12d, [liczba]
	cmp r12d, 0 
	je koniec

petla:
	
	mov rdi, gwiazdka
	xor rax, rax
	call printf
	
	
	cmp r12d, 0
	dec r12d
	ja petla               ; printf("aaddas %d")
	

koniec:
	mov rsp,rbp
	pop rbp
	ret

	

	

	
