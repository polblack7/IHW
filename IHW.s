.data
array:          .space 40    # Определяем массив на 10 элементов
arrend:
array_B: 	.space 40	
arrendB: 
max_elem: .asciz "Введите кол-во элементов в массиве от 1 до 10:"
space:	.asciz " "
input_text: .asciz "Введите элемент массива: "
out_text: .asciz "Первый массив: [ "
closing:	.asciz "] \n"
out_textB:	.asciz "Второй массив: [ "
.globl max_elem input_text out_text closing out_textB space
.include "IHWArrayFill.s"
.include "NewArrayCreating.s"
.include "output.s"
.text
main:
    la t0 array
    la t1 array_B
    li t3 4
    li t4 40
max_array_size:  #Ищем длинну массива
	la a0 max_elem
	li a7 4
	ecall
	
	li a7, 5
    ecall
    
    mul t3 a0 t3
    sub t3 t4 t3
    la t4 arrend
	sub s10 t4 t3

	la s11 arrendB
    li t2 0
    li a2 0
    li s1 10 
    #Макросы которые находятся в других 3х файлах.
    fillArray(t0, s10)   #Передаем указатель на начало и конец первого массива.
    NewArray(t0, s10, t1, s11) #Передаем указатель на начало и конец первого и второго массива.
    output(t0, t1, s10, s11) #Передаем указатель на начало и конец первого и второго массива.
