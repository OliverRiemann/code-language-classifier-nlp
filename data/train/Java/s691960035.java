import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Main {

	public static void main(String[] args) throws Exception {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// データセット数を取得
		String lineCountStr = br.readLine();

		// 各データセットを処理
		for (int lineCount = 0; lineCount < Integer.parseInt(lineCountStr); lineCount ++) {

			String[] dataSetStr = br.readLine().split(" ");
			int[] dataSet = new int[dataSetStr.length];
			for (int i = 0; i < dataSetStr.length; i ++) {
				dataSet[i] = Integer.parseInt(dataSetStr[i]);
			}

			// 一番大きい値が右端になるようにソート
			if (dataSet[0] > dataSet[1]) {
				int tmp = dataSet[0];
				dataSet[0] = dataSet[1];
				dataSet[1] = tmp;
			}
			if (dataSet[1] > dataSet[2]) {
				int tmp = dataSet[1];
				dataSet[1] = dataSet[2];
				dataSet[2] = tmp;
			}

			// 直角三角形であれば "YES", それ以外であれば "NO" を出力
			if (Math.pow(dataSet[0], 2) + Math.pow(dataSet[1], 2) == Math.pow(dataSet[2], 2)) {
				System.out.println("YES");
			} else {
				System.out.println("NO");
			}
		}
	}
}

