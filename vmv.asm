global	main
extern	printf
extern inicjuj_czas
extern drukuj_czas



size	equ	 128*1048576

section	.data
zero:	dq	0.0
one:	dq	1.0
align	16
;one:	dq	1.0, 1.0
two:	dq	2.0, 2.0
align	32
four:	dq	4.0, 4.0, 4.0, 4.0
init:	dq	1.0, 2.0, 3.0, 4.0

str:		db	'%lf %lf %lf',10,0

section	.bss
align 32	
va:	resq	size
vb:	resq	size
vc:	resq	size

section	.text

main:
sub	rsp,8


call	fill3



call inicjuj_czas



call	vv3



;call	print_result1

call drukuj_czas

add	rsp,8
ret

vv1:
mov	r15d,size
mov	rax,va
mov	rbx,vb
mov	rcx,vc
vv_loop1:
movq	xmm0,[rax]
movq	xmm1,[rbx]
mulsd	xmm0,xmm0
mulsd	xmm1,xmm1
add	rax,8
addsd	xmm1,xmm0
sqrtsd	xmm0,xmm1
add	rbx,8
movq	[rcx],xmm0
add	rcx,8
dec	r15d
jne	vv_loop1
ret

vv2:
mov	r15d,size
mov	rsi,va
vv_loop2:
movq	xmm0,[rsi]
movq	xmm1,[rsi+8]
mulsd	xmm0,xmm0
mulsd	xmm1,xmm1
addsd	xmm1,xmm0
sqrtsd	xmm0,xmm1
add	rsi,24
movq	[rsi-8],xmm0
dec	r15d
jne	vv_loop2
ret

vv3:
mov	r15d,size/2
mov	rsi,va
vv_loop3:
movapd	xmm0,[rsi]
movapd	xmm1,[rsi+16]
mulpd	xmm0,xmm0
mulpd	xmm1,xmm1
addpd	xmm1,xmm0
sqrtpd	xmm0,xmm1
add	rsi,48
movapd	[rsi-16],xmm0
dec	r15d
jne	vv_loop3
ret


vv4:
mov	r15d,size/4
mov	rsi,va
vv_loop4:
vmovapd	ymm0,[rsi]
vmovapd	ymm1,[rsi+32]
vmulpd	ymm0,ymm0
vmulpd	ymm1,ymm1
vaddpd	ymm1,ymm0
vsqrtpd	ymm0,ymm1
add	rsi,96
vmovapd	[rsi-32],ymm0
dec	r15d
jne	vv_loop4
ret


fill1:
xor	r15d,r15d
movq	xmm0,[zero]
movq	xmm1,[one]
fill_loop1:
addsd	xmm0,xmm1
movq	[va+8*r15d],xmm0
movq	[vb+8*r15d],xmm0
inc	r15d
cmp	r15d,size
jne	fill_loop1
ret

fill2:
mov	r15d,size
mov	r13,va
movq	xmm0,[zero]
movq	xmm1,[one]
fill_loop2:
addsd	xmm0,xmm1
movq	[r13],xmm0
movq	[r13+8],xmm0
add	r13,24
dec	r15d
jne	fill_loop2
ret

fill3:
mov	r15d,size/2
mov	r13,va
movapd	xmm0,[init]
movapd	xmm1,[two]
fill_loop3:
movapd	[r13],xmm0
movapd	[r13+16],xmm0
addpd	xmm0,xmm1
add	r13,48
dec	r15d
jne	fill_loop3
ret

fill4:
mov	r15d,size/4
mov	r13,va
vmovapd	ymm0,[init]
vmovapd	ymm1,[four]
fill_loop4:
vmovapd	[r13],ymm0
vmovapd	[r13+32],ymm0
vaddpd	ymm0,ymm1
add	r13,96
dec	r15d
jne	fill_loop4
ret

print_result1:
xor	r15d,r15d
sub	rsp,8
print_loop1:
mov	rdi,str
movq	xmm0,[va+8*r15d]
movq	xmm1,[vb+8*r15d]
movq	xmm2,[vc+8*r15d]
mov	eax,3
call	printf
inc	r15d
cmp	r15d,size
jne	print_loop1
add	rsp,8
ret

print_result2:
sub	rsp,8
mov	r15d,size
mov	r13,va
print_loop2:
mov	rdi,str
movq	xmm0,[r13]
movq	xmm1,[r13+8]
movq	xmm2,[r13+16]
mov	eax,3
call	printf
add	r13,24
dec	r15d
jne	print_loop2
add	rsp,8
ret

print_result3:
sub	rsp,8
mov	r15d,size/2
mov	r13,va
print_loop3:
xor	r14d,r14d
print_loop3a:
mov	rdi,str
movq	xmm0,[r13+r14]
movq	xmm1,[r13+r14+16]
movq	xmm2,[r13+r14+32]
mov	eax,3
call	printf
add	r14d,8
cmp	r14d,16
jne	print_loop3a
add	r13,48
dec	r15d
jne	print_loop3
add	rsp,8
ret

print_result4:
sub	rsp,8
mov	r15d,size/4
mov	r13,va
print_loop4:
xor	r14d,r14d
print_loop4a:
mov	rdi,str
movq	xmm0,[r13+r14]
movq	xmm1,[r13+r14+32]
movq	xmm2,[r13+r14+64]
mov	eax,3
call	printf
add	r14d,8
cmp	r14d,32
jne	print_loop4a
add	r13,96
dec	r15d
jne	print_loop4
add	rsp,8
ret
