import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    public static void main(String[] args) throws NumberFormatException,
            IOException {
        final String SPACE = " ";

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder sb = new StringBuilder();

        final int cntData = Integer.parseInt(br.readLine());

        int a;
        int b;
        int c;
        String data[] = new String[3];

        String lineString;
        for (int i = 0; i < cntData; i++) {
            lineString = br.readLine();

            data = lineString.split(SPACE);
            a = Integer.parseInt(data[0]);
            b = Integer.parseInt(data[1]);
            c = Integer.parseInt(data[2]);

            if (a * a + b * b == c * c) {
                sb.append("YES\r\n");
            } else if (a * a + c * c == b * b) {
                sb.append("YES\r\n");
            } else if (b * b + c * c == a * a) {
                sb.append("YES\r\n");
            } else {
                sb.append("NO\r\n");
            }
        }

        System.out.print(sb);

    }
}