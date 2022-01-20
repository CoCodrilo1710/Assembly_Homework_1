.data

	formatPrintf: .asciz "%d "
	formatPrintfspa: .asciz "%s\n"
	formatScanf: .asciz "%300[^\n]"
	spatiu: .asciz " "	
	sir: .space 400	
	chDelim: .asciz " "
	bb: .long 0
	res: .space 10
	v: .space 400  # 4* 100 de elemente
	ind: .long 0
	art: .long 0	
	lung: .long 0
	flagul: .long 0
	ordinul: .long 0
	ord: .long 0
	verif: .long 0
	
	resi: .space 10
	
	nr: .long 0
	x: .long 0
	y: .long 0
	z: .long 0
	t: .long 0
	dif: .long 0
	suma: .long 0
	prod: .long 0
	cat: .long 0
	rezultat: .long 0
	aux1: .long 0

.text



.global main



main:	
	
	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx


	xor %ecx, %ecx
	movl $v , %esi              # esi-ul e pentru vector ul alfabet
	jmp et_forvec

et_forvec:
	
	cmp $26, %ecx
	je faza2

	movl $0, %ebx
	movl %ebx, (%esi, %ecx, 4)
	
	incl %ecx
	jmp et_forvec



faza2:

	

	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	
	xor %eax, %eax     # xor  eax

	pushl $chDelim
	pushl $sir
	call strtok 
	popl %ebx
	popl %ebx
	
	movl  %eax, res	
	
	pushl res
	call atoi
	popl %ebx
	
	xor %edi, %edi     # asta e pentru fiecare cuvant
	
	xor %ebx, %ebx
	movl %eax, resi

	cmpl $0, resi
	je varsauoper
	jne numar


varsauoper:
	
	
	
	xor %eax, %eax
	
	push res
	call strlen
	popl %ebx

	movl %eax, lung      # lungimea sirului
	
	cmpl $1, lung
	je vari
	jne oper

vari:
	movl $0, ord	   #resetare
	movl $0, verif
	xor %ecx, %ecx
	xor %eax, %eax
	xor %ebx, %ebx
	

	movl res, %edi


	xor %ecx, %ecx
	
	movb (%edi,%ecx,1), %al
	subl $97, %eax
	movl %eax, ord
	movl ord, %ecx
	movl (%esi, %ecx, 4), %ebx
	movl %ebx, verif
	cmpl $0, verif
	je nuapare
	jne apare
	

nuapare:

	pushl ord
	pushl $1   # identificator variabila
	jmp et_strtok

apare:

	pushl verif
	pushl $0  # identificator numar
	jmp et_strtok




oper:

	xor %ecx, %ecx
	xor %eax, %eax
	
	movl res, %edi
	movb (%edi,%ecx,1), %al

	cmp $97 , %al
	je ad
	cmp $115 , %al
	je su
	cmp $109, %al
	je mu
	cmp $100 , %al
	je di
	cmp $108 , %al
	je leti


ad:
	xor %ebx, %ebx
	
	popl x  # flag
	popl y	# valoare
	popl z	# flag
	popl t	# valoare
	movl t, %ebx
	addl y, %ebx
		
	movl %ebx, suma
	
	pushl suma
	pushl $0
	
	jmp et_strtok

su:
	popl x   # flag
	popl y
	popl z   # flag
	popl t                # vreau sa faca y-x
	movl y, %eax
	sub t, %eax
	
	movl %eax, dif
	
	pushl dif
	pushl $0

	
	jmp et_strtok

leti:

	popl x   # flag
	popl y
	popl z   # flag
	popl t  

	cmpl $0,x
	je verifz
	cmpl $1,x
	je verifzi


verifz:
	
	# t este indice, trb sa i aflu codul ascii
	xor %ecx,%ecx
	xor %ebx, %ebx

	movl t, %ecx
	movl y, %ebx
	movl %ebx, (%esi,%ecx,4)
	jmp et_strtok




verifzi:

	cmpl $1, z
	je varvar
	jne invers


varvar:

	# t este index 1      y este index 2

	# adica movl v[y], v[t]

	xor %ebx, %ebx
	xor %ecx,%ecx

	movl y, %ecx
	movl (%esi,%ecx,4), %ebx
	movl %ebx, aux1            
	
	xor %ecx,%ecx
	movl t, %ecx
	xor %ebx, %ebx
	movl aux1, %ebx
	movl %ebx, (%esi,%ecx,4)

	jmp et_strtok 	




invers:

	# y este indice, trb sa i aflu codul ascii
	xor %ecx,%ecx
	movl y, %ecx
	xor %ebx, %ebx
	movl t, %ebx
	movl %ebx, (%esi,%ecx,4)
	jmp et_strtok   
	



mu:
	
	popl x   # flag
	popl y
	popl z   # flag
	popl t  
	mov y, %eax
	mov t, %ebx
	mul %ebx
	movl %eax, prod

	pushl prod
	pushl $0

	jmp et_strtok

di:
	xor %eax, %eax
	
	popl x   # flag
	popl y
	popl z   # flag
	popl t  
	mov y, %eax
	
	xor %edx, %edx
	divl t
	movl %eax, cat

	pushl cat
	pushl $0

	jmp et_strtok


numar:


	pushl resi
	push $0
	jmp et_strtok

	




et_strtok:

	movl $0 , resi
	movl $0 , res
	
	xor %ebx, %ebx
	xor %ecx, %ecx	
	movl $0, nr
	movl $0, x
	movl $0, y
	movl $0, suma
	movl $0, z
	movl $0, t
	movl $0, art
	movl $0, lung
	movl $0, ord
	movl $0, verif
	movl $0, dif
	movl $0, prod
	movl $0, cat
	movl $0, aux1

	


	

	pushl $chDelim
	pushl $0
	call strtok 
	popl %ebx
	popl %ebx

	cmp $0, %eax
	je exit
	
	movl  %eax, res	
	
	pushl res
	call atoi
	popl %ebx
	
	xor %ecx, %ecx
	xor %ebx, %ebx
	
	xor %edi, %edi     # asta e pentru fiecare cuvant
	
	xor %ebx, %ebx
	movl %eax, resi

	cmpl $0, resi
	je varsauoperi
	jne numari


varsauoperi:
	
	
	
	xor %eax, %eax
	
	push res
	call strlen
	popl %ebx
	
	xor %ecx,%ecx
	xor %ebx, %ebx
	movl %eax, lung      # lungimea sirului
	
	cmpl $1, lung
	je varii
	jne operi

varii:
	movl $0, ord	   #resetare
	movl $0, verif
	xor %ecx, %ecx
	xor %eax, %eax
	xor %ebx, %ebx
	
	movl res, %edi
	xor %ecx, %ecx
	
	movb (%edi,%ecx,1), %al
	subl $97, %eax
	movl %eax, ord
	movl ord, %ecx
	movl (%esi, %ecx, 4), %ebx
	movl %ebx, verif
	cmpl $0, verif
	je nuaparei
	jne aparei
	

nuaparei:

	pushl ord
	pushl $1   # identificator variabila
	jmp et_strtok

aparei:

	pushl verif
	pushl $0  # identificator numar
	jmp et_strtok




operi:

	xor %ecx, %ecx
	xor %eax, %eax
	
	movl res, %edi
	movb (%edi,%ecx,1), %al

	cmp $97 , %al
	je adi
	cmp $115 , %al
	je sui
	cmp $109, %al
	je mui
	cmp $100 , %al
	je dii
	cmp $108 , %al
	je letii


adi:
	xor %ebx, %ebx
	
	popl x  # flag
	popl y	# valoare
	popl z	# flag
	popl t	# valoare
	movl t, %ebx
	addl y, %ebx
		
	movl %ebx, suma
	
	pushl suma
	pushl $0
	
	jmp et_strtok

sui:
	popl x   # flag
	popl y
	popl z   # flag
	popl t                # vreau sa faca y-x
	

	movl t, %eax
	sub y, %eax
	
	movl %eax, dif
	
	pushl dif
	pushl $0

	
	jmp et_strtok

letii:

	popl x   # flag
	popl y
	popl z   # flag
	popl t  

	cmpl $0,x
	je verifzizu
	cmpl $1,x
	je verifzii


verifzizu:
	
	# t este indice, trb sa i aflu codul ascii
	xor %ecx,%ecx
	xor %ebx, %ebx

	movl t, %ecx
	movl y, %ebx
	movl %ebx, (%esi,%ecx,4)
	jmp et_strtok




verifzii:

	cmpl $1, z
	je varvari
	jne inversi


varvari:

	# t este index 1      y este index 2

	# adica movl v[y], v[t]

	xor %ebx, %ebx
	xor %ecx,%ecx

	movl y, %ecx
	movl (%esi,%ecx,4), %ebx
	movl %ebx, aux1            
	
	xor %ecx,%ecx
	movl t, %ecx
	xor %ebx, %ebx
	movl aux1, %ebx
	movl %ebx, (%esi,%ecx,4)

	jmp et_strtok 	




inversi:

	# y este indice, trb sa i aflu codul ascii
	xor %ecx,%ecx
	movl y, %ecx
	xor %ebx, %ebx
	movl t, %ebx
	movl %ebx, (%esi,%ecx,4)
	jmp et_strtok   
	



mui:
	
	popl x   # flag
	popl y
	popl z   # flag
	popl t  
	mov y, %eax
	mov t, %ebx
	mul %ebx
	movl %eax, prod

	pushl prod
	pushl $0

	jmp et_strtok

dii:
	xor %eax, %eax
	
	popl x   # flag
	popl y
	popl z   # flag
	popl t  
	
	mov t, %eax
	
	xor %edx, %edx
	divl y
	movl %eax, cat

	pushl cat
	pushl $0

	jmp et_strtok

numari:


	pushl resi
	push $0
	jmp et_strtok




exit:
		
	popl flagul
	popl ordinul

	
	pushl ordinul
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx


	pushl $spatiu
	pushl $formatPrintfspa
	call printf
	popl %ebx
	popl %ebx	

	push $0
	call fflush
	pop %ebx


	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80