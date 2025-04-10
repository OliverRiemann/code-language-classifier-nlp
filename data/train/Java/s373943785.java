import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Main {

	private static final int NO_DATA = -1;

	public static void main(String[] args) {

		// ストリームを作成する
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				System.in));

		while (true) {
			// 入力値を受け取り、合計を数値にして返す
			int sum = getSum(reader);
			// 入力がない場合は終了
			if (sum == NO_DATA) {
				return;
			}
			// 桁数を出力する
			System.out.println(String.valueOf(sum).length());
		}
	}

	/**
	 * ストリームから1行読み込んで、2つの数値を合計して返す。 値が取得できなかった場合は-1を返す。
	 *
	 * @param reader
	 *            入力ストリーム
	 * @return 数値の合計
	 */
	private static int getSum(BufferedReader reader) {
		int result = NO_DATA;
		try {
			String line = reader.readLine();
			if (line == null || line.length() == 0) {
				return result;
			}
			String[] numArray = line.split(" ");
			result = Integer.parseInt(numArray[0])
					+ Integer.parseInt(numArray[1]);
		} catch (IOException e) {
			throw new RuntimeException();
		}
		return result;
	}
}