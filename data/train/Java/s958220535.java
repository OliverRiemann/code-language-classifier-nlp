import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    /** 入力される数値の数 */
    private static final int NUMBER_OF_INPUT = 2;

    /**
     * 空白区切りの2つの数字を受け取り、その2つの数字の合計値の桁数を出力する。
     *
     * @param args
     */
    public static void main(String[] args) throws IOException {

        // 入力がある限り処理を行う
        String line = null;
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while((line = reader.readLine()) != null) {

            // 入力文字列を数値配列に変換する
            int[] input = convertStringToIntArray(line);

            // 合計値の桁数を取得する
            int sum = calculateSum(input);
            int numberOfDigit = getNumberOfDigit(sum);

            // 結果を出力する
            System.out.println(numberOfDigit);
        }

        if (reader != null) {
            reader.close();
        }
     }

    /**
     * 空白区切りの数値を取得し、整数の配列として返却する。
     *
     * @param line 空白区切りの数値文字列
     * @return 整数の配列
     */
    protected static int[] convertStringToIntArray(String line){
        int [] result = new int[NUMBER_OF_INPUT];

        String[] splittedLine = line.split(" ");
        for( int i = 0; i < splittedLine.length; i++){
            result[i] = Integer.parseInt(splittedLine[i]);
        }

        return result;
    }

    /**
     * 引数で渡された整数配列の合計値を返す。
     *
     * @param input 整数の配列
     * @return 整数の配列の合計値
     */
    protected static int calculateSum(int[] input) {
        int sum = 0;
        for (int i = 0; i < input.length; i++) {
            sum += input[i];
        }
        return sum;
    }

    /**
     * 指定された数値の桁数を返す。
     *
     * @param target 数値
     * @return 数値の桁数
     */
    protected static int getNumberOfDigit(int target) {
        // 文字列に変換して、文字数を返す
        return String.valueOf(target).length();
    }

}