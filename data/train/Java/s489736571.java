import java.util.Scanner;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Main{
    public static void main(String[] args){
        InputStreamReader inputStreamReader = new InputStreamReader(System.in);
        BufferedReader reader = new BufferedReader(inputStreamReader);

        String str;
        int[] num = new int[2];
        try {
            while(reader.ready()){
                str = reader.readLine();
                num = getNum(str);
                System.out.println(cntDigit(num[0] + num[1]));
            }   
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static int[] getNum(String str){
        String[] data = str.split(" "); 
        int[] num = new int[data.length];

        for (int i = 0; i < data.length; i++){
            num[i] = Integer.parseInt(data[i]);
        }
        return num;
    }

    private static int cntDigit(int num) {
        int n = 1;
        while(num >= 10) {
            n++;
            num /= 10;
        }
        return n;
    }
}
