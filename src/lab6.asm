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
	mov r12d, eas 	; tutaj dodalem ta linijke codu
	sub eax, ebx	;tutaj zmienilem na sub z compare chyba ---------------;porównać liczby zapisane w eax i ebx (patrz wyżej)
	je wynik	;jump if equal 
	ja petla_while	; tutaj wyebalem petla i dalej petla_while ----2--------- ;tutaj wyebalem wieksze i dalem petla	--------------;jezeli wieksze (jump if above)
	sub ebx, eax	;odejmuje liczby
	jmp petla_while


;wieksze wyebalem-----------------

wynik:
	mov rdi, napis		;do rdi wkladamy napis
	mov esi, [liczby+4]	;
	mov edx, [liczby]
	mov ecx, ebx	;tutaj zmienilem na ebx drugi wyraz ----------;trzeba przekazac, poniewaz trzeba wyzerowac
	xor eax, eax
	call printf

koniec:
	ret
