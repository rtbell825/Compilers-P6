	.data
	.align 2
	.text
	.globl main
main:		# METHOD ENTRY
__start:	# add __start label for main only
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	subu  $sp, $sp, 12
	addu  $fp, $sp, 20
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
		#IF-THEN
		#EQUALS
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
		#INT
	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L0		#branch if false
		#ASSIGN
	lw    $t0, -16($fp)	# Load local variable a
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -16($fp)	# store local variable a
	j     .L0
.L0:
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
		#IF-ELSE
		#EQUALS
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
		#INT
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	seq   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	beq   $t0, 0, .L2		#branch to else if false
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 2
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
	j     .L1
.L2:
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 3
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
	j     .L1
.L1:
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 4
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
		# FUNCTION EXIT
_main_Exit:
	lw    $ra, 0($fp)
	move  $t0, $fp		# save control link
	lw    $fp, -4($fp)		# restore FP
	move  $sp, $t0		# restore SP
	li    $v0, 10		# load exit code for syscall
	syscall		# only do this for main
