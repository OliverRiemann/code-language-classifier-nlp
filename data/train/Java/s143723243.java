import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {

	/**
	 * 引数で与えられた10の山の高さのうち、高い順に3つ出力する。
	 *
	 * @param args
	 *            利用しない
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {

		// 入力値を受け取る
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		List<Integer> heightsOfMountain = new ArrayList<Integer>();
		String line = null;
		while ((line = br.readLine()) != null) {
			heightsOfMountain.add(Integer.valueOf(line));
		}

		// ソート→逆順に並べ替え
		 Collections.sort(heightsOfMountain);
		 Collections.reverse(heightsOfMountain);

		 // 答えを出力する
		 System.out.println(heightsOfMountain.get(0));
		 System.out.println(heightsOfMountain.get(1));
		 System.out.println(heightsOfMountain.get(2));
	}
}