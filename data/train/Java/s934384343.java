import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Comparator;

import static java.util.Arrays.sort;


public class Main {
    public static void main(String[] args) throws IOException {
        InputStreamReader isr = new InputStreamReader(System.in);
        BufferedReader br   = new BufferedReader(isr);
        PrintWriter out     = new PrintWriter(System.out);
        int i = 0;
        String line;
        String[] numList = new String[2];
        try {
            while ((line = br.readLine()) != null) {
                numList = line.split(" ");
                int num0 = Integer.parseInt(numList[0]);
                int num1 = Integer.parseInt(numList[1]);
                int sum = num0 + num1;
                System.out.println((int)Math.log10(sum) + 1);
            }
        } catch (Exception e) {
            System.exit(0);
        }
    }
}