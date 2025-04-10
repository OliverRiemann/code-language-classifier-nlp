import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * 0002：Digit Number
 * 
 * @author MS14A
 * @version 2015/07/11
 */
public class Main {

    /** 区切り文字：スペース */
    private static final String DELIMITER_SPACE = " ";

    /**
     * 与えられた２つの整数 a と b の和の桁数を出力する。
     * 
     * @param args
     * @throws IOException
     * @throws NumberFormatException
     */
    public static void main(String[] args) throws NumberFormatException, IOException {

        // 各データセットの整数 a と b を取得
        List<Integer> a = new ArrayList<Integer>();
        List<Integer> b = new ArrayList<Integer>();
        getTarget(a, b);

        // データセット毎の a と b の和の桁数を出力
        for (int i = 0; i < a.size(); ++i) {
            System.out.println(getDigitNumber(a.get(i) + b.get(i)));
        }

    }

    /**
     * 与えられた数の桁数を求める
     * 
     * @param target 桁数を求める整数
     * @return 引数の桁数
     */
    private static int getDigitNumber(int target) {
        return String.valueOf(target).length();
    }

    /**
     * 標準入力を読み取り、データセットを取得する。
     * 
     * @param a 1つ目の整数
     * @param b 2つ目の整数
     * @throws NumberFormatException
     * @throws IOException
     */
    private static void getTarget(List<Integer> a, List<Integer> b) throws NumberFormatException, IOException {
        // 入力読取り
        InputStreamReader streamReader = new InputStreamReader(System.in);
        BufferedReader bufferedReader = new BufferedReader(streamReader);

        String line = null;

        try {
            while ((line = bufferedReader.readLine()) != null) {
                // 区切り文字により a と b に分けて格納
                String[] ab = line.split(DELIMITER_SPACE);
                a.add(Integer.parseInt(ab[0]));
                b.add(Integer.parseInt(ab[1]));
            }
        } finally {
            bufferedReader.close();
            streamReader.close();
        }
    }

}