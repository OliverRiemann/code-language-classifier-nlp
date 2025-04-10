import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class Main {

    private static final int DATA_SET = 200;

    public static void main(String[] args) {

        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        List<String> inputDataList = new ArrayList<String>(DATA_SET);
        String input = null;

        try {
            while((input = in.readLine()) != null) {
                inputDataList.add(input);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        for (String inputData : inputDataList) {
            String[] data = inputData.split(" ");
            double result = Math.log10(Double.parseDouble(data[0]) + Double.parseDouble(data[1]));
            System.out.println(new Double(result).intValue() + 1);
        }
    }
}