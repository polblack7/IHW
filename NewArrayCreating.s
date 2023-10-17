.macro NewArray(%x, %y, %z, %i)
li t4 0		#Индекс первого положительного.
li t5 0		#Индекс последнего отрицательного.
li t3 0
li a1 0 
li a2 4
li a3 40
li a4 0

	
find:
	addi a1 a1 1
	lw t2 (%x)     
	bgtz t2, first_pos # Если t2 > 0 -> ищем первый положительный, иначе проверяем отриательный ли.
	bltz t2, last_neg

iter:
	addi %x %x 4
    bltu %x %y find
    j iter_count1

first_pos:
	bgtz t4 iter #Если положительеый уже найден, то просто увеличиваем итератор.
	mv t4 %x
	addi a4 a4 1 #Счетчик сколько условий выполнено(найти первый положительный и последний отрицательный)
    addi %x %x 4
    bltu %x %y find
    j iter_count1
    

    
last_neg: #Ищем последний отрицательный.
	mv t5 %x
    addi %x %x 4
    bltu %x %y find
    j iter_count1
    
iter_count1: 
	beqz t5 index_clean
	addi a4 a4 1 #Счетчик условия


index_clean:
	la %x array  #Считаем длиину 2 массива.
	sub a1 a1 a4 
	mul a4 a1 a2
	sub a3 a3 a4
	sub %i %i a3
	j array_copy
	    
	    

	
	    
skip:
	addi %x %x 4
	bltu %x %y array_copy
	j end
	

	
	    
array_copy:
	lw t2 (%x)
	beq %x t4 skip # Исключаем первый положительный.
	beq %x t5 skip #Исключаем последний отрицательный.
	sw t2 (%z)
	addi %x %x 4
	addi %z %z 4
    bltu %x %y array_copy
	
end:
	la %x array
	la %z array_B

.end_macro 
	