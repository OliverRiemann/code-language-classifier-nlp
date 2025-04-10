import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Main {

    /** 入力される山の数 */
    private static final int NUMBER_OF_INPUT_MOUNTAIN = 10;

    /** 出力する山の数 */
    private static final int NUMBER_OF_OUTPUT_MOUNTAIN = 3;

    /**
     * 入力された山の高さから一番高い山を取得する。
     * 山の高さは 0 <= height <= 10000、データの数は 10 個。
     *
     * @param args
     */
    public static void main(String[] args) throws IOException {
        // 入力値を整数リストとして取得する
        List<Integer> heightList = readHeight();

        // 昇順でソートし、逆順にする
        Collections.sort(heightList);
        Collections.reverse(heightList);

        // 指定件数だけ表示する
        printHeight(heightList);
    }

    /**
     * 既定の回数だけ、標準入力から数字を読み、数値のリストにして返却する。
     *
     * @return 入力された山の高さを表す数値のリスト
     */
    protected static List<Integer> readHeight() throws IOException {

        List<Integer> heightList = new ArrayList<Integer>();
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        // 既定の回数だけ山の高さを読み込む
        for (int i = 0; i < NUMBER_OF_INPUT_MOUNTAIN; i++) {
            String line = reader.readLine();
            heightList.add(Integer.parseInt(line));
        }
        // ストリームをクローズする
        if (reader != null) {
            reader.close();
        }

        return heightList;
    }

    /**
     * 既定の回数だけ、ソート済みの山の高さを表す整数リストを出力する。
     *
     * @param heightList ソート済みの山の高さを表す整数リスト
     */
    protected static void printHeight(List<Integer> heightList) {
        for (int i = 0; i < NUMBER_OF_OUTPUT_MOUNTAIN; i++) {
            System.out.println(heightList.get(i));
        }
    }

}