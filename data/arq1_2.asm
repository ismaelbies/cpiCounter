
.data
vetor_a : .word
msg_l : .asciiz "LEITURA DOS ELEMENTOS DO VETOR: "
msg_r : .asciiz "\nAPRESENTAÇÃO DO VETOR LIDO: "
msg_a : .asciiz "\nEntre com A["
msg_b : .asciiz "\nA["
msg_c : .asciiz "]: "
.text
main:
addi $s0, $0, 0
addi $s1, $0, 1
addi $s3, $0, 10
la $s6, vetor_a
addi $v0, $0, 4
la $a0, msg_l
syscall
Loop1: addi $v0, $0, 4
la $a0, msg_a
syscall
addi $v0, $0, 1
add $a0, $0, $s0
syscall
addi $v0, $0, 4
la $a0, msg_c
syscall
addi $v0, $zero, 5
syscall
add $s2, $0, $v0
add $t1, $s0, $s0
add $t1, $t1, $t1
add $t1, $t1, $s6
sw $s2, 96($t1)
add $s0, $s0, $s1
slti $t0, $s0, 10
bne $t0, $zero, Loop1
addi $v0, $0, 4
la $a0, msg_r
syscall
Loop2: addi $v0, $0, 4
la $a0 msg_b
syscall
addi $v0, $0, 1
add $a0, $0, $s4
syscall
addi $v0, $0, 4
la $a0, msg_c
syscall
add $t2, $s4, $s4
add $t2, $t2, $t2
add $t2, $t2, $s6
lw $s5, 96($t2)
addi $v0, $0, 1
add $a0, $0, $s5
syscall
add $s4, $s4, $s1
slti $t0, $s4, 10
bne $t0, $0, Loop2