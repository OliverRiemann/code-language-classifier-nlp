import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

class Main {

	public static void main(String[] args) {

		// ストリームを作成する
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				System.in));

		// 入力値を受け取り、リストに追加する
		List<Integer> heightList = new ArrayList<Integer>();
		for (int i = 0; i < 10; i++) {
			heightList.add(getHeight(reader));
		}

		// 昇順にソートする
		Collections.sort(heightList);

		// 下位3件を出力する
		for (int i = 0; i < 3; i++) {
			System.out.println(heightList.get(9 - i));
		}

	}

	/**
	 * ストリームから1行読み込んで、高さを数値として返す。
	 *
	 * @param reader
	 *            入力ストリーム
	 * @return 高さ
	 */
	private static Integer getHeight(BufferedReader reader) {
		Integer height = null;
		try {
			String line = reader.readLine();
			height = new Integer(line);
		} catch (IOException e) {
			throw new RuntimeException();
		}
		return height;
	}
}