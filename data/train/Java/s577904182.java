import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws IOException {
        final String SPACE = " ";
        final String EMPTY = "";
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        try {
            String str = br.readLine();
            int a;
            int b;
            String[] temp = new String[2];
            for (int i = 0; i < 200; i++) {
                // 最終行であれば抜ける
                if (EMPTY.equals(str) || str == null) {
                    break;
                }

                temp = str.split(SPACE);
                a = Integer.parseInt(temp[0]);
                b = Integer.parseInt(temp[1]);
                sb.append(String.valueOf(a + b).length() + "\r\n");

                str = br.readLine();
            }
        } catch (IOException e) {
            // NOP
        } finally {
            if (br != null) {
                br.close();
            }
        }

        System.out.print(sb);
    }
}