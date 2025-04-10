import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

/**
 * 0001：List of Top 3 Hills
 * 
 * @author Lyu
 * @version 2015/06/21
 */
public class Main {

    /**
     * 10個のデータを読み込み、高い順に3つ出力する。
     * 
     * @param args
     * @throws IOException 
     * @throws NumberFormatException 
     */
    public static void main(String[] args) throws NumberFormatException, IOException {

        // 標準入力読取り
        int[] heightOfHills = getHeightOfHills();
        
        // 高い順に3つを表示
        printTop3(heightOfHills);
    }

    
    /**
     * 標準入力を読み取り、山の高さを表すデータを要素数10の配列で返す。
     * 
     * @return 山の高さを表す配列
     * @throws NumberFormatException
     * @throws IOException
     */
    private static int[] getHeightOfHills() throws NumberFormatException, IOException {
        // 入力読取り
        InputStreamReader streamReader = new InputStreamReader(System.in);
        BufferedReader bufferedReader = new BufferedReader(streamReader);

        String line = null;
        int[] heightOfHills = new int[10];
        int count = 0;

        try {
            while ((line = bufferedReader.readLine()) != null) {
                heightOfHills[count] = Integer.parseInt(line);
                ++count;
            }
        } finally {
            bufferedReader.close();
            streamReader.close();
        }
        return heightOfHills;
    }

    /**
     * 受け取ったint型配列要素を、数値の大きい順に3つ出力する。
     * 
     * @param array int型の配列
     */
    private static void printTop3(int[] array) {
        // ソート
        Arrays.sort(array);
        
        // 高い順に3つを出力
        for (int i = 1; i <= 3; ++i) {
            System.out.println(array[array.length - i]);
        }
    }
}