import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class Main {

    static final Map<String, Integer> instrucoesLookup = new HashMap<String, Integer>() {{
        // (instrucao, latencia em ciclos)
        put("100000", null); //	add
        put("100001", null); //	addu
        put("001000", null); //	addi
        put("001001", null); //	addiu	
        put("100100", null); //	and	
        put("001100", null); //	andi
        put("011010", null); //	div	
        put("011011", null); //	divu
        put("011000", null); //	mult
        put("011001", null); //	multu
        put("100111", null); //	nor
        put("100101", null); //	or
        put("001101", null); //	ori
        put("000000", 4); //	sll
        put("000100", null); //	sllv
        put("000011", null); //	sra
        put("000111", null); //	srav
        put("000010", null); //	srl
        put("000110", null); //	srlv
        put("100010", null); //	sub
        put("100011", null); //	subu
        put("100110", null); //	xor
        put("001110", null); //	xori
        put("011001", null); //	lhi	
        put("011000", null); //	llo	
        put("101010", null); // slt
        put("101001", null); // sltu
        put("001010", null); // slti
        put("001001", null); // sltiu
        put("000100", 3); // beq
        put("000111", null); // bgtz
        put("000110", null); // blez
        put("000101", 3); // bne
        put("000010", 3); // j
        put("000011", 3); // jal
        put("001001", null); // jalr
        put("001000", null); // jr
        put("100000", null); // lb
        put("100100", null); // lbu
        put("100001", null); // lh
        put("100101", null); // lhu
        put("100011", 5); // lw
        put("001111", null); // lb
        put("101000", null); // sb
        put("101001", null); // sh
        put("101011", 4); // sw
        put("010000", null); // mfhi
        put("010010", null); // mflo
        put("010001", null); // mthi
        put("010011", null); // mtlo
        put("011010", null); // trap
    }};

    final static int MAX_CICLOS = 5;

    public static void main(String[] args) throws IOException {
        if (args.length != 1) {
            System.err.printf(
                "Você deve informar o caminho absoluto do arquivo a ser 'parseado'.\n" +
                "Modo de uso: java -jar Main.java <caminho_do_arquivo>\n"
            );
            System.exit(-1);
        }

        File file = new File(args[0]);

        int totalDeCiclos = 0;
        Integer ciclosDaInstrucao = null;
        int[] ciclosDoProgramaPorLatencia = new int[MAX_CICLOS];

        String instrucaoEmBits, linha;

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            //java 8 - try-with-resources - avoid leaks

            int i = 0;
            while ((linha = br.readLine()) != null) {
                System.out.printf("Parseando linha %d: %s\n", i, linha);
                instrucaoEmBits = linha.substring(0, 6);

                ciclosDaInstrucao = instrucoesLookup.get(instrucaoEmBits);
                if (ciclosDaInstrucao == null) {
                    System.err.printf("Instrução não mapeada, instrução em bits: '%s'\n", instrucaoEmBits);
                    System.exit(-1);
                }

                // vai até 5, o array é baseado em 0, subtrai 1
                ciclosDoProgramaPorLatencia[ciclosDaInstrucao - 1] += 1;
            }

        } catch (Exception e) {
            System.err.printf("Erro ao parsear o arquivo! Mesagem: %s", e.getMessage());
            System.exit(-1);
        }

        for (int i = 0; i < MAX_CICLOS; i++) {
            System.out.printf("Total de instruções com %d ciclo(s): %d\n", i+1, ciclosDoProgramaPorLatencia[i]);
            totalDeCiclos = (i+1)*ciclosDoProgramaPorLatencia[i];
        }
        System.out.printf("Total de Ciclos: %d\n",totalDeCiclos);
    }
}
