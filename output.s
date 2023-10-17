.macro output(%x, %y, %z, %i)

la a0 out_text
li a7 4
ecall

out_array: #Вывод первого массива.
	lw t2 (%x)
	mv a0 t2
	li a7 1
	ecall
	
	la a0 space #Пробел между элементами. 
	li a7 4
	ecall

    addi %x %x 4
    bltu %x %z out_array
    
la a0 closing #Это символ "]" для того чтобы массив выглядил красиво.
li a7 4
ecall

la a0 out_textB
li a7 4
ecall

out_arrayB:	#Вывод массива В.
	lw t2 (%y)
	mv a0 t2
	li a7 1
	ecall
	
	la a0 space
	li a7 4
	ecall
	
    addi %y %y 4
    bltu %y %i out_arrayB

la a0 closing
li a7 4
ecall

.end_macro 