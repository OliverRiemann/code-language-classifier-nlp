import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line = "";

        while ((line = br.readLine()) != null && !line.isEmpty()) {

            int N = Integer.parseInt(line);

            next:
            for (int i = 0; i < N; i++) {
                int[] num = new int[3];
                StringTokenizer st = new StringTokenizer(br.readLine());
                num[0] = Integer.parseInt(st.nextToken());
                num[1] = Integer.parseInt(st.nextToken());
                num[2] = Integer.parseInt(st.nextToken());
                num[0] *= num[0];
                num[1] *= num[1];
                num[2] *= num[2];

                for (int j = 0; j < 3; j++) {
                    if (num[j % 3] == num[(j + 1) % 3] + num[(j + 2) % 3]) {
                        System.out.println("YES");
                        continue next;
                    }
                }
                System.out.println("NO");
            }
        }
    }
}