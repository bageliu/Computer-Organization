.data
N1: .word 4
N2: .word 8
str1: .string "GCD value of "
str2: .string " and "
str3: .string " is "


.text
main:
	lw a0, N1
	lw a1, N2
	lw a2, N1
	lw a3, N2
	jal gcd

	mv t0, a0
	mv t1, a1

	la a1, str1
	li a0, 4
	ecall

	mv a1, a2
	li a0, 1
	ecall

	la a1, str2
	li a0, 4
	ecall

	mv a1, a3
	li a0, 1
	ecall

	la a1, str3
	li a0, 4
	ecall
	
	mv a1, t0
	li a0, 1
	ecall

	li a0, 10
	ecall

gcd:
	beq a1, zero, return     # if(a1 == 0)  t0 = 0;
	rem a0, a0, a1      # a0 = a0 % a1;
swap:
	mv t1, a0
	mv a0, a1
	mv a1, t1
	j gcd
return:
	jr ra