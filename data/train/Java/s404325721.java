import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {

    /**
     * 会津大学オンラインジャッジシステムのうち、<br>
     * volume 0のList Of Top 3 Hillsの問題の解答です。
     *
     * @param args
     */
    public static void main(String[] args) {

        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        String[] inputData = new String[10];

        try {
            for(int i = 0; i < 10; i++) {
                inputData[i] = in.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return;
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
                return;
            }
        }

        int firstHill = 0;
        int secondHill = 0;
        int thirdHill = 0;
        int nowHill = 0;

        for (String nowHillStr : inputData) {
            nowHill = Integer.parseInt(nowHillStr);
            if (nowHill > firstHill) {
                thirdHill = secondHill;
                secondHill = firstHill;
                firstHill = nowHill;
            } else if(nowHill > secondHill) {
                thirdHill = secondHill;
                secondHill = nowHill;
            } else if(nowHill > thirdHill) {
                thirdHill = nowHill;
            }
        }

        System.out.println(firstHill);
        System.out.println(secondHill);
        System.out.println(thirdHill);
    }
}