import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

class Main {

	public static void main(String[] args) {

		// ストリームを作成する
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				System.in));

		// データ数を取得する
		int loop = Integer.parseInt(readLine(reader));
		for (int i = 0; i < loop; i++) {
			String[] sideArray = readLine(reader).split(" ");
			int[] sideNumArray = new int[sideArray.length];
			for (int j = 0; j < sideNumArray.length; j++) {
				sideNumArray[j] = Integer.parseInt(sideArray[j]);
			}

			// 三平方の定理を利用してチェックを行う
			Arrays.sort(sideNumArray);
			int smallTwo = sideNumArray[0] * sideNumArray[0] + sideNumArray[1]
					* sideNumArray[1];
			int largeOne = sideNumArray[2] * sideNumArray[2];

			// 定理を満たす場合はYES、そうでない場合はNOを出力する
			if (smallTwo == largeOne) {
				System.out.println("YES");
			} else {
				System.out.println("NO");
			}

		}

	}

	/**
	 * ストリームから1行読み込んで、文字列として返す。
	 *
	 * @param reader
	 *            入力ストリーム
	 * @return　文字列
	 */
	private static String readLine(BufferedReader reader) {
		String line = null;
		try {
			line = reader.readLine();
		} catch (IOException e) {
			throw new RuntimeException();
		}
		return line;
	}
}