extern printf, scanf
default rel
global main
section .data
	sperma db "%d",0    ;   scanf("%d",&liczba) ;definiujew typ danych
	;liczba dd 0 	; liczba - adres , [liczba] - wartosc (32b bo dd ),     C++   -  int *liczba - wykomentowane 
	gwiazdka db "*",0
section .bss
	linia resb 1 ; rezerwuesz j bajt ( 1x declarebyte = 1 db tak jakby) w pamieci dla linii
	liczba resd 1 ; = reseerve dword x 1 (chyba mozna rownowaznie napisac reserve byte x 4)
section .text
main:
	push rbp
	mov rbp, rsp

	mov al, 10 		; do al (8 bitowy rejestr) pakujesz 10 
	mov byte [linia], al	; do wartosci liniapakujesz to co jest w rejestrze al(czyli wpakowane 10)
	
	mov rdi, sperma
	mov rsi, liczba 
	xor rax, rax
	call scanf 

	mov r12d, [liczba]
	cmp r12d, 0 
	je koniec
	
petla:
	cmp r12d, 0
	je koniec
	mov r13d, [liczba]
	
petla2:
	cmp r13d, 0 
	je linijka
	
	mov rdi, gwiazdka
	xor rax, rax
	call printf

	dec r13d
	jmp petla2
linijka:
	mov rdi, linia
	xor rax, rax
	call printf
	
	dec r12d
	jmp petla

koniec:
	mov rsp,rbp
	pop rbp
	ret


  	; db - declare byte - 8 bit / 1 byte - char
	; dw - declare word - 16 bit / 2 byte - short (np. int)
	; dd - declare dword - 32 bit / 4 byte - int, float
	; dq - declare qword - 64 bit / 8 byte - double

	; resb - reserve byte - rezerwuje byte
	; resd - reserve dword - rezerwuje dword 
	
	

	

	
