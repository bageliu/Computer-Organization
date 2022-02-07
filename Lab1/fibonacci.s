.data
argument: .word 7
str1: .string "th number in the Fibonacci sequence is "

.text
main:
	lw       a0, argument
	jal      fibonacci
#print the result
	mv       t0, a0
	mv       t1, a1

	mv       a1, t0
	li       a0, 1
	ecall
	
	la       a1, str1
	li       a0, 4
	ecall

	mv       a1, t1
	li       a0, 1
	ecall 
	
	li       a0, 10
	ecall

fibonacci:
	addi     sp, sp, -24
	sw       ra, 0(sp)
	sw       a0, 8(sp)
	addi     a0, a0, -1
	jal      fib
	lw       a0, 8(sp)#restore n
	sw       a1, 16(sp)#save fib(n - 1)

	addi     a0, a0, -2 #n - 2
	jal      fib

	lw       t0, 16(sp) #restore fib(n - 1)
	add      a1, t0, a1     #return value

	lw       ra, 0(sp)
	lw       a0, 8(sp)
	addi     sp, sp, 24
	jr       ra

fib:     #recursive
	li       t0, 3
	bge      a0, t0, fibonacci #since fib(1) and fib(2) is 1
	li       a1, 1
	jr       ra
	

