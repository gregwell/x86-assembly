global main
extern printf
extern scanf

section .data
	format: db "%d",0
	napis: db "NWD (%d, %d)= %d",10, 0



section .bss
	liczby: resq 1	 ;jedno poczwórne słowo
		resd 2	 ;wskaznik na adres 1 elementu
	




section .text
main: 
	mov r12, 4	;dodajemy do rejestru dwunastego 4
petla_scanf:
	mov rsi, liczby	;inicjacja wartoscia poczatkowa
	add rsi, r12	;dodaje adres 






	mov rdi, format	;przenosi "format" do rdi
	xor eax, eax	;zerujemy
	call scanf	;wywołujemy
	cmp eax, 0	;porównujemy
	jz koniec	;jump if zero -> koniec	
	sub r12, 4	;odejmujemy od rejestru dwunastego 4
	jae petla_scanf	;Jump if Above or Equal do odejmowania powyżej

	mov eax, [liczby+4]
	mov ebx, [liczby]


petla_while:
	mov r12d, eax	;?
	sub eax, ebx	;odejmuje 					!!!!!!
	je wynik	;jump if equal 
	ja petla_while	;jezeli wieksze (jump if above)			!!!!!!
	sub ebx, r12d	;odejmuje liczby
	jmp petla_while


;wieksze:					TEGO NIE MA WTEDY !!!!
	;sub eax, ebx	;odejmuje liczby
	;jmp petla_while


wynik:
	mov rdi, napis		;do rdi wkladamy napis
	mov esi, [liczby+4]	;przenosi jedna liczbe
	mov edx, [liczby]	;przenosi druga liczbe
	mov ecx, ebx	;trzeba przekazac, poniewaz trzeba wyzerowac	!!!!!!
	xor eax, eax
	call printf

koniec:
	ret

