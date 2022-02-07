.data
arr: .word 5, 3, 6, 7, 31, 23, 43, 12, 45, 1
str1: .string "Array:"
str2: .string " "
str3: .string "Sorted:"
str4: .string "\n"
.text
main:
	la   s0, arr
	mv   t3, s0
	addi s1, s1, 10
	#print the array
	la		a1, str1
	li		a0, 4
	ecall
	la		a1, str4
	li		a0, 4
	ecall
	jal  printArray
	#doing bubblesort
	mv 	t0, zero
	jal  ra, bubblesort
	#print the string
	la		a1, str3
	li		a0, 4
	ecall
	la		a1, str4
	li		a0, 4
	ecall
	#print the result
	mv   s0, t3
	jal    printArray
	li		a0, 10
	ecall

bubblesort:
	addi sp, sp, -12
	sw   ra, 8(sp)
	sw   s1, 4(sp)
	sw   s0, 0(sp)
loop_out:
	addi t0, t0, 1
	mv   t1, zero
	sub  t2, s1, t0
	blt  t0, s1, loop_in
	addi sp, sp, 12
	jr   ra
loop_in:
	mv   s0, t3
	bge  t1, t2, loop_out
	slli t4, t1, 2
	add  s0, s0, t4
	lw   a2, 0(s0)
	lw   a3, 4(s0)
	addi t1, t1, 1
	blt  a3, a2, swap
	j    loop_in
swap:
	sw   a2, 4(s0)
	sw   a3, 0(s0)
	j    loop_in

printArray: 
	mv 	t0, zero
loop:
	lw   a1, 0(s0)
	li   a0, 1
	ecall
	la 	a1, str2
	li		a0, 4
	ecall
	addi t0, t0, 1
	addi s0, s0, 4
	blt	t0, s1, loop
	la		a1, str4
	li		a0, 4
	ecall
	jr		ra