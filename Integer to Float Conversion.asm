.data
	# HEADER
	intro1: .asciiz "=======================================================================\n"
	intro2: .asciiz "Program Description:\tInteger to Float Conversion\n"
	intro3: .asciiz "Author:\t\t\tAmer Yono\n"
	intro4: .asciiz "Creation Date:\t\t10/14/2021\n"
	newline: .asciiz "\n"
	
	# LAB
	str1: .asciiz "Please input a temperature in Celsius: "
	str2: .asciiz "The temperature in Fahrenheit is: "
	multi: .float 1.8 # Formula to convert celsius to fahrenheit

.text
	# HEADER
	li $v0, 4
	la $a0, intro1
	syscall
	
	li $v0, 4
	la $a0, intro2
	syscall
	
	li $v0, 4
	la $a0, intro3
	syscall
	
	li $v0, 4
	la $a0, intro4
	syscall
	
	li $v0, 4
	la $a0, intro1
	syscall
	
	# LAB
	li $v0, 4
	la $a0, str1 # Ask user for number in celsius
	syscall

	li $v0, 6 # Get float from user
	syscall # Store float value in $f0

	jal convert # Jump and link to the convert function that converts and prints

	# End program
	li $v0, 4
	la $a0, newline
	syscall

	li $v0, 4
	la $a0, intro1
	syscall

	li $v0, 10 
	syscall

convert:
	addi $t0, $t0, 32 # Add 32 to $t0
	mtc1 $t0, $f1 # Convert integer 32 to a float
	cvt.s.w $f1, $f1 # Convert integer 32 to a float
	l.s $f2, multi # Load address num (1.8) into $f2
	mul.s $f3, $f0, $f2 # Multiply user input with 32 
	add.s $f4, $f3, $f1 # Add the product of the two numbers to 32

	li $v0, 4
	la $a0, str2 # Print final output string
	syscall

	li $v0, 2
	mov.s $f12, $f4 # Print fahrenheit number float stored in $f4
	syscall

	jr $ra # Jump back to the main
