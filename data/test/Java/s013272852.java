
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String line;
        try {
            line = br.readLine();
            int n = Integer.parseInt(line.trim());
            for(int i=0; i<n; i++){
                line = br.readLine();
                String[] numbers = line.trim().split(" ");
                int[] sides = {Integer.parseInt(numbers[0]), Integer.parseInt(numbers[1]), Integer.parseInt(numbers[2])};
                int maxSide = sides[0]>sides[1] && sides[0]>sides[2]? 0: sides[1]>sides[2]? 1: 2;
                int sum = 0;
                for(int j=0; j<3; j++){
                    if(j != maxSide){
                        sum += sides[j] * sides[j];
                    }
                }
                System.out.println(sides[maxSide] * sides[maxSide] == sum ? "YES": "NO");
            }
        } catch (IOException e) {
        }
    }
}