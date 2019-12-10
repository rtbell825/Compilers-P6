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
	subu  $sp, $sp, 8
	addu  $fp, $sp, 16
		#ASSIGN
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#INT
	li    $t0, 5
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -8($fp)	# store local variable x
		#ASSIGN
	lw    $t0, -12($fp)	# Load local variable y
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
	sw    $t0, -12($fp)	# store local variable y
		#WHILE
.L0:
		#GREATER
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
		#INT
	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	slt   $t0, $t0, $t1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $t1, 0
	beq   $t0, $t1, .L1		#branch if false
		#POSTINC
	lw    $t0, -12($fp)	# Load local variable y
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addu  $t0, $t0, 1
	sw    $t0, -12($fp)	# store local variable y
		#POSTDEC
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	subu  $t0, $t0, 1
	sw    $t0, -8($fp)	# store local variable x
		#WRITE
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1
	syscall
	j     .L0
.L1:
		#WRITE
	lw    $t0, -12($fp)	# Load local variable y
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $a0, 4($sp)	#POP
	addu  $sp, $sp, 4
	li    $v0, 1
	syscall
		#RETURN
	b     _main_Exit
		# FUNCTION EXIT
_main_Exit:
	lw    $ra, 0($fp)
	move  $t0, $fp		# save control link
	lw    $fp, -4($fp)		# restore FP
	move  $sp, $t0		# restore SP
	li    $v0, 10		# load exit code for syscall
	syscall		# only do this for main
