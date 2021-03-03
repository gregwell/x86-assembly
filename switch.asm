default rel
extern printf, scanf
global main
section .data
	tab dq _wkl,_wkl,_def,_def,_dsk,_dsk,_def,_obiad	
	godzina dd 0
	format db "%d",0
	napis1 db "wyklad",10,0
	napis2 db "dyskusja",10,0
	napis3 db "obiad",10,0
	napis4 db "brak zajec",10,0
section .text
main:
	push rbp 
	mov rbp ,rsp

	mov rdi, format
	mov rsi, godzina
	xor rax,rax
	call scanf wrt ..plt

	mov eax, [godzina]
	cmp eax, 7
	jl _def
	cmp eax, 14
	jg _def

	jmp qword [tab + 8*rax - 56]   ; odejmuje 56 bo gdyby bylo 7 to skoczyloby na 7 elemnt tablicy, a powinno na 1sz (zerowy)

_wkl:
	mov rdi, napis1
	xor rax, rax
	call printf wrt ..plt


	
