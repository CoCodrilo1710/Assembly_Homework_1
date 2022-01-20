.data
	sir: .space 4000
	formatScanf: .asciz "%300[^\n]"
	formatPrintf: .asciz "%d "
	chDelim: .asciz " "
	form: .asciz "%s\n"
	res: .space 4
	resi: .space 4
	nr: .long 0
	x: .long 0
	y: .long 0
	dif: .long 0
	suma: .long 0
	prod: .long 0
	cat: .long 0
	rezultat: .long 0
	
	ind: .long 0
	trei: .long 3

.text

.global main

main:
	
	
	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	xor %eax, %eax

	pushl $chDelim
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx
	
	movl  %eax, res	
	
	pushl res
	call atoi
	popl %ebx
	xor %ebx, %ebx
	movl %eax, resi
	
	

	pushl resi
	
	
	jmp et_for

et_for:		
	
	
	movl $0 , resi
	xor %eax, %eax		
	movl $0, nr
	movl $0, x
	movl $0, y
	movl $0, suma

	xor %edi, %edi
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx 
	
	cmp $0, %eax
	je exit
	
	xor %edi, %edi
	xor %ecx, %ecx
	
	movl $0, ind
	movl %eax , res
	movl res, %edi	 # pentru operatie
	
	movl %ecx, ind      #  am salvat indicele	
	
	pushl res
	call atoi
	popl %ebx
	xor %ebx, %ebx
	movl %eax, resi
	
	movl ind, %ecx   # am restaurat indicele
	

	# pushl resi
	
	cmpl $0, resi
	je oper
	jne enr



oper:	
	movl $0, %ecx
		
	movb (%edi,%ecx,1), %al

	cmp $97 , %al
	je ad
	cmp $115 , %al
	je su
	cmp $109, %al
	je mu
	cmp $100 , %al
	je di
	


enr:

	pushl resi
	jmp et_for


ad:
	
	popl x
	popl y
	movl x, %ebx
	addl y, %ebx
	movl %ebx, suma
	
	pushl suma
	jmp et_for
	

su:
	
	popl x
	popl y
	movl y, %eax
	sub x, %eax
	movl %eax, dif
	
	pushl dif
	jmp et_for

mu:
	
	popl x
	popl y
	mov x, %eax
	mov y, %ebx
	mul %ebx
	movl %eax, prod

	pushl prod
	jmp et_for

di:
	
	popl x
	popl y
	mov y, %eax
	
	xor %edx, %edx
	divl x
	movl %eax, cat

	pushl cat
	jmp et_for

exit:
	popl rezultat
	pushl rezultat
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx

	
	pushl $chDelim
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
