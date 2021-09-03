.text
main:
addi $s0, $0, 1
addi $s1, $0, 0
Loop: slti $t0, $s1, 10
beq $t0, $0, Exit
addi $v0, $0, 1
add $a0, $0, $s1
syscall
add $s1, $s1, $s0
j Loop
Exit: nop
