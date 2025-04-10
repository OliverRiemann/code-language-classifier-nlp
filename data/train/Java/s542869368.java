import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class Main {
	private final static String NEGATIVE = "NO\n";
	private final static String AFFIRMATIVE = "YES\n";

	public static void main(String[] args) throws NumberFormatException, IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in), 512);
		int number = Integer.parseInt(br.readLine());//行数
		int sides[] = new int[3];
		StringTokenizer tknz;
		StringBuilder builder = new StringBuilder();

		for (; 0 < number; number--) {
			tknz = new StringTokenizer(br.readLine());
			for (int i = 0; i < 3; i++) {
				sides[i] = Integer.parseInt(tknz.nextToken());
			}
			Arrays.sort(sides);
			if (sides[0] * sides[1] * sides[2] % 60 != 0) {
				builder.append(NEGATIVE);
			} else if (Math.pow(sides[0], 2) + Math.pow(sides[1], 2) != Math.pow(sides[2], 2)) {
				builder.append(NEGATIVE);
			} else {
				builder.append(AFFIRMATIVE);
			}
		}
		System.out.print(builder);
	}
}