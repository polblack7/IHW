.macro fillArray(%x, %y)

input_loop: #Заполняем массив
	la a0, input_text
    li a7, 4
    ecall
    
    li a7, 5
    ecall
    mv t2, a0
loop:   
	sw t2 (%x)
    addi %x %x 4
    
    bltu %x %y input_loop
    j array_cleaner
    


array_cleaner:
	la %x array
	li t2 0
.end_macro 