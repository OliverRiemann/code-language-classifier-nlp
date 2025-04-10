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

    /**
     * 与えられた２つの整数 a と b の和の桁数を出力する。
     * 
     * @param args
     * @throws IOException 
     * @throws NumberFormatException 
     */
    public static void main(String[] args) throws NumberFormatException, IOException {

        List<Integer> a = new ArrayList<Integer>();
        List<Integer> b = new ArrayList<Integer>();

        getTarget(a, b);
        
        for (int i = 0; i < a.size(); ++i) {
            System.out.println(getDigitNumber(a.get(i)+b.get(i)));
        }

    }

    private static int getDigitNumber(int target) {
        return String.valueOf(target).length();
    }

    private static void getTarget(List<Integer> a, List<Integer> b) throws NumberFormatException, IOException {
        // 入力読取り
        InputStreamReader streamReader = new InputStreamReader(System.in);
        BufferedReader bufferedReader = new BufferedReader(streamReader);

        String line = null;

        try {
            while ((line = bufferedReader.readLine()) != null) {
                String[] ab = line.split(" ");
                a.add(Integer.parseInt(ab[0]));
                b.add(Integer.parseInt(ab[1]));
            }

        } finally {
            bufferedReader.close();
            streamReader.close();
        }

    }

}