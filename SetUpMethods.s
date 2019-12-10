	.data
	.align 2
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
	addu  $fp, $sp, 8
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
