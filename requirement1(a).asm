.data
	
	sirb16: .space 100
	sirb2: .space 500
	sirb24: .asciz "101001111000 100000000001 110000000000 101001111000 100100001110 110000000100"
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%c "
	formatPrintflong: .asciz "%d "
	formatPrintfmi: .asciz "%c"
	formatPrintfmizi: .asciz "%s "
	form: .asciz "%s\n"
	spatiuq: .asciz ""
	chDelim: .asciz " "
	res: .space 4
	
	trei: .long 3
	rest: .space 4

	leti: .asciz "let"
	subi: .asciz "sub"
	muli: .asciz "mul"
	ad: .asciz "add"
	divi: .asciz "div"


	#indexSb2: .long 0
	#index: .long 0


	doizero: .long 1
	doiunu: .long 2
	doidoi: .long 4
	doitrei: .long 8
	doipatru: .long 16
	doicinci: .long 32
	doisase: .long 64
	doisapte: .long 128
	doiopt: .long 256
	doinoua: .long 512
	doizece: .long 1024
	doiunuunu: .long 2048
	doiunudoi: .long 4096
	suma1: .long 0
	nr: .space 4
	ind: .long 0
	suma2: .long 0
	minus: .long 45


	indexSb2: .long 0
	index: .long 0
.text

.global main

main:

	pushl $sirb16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $sirb16, %edi	# baza 16 e in "edi"		
	movl $sirb2, %esi	# baza 2 e in "esi"		
	xorl %ecx, %ecx



et_for:
	
	movb (%edi, %ecx, 1), %al 
	cmp $0, %al 
	je ultfaza



#incep compararile
	
	cmp $48, %al
	je cif0
	cmp $49, %al
	je cif1
	cmp $50, %al
	je cif2
	cmp $51, %al
	je cif3
	cmp $52, %al
	je cif4
	cmp $53, %al
	je cif5
	cmp $54, %al
	je cif6
	cmp $55, %al
	je cif7
	cmp $56, %al
	je cif8
	cmp $57, %al
	je cif9
	cmp $65, %al
	je litA
	cmp $66, %al
	je litB
	cmp $67, %al
	je litC
	cmp $68, %al
	je litD
	cmp $69, %al
	je litE	
	cmp $70, %al
	je litF
	cmp $97, %al
	je lita
	cmp $98, %al
	je litb
	cmp $99, %al
	je litc
	cmp $100, %al
	je litd
	cmp $101, %al
	je lite
	cmp $102, %al
	je litf	
	
cont:
	
	
	incl %ecx

	movl %ecx, %eax
	xorl %edx, %edx
	divl trei
	cmp $0, %edx
	je spatiu


	jmp et_for

cif0:
	
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


cif1:	
	
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont
	
cif2:
	
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif3:

	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif4:
	
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif5:
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif6: 

	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif7:
	
	pushl %ecx
	movl indexSb2, %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


cif8:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

cif9:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

litA:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


litB:


	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

litC:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


litD:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

litE:


	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


litF:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


lita:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

litb:


	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


litc:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

litd:


	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


lite:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $48, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont


litf:

	pushl %ecx
	movl indexSb2, %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	movb $49, (%esi, %ecx, 1)
	incl %ecx
	
	
	addl $4, indexSb2	
	
	popl %ecx
	jmp cont

spatiu:
	pushl %ecx
	
	movl indexSb2, %ecx
	movb $32, %al
	movb %al, (%esi, %ecx, 1)
	
	addl $1, indexSb2
	popl %ecx
	
	jmp et_for


ultfaza:

	pushl $chDelim
	pushl $sirb2
	call strtok 
	popl %ebx
	popl %ebx
	
	movl %eax, res
	
	mov res, %edi	
	xor %ecx, %ecx
	xor %edx, %edx
	#xor %eax, %eax
	movl %ecx, ind
	push $0
	call fflush
	pop %ebx
	jmp et_for343

et_for343:
	
	movl ind, %ecx		
	cmpl $4, ind
	je continuam

	movb (%edi,%ecx,1), %al
	
	movl %eax, res
	pushl $res
	call atoi
	popl %ebx
	movl %eax, nr
	
	cmpl $0, ind
	je c11
	cmpl $1 , ind
	je c10
	cmpl $2 , ind
	je c9
	cmpl $3 ,ind
	je c8

c11:	
	
	
	movl nr, %eax
	movl doiunuunu, %ebx
	mul %ebx
	#xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for343

c10:
	
	
	movl nr, %eax
	movl doizece, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for343

c9:
	
	
	movl nr, %eax
	movl doinoua, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for343
c8:
	
	
	movl nr, %eax
	movl doiopt, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for343

continuam:


	xor %ecx, %ecx
	xor %edx, %edx
	#xor %eax, %eax
	movl $4, %ecx
	movl %ecx, ind
	jmp et_for2

et_for2:
			
	movl ind, %ecx	
	movb (%edi,%ecx,1), %al	
	cmpb $0, %al
	je continuam2

	
	
	movl %eax, res
	pushl $res
	call atoi
	popl %ebx
	movl %eax, nr
	
	cmpl $4, ind
	je c7
	cmpl $5 , ind
	je c6
	cmpl $6 , ind
	je c5
	cmpl $7 ,ind
	je c4
	cmpl $8 ,ind
	je c3
	cmpl $9 ,ind
	je c2
	cmpl $10 ,ind
	je c1
	cmpl $11 ,ind
	je c0

c7:
	
	
	movl nr, %eax
	movl doisapte, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c6:
	
	
	movl nr, %eax
	movl doisase, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c5:
	
	
	movl nr, %eax
	movl doicinci, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c4:

	movl nr, %eax
	movl doipatru, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c3:
	
	
	movl nr, %eax
	movl doitrei, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c2:
	
	
	movl nr, %eax
	movl doidoi, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c1:
	
	
	movl nr, %eax
	movl doiunu, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2
c0:
	
	
	movl nr, %eax
	movl doizero, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for2


continuam2:
	
		cmpl $2560, suma1
		je variabila
		cmpl $2048, suma1
		je nrpoz
		cmpl $3072, suma1
		je operatie
		cmpl $2304, suma1
		je nrneg

variabila:
	
	pushl suma2				
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

nrpoz:
	pushl suma2				
	pushl $formatPrintflong
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

operatie:
	
	cmpl $0, suma2
	je letiii
	cmpl $1, suma2
	je addiii
	cmpl $2, suma2
	je subiii
	cmpl $3, suma2
	je muliii
	cmpl $4, suma2
	je diviii

letiii:	
	pushl $leti				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok
addiii:	
	pushl $ad				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

subiii:	
	pushl $subi				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok
muliii:	
	pushl $muli				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

diviii:	
	pushl $divi				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok


nrneg:
	pushl minus				
	pushl $formatPrintfmi
	call printf
	popl %ebx
	popl %ebx
	


	pushl suma2			
	pushl $formatPrintflong
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok






et_fortok:
	
	xor %edi, %edi
	xor %eax, %eax
	xor %ebx, %ebx
	movl $0, ind
	movl $0, suma1
	movl $0, suma2

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	cmp $0, %eax
	je exit
	
	movl %eax, res
	
	mov res, %edi	
	xor %ecx, %ecx
	xor %edx, %edx
	#xor %eax, %eax
	movl %ecx, ind
	push $0
	call fflush
	pop %ebx
et_for34:
	
	movl ind, %ecx		
	cmpl $4, ind
	je continuamq

	movb (%edi,%ecx,1), %al
	
	movl %eax, res
	pushl $res
	call atoi
	popl %ebx
	movl %eax, nr
	
	cmpl $0, ind
	je c111
	cmpl $1 , ind
	je c101
	cmpl $2 , ind
	je c91
	cmpl $3 ,ind
	je c81

c111:	
	
	
	movl nr, %eax
	movl doiunuunu, %ebx
	mul %ebx
	#xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for34

c101:
	
	
	movl nr, %eax
	movl doizece, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for34

c91:
	
	
	movl nr, %eax
	movl doinoua, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for34
c81:
	
	
	movl nr, %eax
	movl doiopt, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma1
	
	incl ind	
	jmp et_for34

continuamq:


	xor %ecx, %ecx
	xor %edx, %edx
	#xor %eax, %eax
	movl $4, %ecx
	movl %ecx, ind
	jmp et_for22

et_for22:
			
	movl ind, %ecx	
	movb (%edi,%ecx,1), %al	
	cmpb $0, %al
	je continuam22

	
	
	movl %eax, res
	pushl $res
	call atoi
	popl %ebx
	movl %eax, nr
	
	cmpl $4, ind
	je c71
	cmpl $5 , ind
	je c61
	cmpl $6 , ind
	je c51
	cmpl $7 ,ind
	je c41
	cmpl $8 ,ind
	je c31
	cmpl $9 ,ind
	je c21
	cmpl $10 ,ind
	je c11doi
	cmpl $11 ,ind
	je c01

c71:
	
	
	movl nr, %eax
	movl doisapte, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c61:
	
	
	movl nr, %eax
	movl doisase, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c51:
	
	
	movl nr, %eax
	movl doicinci, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c41:

	movl nr, %eax
	movl doipatru, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c31:
	
	
	movl nr, %eax
	movl doitrei, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c21:
	
	
	movl nr, %eax
	movl doidoi, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c11doi:
	
	
	movl nr, %eax
	movl doiunu, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22
c01:
	
	
	movl nr, %eax
	movl doizero, %ebx
	mul %ebx
	xor %ebx, %ebx
	addl %eax, suma2
	
	incl ind	
	jmp et_for22


continuam22:
	
		cmpl $2560, suma1
		je variabila1
		cmpl $2048, suma1
		je nrpoz1
		cmpl $3072, suma1
		je operatie1
		cmpl $2304, suma1
		je nrneg1

variabila1:
	
	pushl suma2				
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

nrpoz1:
	pushl suma2				
	pushl $formatPrintflong
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

operatie1:
	
	cmpl $0, suma2
	je letiii1
	cmpl $1, suma2
	je addiii1
	cmpl $2, suma2
	je subiii1
	cmpl $3, suma2
	je muliii1
	cmpl $4, suma2
	je diviii1

letiii1:	
	pushl $leti				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok
addiii1:	
	pushl $ad				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

subiii1:	
	pushl $subi				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok
muliii1:	
	pushl $muli				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok

diviii1:	
	pushl $divi				
	pushl $formatPrintfmizi
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok


nrneg1:
	pushl minus				
	pushl $formatPrintfmi
	call printf
	popl %ebx
	popl %ebx
	


	pushl suma2			
	pushl $formatPrintflong
	call printf
	popl %ebx
	popl %ebx
	jmp et_fortok




exit:
	pushl $spatiuq			
	pushl $form
	call printf
	popl %ebx
	popl %ebx
	
	push $0
	call fflush
	pop %ebx
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	