.data
    vetor_a : .word
    vetor_b : .word
    vetor_c : .word
    msg_ini : .asciiz "\nEntre com o tamanho dos vetores (máx.= 8): "
    msg_er : .asciiz "\nValor inválido"
    msg_a : .asciiz "Vetor_A["
    msg_b : .asciiz "Vetor_B["
    msg_c : .asciiz "\nVetor_C["
    msg_aux : .asciiz "]: "
    msg_aux2: .asciiz "\n"
.text
    la $s5, vetor_a #Inicializando vetor_a na memória
    la $s6, vetor_b #Inicializando vetor_b na memória
    la $s7, vetor_c #Inicializando vetor_c na memória
    addi $s0, $0, 0 #Inicializando variáveis de incremento
    addi $s1, $0, 1
Loop1: 
    addi $v0, $0, 4 #Mostrar mensagem através do syscall
    la $a0, msg_ini 
    syscall
    addi $v0, $0, 5 #Recebe info do usuário e armazena no $s2
    syscall
    add $s2, $0, $v0
    slti $t0, $s2, 9 #Verifica se o número é válido
    slti $t1, $s2, 2
    not $t1, $t1
    and $t2, $t0, $t1 #Teste
    beq $t2, $s1, Loop2 #Caso seja valido, vai para Loop2
    addi $v0, $0, 4 #Mostra msg de erro
    la $a0, msg_er 
    syscall
    j Loop1 #Retorna para msg inicial
Loop2:
    addi $v0, $0, 4 #Mostra msg na tela
    la $a0, msg_a
    syscall
    addi $v0, $0, 1 #Mostra variável de controle
    add $a0, $0, $s0
    syscall
    addi $v0, $0, 4 #Mensagem
    la $a0, msg_aux
    syscall
    addi $v0, $0, 5 #Recebe o número do usuário
    syscall
    add $s3, $0, $v0 #Armazena em $s3
    add $t0, $s0, $s0 #Calculo do endereço
    add $t0, $t0, $t0
    add $t0, $t0, $s5
    sw $s3, 96($t0) #Armazena na memória
    add $s0, $s0, $s1 #Incrementa variável de controle
    bne $s0, $s2, Loop2 #Verifica condição
    addi $s0, $0, 0
    addi $v0, $0, 4 #Espaço "\n"
    la $a0, msg_aux2
    syscall 
Loop3:
    addi $v0, $0, 4 #Mostra msg na tela
    la $a0, msg_b
    syscall
    addi $v0, $0, 1 #Mostra variável de controle
    add $a0, $0, $s0
    syscall
    addi $v0, $0, 4 #Mensagem
    la $a0, msg_aux
    syscall
    addi $v0, $0, 5 #Recebe o número do usuário
    syscall
    add $s3, $0, $v0
    add $t0, $s0, $s0 #Armazena em $s3
    add $t0, $t0, $t0
    add $t0, $t0, $s6
    sw $s3, 128($t0) #Armazena na memória
    add $s0, $s0, $s1 #Incrementa variável de controle
    bne $s0, $s2, Loop3 #Verifica condição
    addi $s0, $0, 0 #Zerando registrador
Soma:
    add $t0, $s0, $s0 #Carrega elemento do
    add $t0, $t0, $t0 #vetor_a da memória
    add $t0, $t0, $s5
    lw $t1, 96($t0)
    add $t0, $s0, $s0 #Carrega elemento do
    add $t0, $t0, $t0 #vetor_b da memória
    add $t0, $t0, $s5
    lw $t2, 128($t0)
    add $t3, $t1, $t2 #Faz a adição e 
    #armazena no $t3
    add $t0, $s0, $s0 #Salvando soma no
    add $t0, $t0, $t0 #vetor_c da memória
    add $t0, $t0, $s7
    sw $t3, 160($t0)
    add $s0, $s0, $s1 #Incrementa variável de contr.
    bne $s0, $s2, Soma #Verifica condição
    addi $s0, $0, 0 #Zerando registrador
Final: addi $v0, $0, 4 #Mensagem
    la $a0, msg_c
    syscall
    addi $v0 $0, 1 #Numero de controle
    add $a0, $0, $s0
    syscall
    addi $v0, $0, 4 #Mensagem
    la $a0, msg_aux
    syscall
    add $t0, $s0, $s0 #Carrega da memória
    add $t0, $t0, $t0 #elemento do vetor_c
    add $t0, $t0, $s7
    lw $t3, 160($t0)
    addi $v0, $0, 1 #Mostra número do vetor_c
    add $a0, $0, $t3
    syscall
    add $s0, $s0, $s1 #Incrementa variável de contr.
    bne $s0, $s2, Final #Verifica condição