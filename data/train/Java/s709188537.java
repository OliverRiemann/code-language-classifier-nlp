import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main{

    public static void main(String[] args) {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

        try {
            Integer dataNum = Integer.valueOf(in.readLine());

            for (int i = 0; i < dataNum.intValue(); i++) {

                String[] problemData = in.readLine().split("\\s");

                int max = 0;

                int other1 = 0;

                int other2 = 0;

                for (String data : problemData) {

                    int dataInt = Integer.valueOf(data);

                    other2 = other1;

                    if (dataInt > max) {
                        other1 = max;
                        max = dataInt;
                    } else {
                        other1 = dataInt;
                    }
                }

                if ((max * max) == (other1 * other1 + other2 * other2)) {
                    System.out.println("YES");
                } else {
                    System.out.println("NO");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}