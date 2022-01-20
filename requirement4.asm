.data
	
	n: .long 0
	m: .long 0
	indicefinal: .long 0
	elem: .long 0

	copien: .long 0	
	copiem: .long 0

	salvare: .long 0
	minusunu: .long -1
	comparat: .long 0
	nrMuchii: .space 4
	index: .space 4

	aux: .space 4
	matrix: .space 1600
	s: .space 10
	operatie: .space 15
	sir: .space 15
	columnIndex: .space 4
	lineIndex: .space 4
	formatPrintf: .asciz "%d "
	formatScanf: .asciz "%s"
	formatScanfff: .asciz "%d"
	
	formatPrintfnl: .asciz "%s"
	newLine: .asciz "\n"
	
	
.text



.global main




main:

	pushl $s
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx


	pushl $n               # nr linii
	pushl $formatScanfff
	call scanf
	popl %ebx
	popl %ebx

	
	pushl $m 		# nr coloane
	pushl $formatScanfff
	call scanf
	popl %ebx
	popl %ebx
	

	movl $0, index
	jmp et_citire_matr

et_citire_matr:
	
	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx

	movl $0, lineIndex
	jmp for_lines

     for_lines:
		movl lineIndex, %ecx
		cmp %ecx, n
		je citirea_continua
		
		movl $0, columnIndex
		jmp for_columns

	for_columns:

		xor %ecx, %ecx
		xor %eax, %eax
	
		movl columnIndex, %ecx
		cmp %ecx, m
		je cont
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * n + columnIndex
		movl lineIndex, %eax
		movl $0, %edx
		mull m
		addl columnIndex, %eax
			// %eax = lineIndex * n + columnIndex
				
		movl %eax, indicefinal

		

		

		pushl $elem
		pushl $formatScanfff
		call scanf
		popl %ebx
		pop %ebx
		

		lea matrix, %edi


		movl indicefinal, %eax		

		movl elem, %ebx
		movl %ebx, (%edi, %eax, 4)

		
			
		
		incl columnIndex
		jmp for_columns
		
cont:
		
		
		
		incl lineIndex
		jmp for_lines
		
		
	

citirea_continua:

			# let - ul

	movl $0, s
	
	pushl $s
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	
	


	pushl $sir             # aici poate fi numar sau rot90d
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

	
	push $sir
	call atoi
	pop %ebx

	movl %eax, aux     # in aux este 0 sau numarul bun

	cmpl $0, aux
	je rot90d
	jne cont_cit



rot90d:

	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx


  	movl n, %ebx                                 # trebuie facut mai bine copia   pentru  n
	movl %ebx, copien
	xor %ebx, %ebx
	

	movl m, %ebx                                 # trebuie facut mai bine copia    pentru  m
	movl %ebx, copiem
	xor %ebx, %ebx
	

	subl $1, n
	
	


	movl $0, indicefinal
	movl $0 , salvare


	movl $0, lineIndex
	jmp for_lines13

     for_lines13:
		movl lineIndex, %ecx
		cmp %ecx, m
		je faza2
		
		movl $0, columnIndex
		jmp for_columns13

	for_columns13:

		xor %ecx, %ecx
		xor %eax, %eax
	
		movl columnIndex, %ecx
		cmp %ecx, copien
		je cont13
			
			// pushl la elementul matrix[n-1-j][lineIndex]  dar n-1 e de fapt n-ul actual
			// (n-j) * m + lineIndex   dar n-1 e de fapt n-ul actual

		movl n, %eax
		subl columnIndex, %eax
		movl $0, %edx
		mull m

		movl $0, indicefinal		

		addl lineIndex, %eax
			// %eax = (n-1-j) * m + lineIndex
				
		movl %eax, indicefinal
		

		lea matrix, %edi

		movl indicefinal, %eax
		
		xor %ebx, %ebx
	
		movl (%edi,%eax,4), %ebx		

		pushl %ebx
		
		xor %ebx,%ebx	
		
		incl columnIndex
		jmp for_columns13
		
cont13:
		
		incl lineIndex
		jmp for_lines13
		


		


faza2: 


	
	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx


  	# in n am pe n-1
	# in copien am pe n initial

	

	subl $1 ,m	
	
	# in copiem am pe m initial

	movl $0, indicefinal
	movl $0 , salvare

	movl m, %ebx

	# trebuie comparat cu -1 ca sa sara bine cum trebuie

	movl %ebx, lineIndex
	xor %ebx, %ebx
	jmp for_lines14

     for_lines14:
		xor %ecx, %ecx
		movl lineIndex, %ecx
		cmp %ecx, minusunu
		je faza3
		
		xor %ebx, %ebx	
		
		movl n, %ebx
		movl %ebx, columnIndex
		xor %ebx, %ebx

		jmp for_columns14

	for_columns14:

		xor %ecx, %ecx
		xor %eax, %eax
		xor %ebx, %ebx
		
		movl columnIndex, %ecx
		cmp %ecx, minusunu
		je cont14
			
			// popl la elementul matrix[lineIndex][columnIndex]  
			// lineIndex * m + columnIndex 

		movl lineIndex, %eax
		xor %edx,%edx
		mull m

		movl $0, indicefinal		

		addl columnIndex, %eax
			// %eax = lineIndex * m + columnIndex 
				
		movl %eax, indicefinal
		

		lea matrix, %edi

		movl indicefinal, %eax
		
		xor %ebx, %ebx

		popl %ebx
	
		movl %ebx, (%edi,%eax,4)		

		xor %ebx,%ebx	
		
		decl columnIndex
		jmp for_columns14
		
cont14:
		
		decl lineIndex
		jmp for_lines14
		




faza3:



	pushl copiem                     #printez pe m
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx


	pushl copien                # printez pe n
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	

	movl $0, lineIndex
	xor %eax, %eax
	xor %ebx, %ebx
	xor %edi, %edi
	xor %ecx, %ecx
	
	jmp for_lines15
	
   for_lines15:
		movl lineIndex, %ecx
		cmp %ecx, copiem
		je exit
		
		movl $0, columnIndex
		jmp for_columns15
	
	for_columns15:
			movl columnIndex, %ecx
			cmp %ecx, copien
			je cont15
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
			movl lineIndex, %eax
			movl $0, %edx
			mull m
			addl columnIndex, %eax
			// %eax = lineIndex * m + columnIndex
			
			lea matrix, %edi
		
			xor %ebx, %ebx
			
			movl (%edi, %eax, 4), %ebx
			
			pushl %ebx
			pushl $formatPrintf
			call printf
			popl %ebx
			popl %ebx
			
			pushl $0
			call fflush
			popl %ebx
			
			incl columnIndex
			jmp for_columns15
		
	cont15:
		
		
		incl lineIndex
		jmp for_lines15




	


cont_cit:
			# trebuie sa mai citesc operatia care urmeaza

			# in aux am numarul care face operatia ( numitorul)

	pushl $operatie       
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx

				# secventa de resetare
	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx
	

	movl $operatie, %edi

	movb (%edi, %ecx, 1), %al

	cmp $97 , %al
	je ad
  	cmp $115 , %al
	je su
	cmp $109, %al
	je mu
	cmp $100 , %al
	je di


ad:                                      # adunare

	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx
	

	movl $0, lineIndex
	jmp for_lines3

     for_lines3:
		movl lineIndex, %ecx
		cmp %ecx, n
		je et_afis_matr1
		
		movl $0, columnIndex
		jmp for_columns3

	for_columns3:


	
		movl columnIndex, %ecx
		cmp %ecx, m
		je cont3
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
		movl lineIndex, %eax
		movl $0, %edx
		mull m
		addl columnIndex, %eax
			// %eax = lineIndex * n + columnIndex
				
		movl %eax, indicefinal

		
		lea matrix, %edi
		
		xor %ebx, %ebx

		
		movl (%edi, %eax, 4) , %ebx
		
		addl aux, %ebx                    #adunare efectiva
					 
		movl %ebx , (%edi, %eax, 4)
		
		
		


		movl indicefinal, %eax		


		
		incl columnIndex
		jmp for_columns3
		
cont3:
		
		
		
		incl lineIndex
		jmp for_lines3




su:                                      # scadere

	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx
	
	movl $0, indicefinal
	movl $0, lineIndex
	jmp for_lines4

     for_lines4:
		movl lineIndex, %ecx
		cmp %ecx, n
		je et_afis_matr1
		
		movl $0, columnIndex
		jmp for_columns4

	for_columns4:


	
		movl columnIndex, %ecx
		cmp %ecx, m
		je cont4
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
		movl lineIndex, %eax
		movl $0, %edx
		mull m
		addl columnIndex, %eax
			// %eax = lineIndex * n + columnIndex
				
		movl %eax, indicefinal

		
		lea matrix, %edi
		
		xor %ebx, %ebx



		
		movl (%edi, %eax, 4) , %ebx
		
		subl aux, %ebx                    #scaderea efectiva
					 
		movl %ebx , (%edi, %eax, 4)
		


		 movl indicefinal, %eax		


		
		incl columnIndex
		jmp for_columns4
		

cont4:
		
		incl lineIndex
		jmp for_lines4

mu:

	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx
	
	movl $0, indicefinal
	movl $0, lineIndex
	movl $0 , salvare
	jmp for_lines5

     for_lines5:
		movl lineIndex, %ecx
		cmp %ecx, n
		je et_afis_matr1
		
		movl $0, columnIndex
		jmp for_columns5

	for_columns5:

		movl $0 , salvare
	
		movl columnIndex, %ecx
		cmp %ecx, m
		je cont5
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
		movl lineIndex, %eax
		movl $0, %edx
		mull m
		addl columnIndex, %eax
			// %eax = lineIndex * m + columnIndex
				
		movl %eax, indicefinal

		
		lea matrix, %edi
		
		movl %ecx, salvare
		
		movl indicefinal, %ecx
		
		xor %eax, %eax
		
		movl (%edi, %ecx, 4) , %eax
		
		xor %edx, %edx

		imull aux        #produsul efectiv

		xor %ebx, %ebx		
	
		movl %eax, %ebx
				                  
					 
		movl %ebx , (%edi, %ecx, 4)
		
		
		movl salvare, %ecx
		
		incl columnIndex
		jmp for_columns5
		

cont5:
		
		incl lineIndex
		jmp for_lines5
		




di:




	xor %eax, %eax
	xor %ecx, %ecx
	xor %ebx, %ebx
	xor %edi, %edi
	xor %edx, %edx
	
	movl $0, indicefinal
	movl $0, lineIndex
	movl $0 , salvare
	jmp for_lines6

     for_lines6:
		movl lineIndex, %ecx
		cmp %ecx, n
		je et_afis_matr1
		
		movl $0, columnIndex
		jmp for_columns6

	for_columns6:

		movl $0 , salvare
	
		movl columnIndex, %ecx
		cmp %ecx, m
		je cont6
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
		movl lineIndex, %eax
		movl $0, %edx
		mull m
		addl columnIndex, %eax
			// %eax = lineIndex * m + columnIndex
				
		movl %eax, indicefinal

		
		lea matrix, %edi
		
		movl %ecx, salvare
		
		movl indicefinal, %ecx
		
		xor %eax, %eax
		
		movl (%edi, %ecx, 4) , %eax
		
		
		movl %eax, comparat
	
		pushl aux		

		cmpl $0, comparat
		jle minus_minus
		jg normal	
		

minus_minus:

				# a 1 3 -15 -37 255 let -15 div
	xor %eax, %eax
	movl comparat, %eax
	
	xor %edx, %edx		

	imull minusunu
	movl %eax, comparat

	
	xor %eax, %eax
	xor %ebx, %ebx
	

	movl aux, %eax
	xor %edx, %edx
	imull minusunu
	movl %eax, aux


	jmp normal

	



normal:
		
		movl comparat, %eax
		
		xor %edx, %edx

		idiv aux                 #imaprtirea efectiva

		xor %ebx, %ebx		
	
		movl %eax, %ebx
				                  
					 
		movl %ebx , (%edi, %ecx, 4)
		
		
		movl salvare, %ecx

		popl aux
		
		incl columnIndex
		jmp for_columns6
		

cont6:
		
		incl lineIndex
		jmp for_lines6
		







et_afis_matr1:

	pushl n
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl m
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx


	movl $0, lineIndex
	xor %eax, %eax
	xor %ebx,%ebx
	xor %edi, %edi
	xor %ecx, %ecx
	
	jmp for_lines1
	
   for_lines1:
		movl lineIndex, %ecx
		cmp %ecx, n
		je exit
		
		movl $0, columnIndex
		jmp for_columns1
	
	for_columns1:
			movl columnIndex, %ecx
			cmp %ecx, m
			je cont1
			
			// afisez matrix[lineIndex][columnIndex]
			// lineIndex * m + columnIndex
			movl lineIndex, %eax
			movl $0, %edx
			mull m
			addl columnIndex, %eax
			// %eax = lineIndex * n + columnIndex
			
			lea matrix, %edi
		
			xor %ebx, %ebx
			
			movl (%edi, %eax, 4), %ebx
			
			pushl %ebx
			pushl $formatPrintf
			call printf
			popl %ebx
			popl %ebx
			
			pushl $0
			call fflush
			popl %ebx
			
			incl columnIndex
			jmp for_columns1
		
	cont1:
		
		
		incl lineIndex
		jmp for_lines1






exit: 

	pushl $newLine
	pushl $formatPrintfnl
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx

	
	movl $1, %eax
	xor %ebx, %ebx
	int $0x80
	

	