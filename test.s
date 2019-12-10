	.data
	.align 2
_globalInt: .space 4
_globalBool: .space 4
	.text
func:		# METHOD ENTRY
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8
		#RETURN
	lw    $t0, 4($fp)	# Load local variable a
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $v0, 4($sp)	#POP
	addu  $sp, $sp, 4
	b     _func_Exit
		# FUNCTION EXIT
_func_Exit:
	lw    $ra, 0($fp)
	move  $t0, $fp		# save control link
	lw    $fp, -4($fp)		# restore FP
	move  $sp, $t0		# restore SP
	jr    $ra		#return
	.globl main
main:		# METHOD ENTRY
__start:	# add __start label for main only
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	subu  $sp, $sp, 20
	addu  $fp, $sp, 28
		#ASSIGN
	lw    $t0, _globalInt		# Load global variable globalInt
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
	sw    $t0, _globalInt		# store global variable globalInt
		#READ
	li    $v0, 5
	syscall
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, _globalInt		# Load global variable globalInt
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, _globalInt		# store global variable globalInt
		#ASSIGN
	lw    $t0, -12($fp)	# Load local variable y
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		#CALL
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, -16($fp)	# Load local variable b
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	jal   func
	sw    $v0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -12($fp)	# store local variable y
		#IF-THEN
		#EQUALS
	lw    $t0, -12($fp)	# Load local variable y
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
	j     .L0
.L0:
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
		#POSTINC
	lw    $t0, _globalInt		# Load global variable globalInt
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addu  $t0, $t0, 1
	sw    $t0, _globalInt		# store global variable globalInt
		#POSTINC
	lw    $t0, -8($fp)	# Load local variable x
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
	addu  $t0, $t0, 1
	sw    $t0, -8($fp)	# store local variable x
		#ASSIGN
	lw    $t0, -16($fp)	# Load local variable b
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		TRUE
	li    $t0, 1
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -16($fp)	# store local variable b
		#ASSIGN
	lw    $t0, -16($fp)	# Load local variable b
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t0, 4($sp)	#POP
	addu  $sp, $sp, 4
		FALSE
	li    $t0, 0
	sw    $t0, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	lw    $t1, 4($sp)	#POP
	addu  $sp, $sp, 4
	move  $t0, $t1
	sw    $t0, -16($fp)	# store local variable b
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
