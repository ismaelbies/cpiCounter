import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

public class main {

    public static void main(String[] args) throws IOException {
        File file = new File("");
        BufferedReader br = new BufferedReader(new FileReader(file));
        String st;
        int instrucaoTresCiclos = 0;
        int instrucaoQuatroCiclos = 0;
        int instrucaoCincoCiclos = 0;
        int totalDeCiclos = 0;

        while ((st = br.readLine()) != null) {
            System.out.println(st);
            String aux = st.substring(0, 6);
//            if(aux.equals("000000")) {
//                System.out.println("FUNC: " + st.substring(st.length()-6,st.length()));
//            }


            if(aux.equals("000010") || aux.equals("000011")
                    || aux.equals("000100") || aux.equals("000101")) {
                instrucaoTresCiclos++;
            }

            if(aux.equals("101011") || aux.equals("000000")) {
                instrucaoQuatroCiclos++;
            }

            if(aux.equals("100011")) {
                instrucaoCincoCiclos++;
            }

        }
        totalDeCiclos = (instrucaoTresCiclos * 3) + (instrucaoQuatroCiclos * 4) + (instrucaoCincoCiclos * 5);
        System.out.println("Tres: " + instrucaoTresCiclos);
        System.out.println("Quatro: " + instrucaoQuatroCiclos);
        System.out.println("Cinco: " + instrucaoCincoCiclos);
        System.out.println("Instruções: " + (instrucaoTresCiclos + instrucaoQuatroCiclos + instrucaoCincoCiclos));
        System.out.println("Total de Ciclos: " + totalDeCiclos);
    }
}

