extern printf, scanf
default rel
global main
section .data
	format db "%d",0    ;   scanf("%d",&liczba)
	liczba dd 0 	; liczba - adres , [liczba] - wartosc (32b bo dd ),     C++   -  int *liczba
	gwiazdka db "*",0
	linia db 'EOL"
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
	mov r15d, [liczba]
petla2:	
	mov rdi, gwiazdka
	xor rax, rax
	call printf
	
	
	cmp r15d, 0
	dec r15d
	ja petla2

	mov rdi, linia
	xor rax,rax
	call printf

	cmp r12d, 0
	dec r12d
	ja petla               ; printf("aaddas %d")
	

koniec:
	mov rsp,rbp
	pop rbp
	ret

	

	

	
