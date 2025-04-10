import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int[] top3 = new int[3];
        for(int i=0; i<10; i++){
            try {
                String line = br.readLine();
                if(line != null){
                    int tmp = Integer.parseInt(line.trim());
                    if(tmp>top3[0]){
                        top3[2] = top3[1];
                        top3[1] = top3[0];
                        top3[0] = tmp;
                    } else if(tmp>top3[1]){
                        top3[2] = top3[1];
                        top3[1] = tmp;
                    } else if(tmp>top3[2]){
                        top3[2] = tmp;
                    }
                }
            } catch (IOException e) {
            }

        }
        for(int i=0; i<3; i++) {
            System.out.println(top3[i]);
        }
    }
}