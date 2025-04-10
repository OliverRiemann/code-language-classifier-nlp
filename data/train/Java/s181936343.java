import java.util.*;

public class Main {

    public static void topThreeHills() {
        // Get 10 inputs for mountain heights
        Scanner scanner = new Scanner(System.in);
        int[] heights = new int[10];
        for (int i = 0; i < heights.length; i++) {
            heights[i] = scanner.nextInt();
        }

        // Find top three heights
        /*
        int[] threeHighest = Arrays.copyOfRange(heights, 0, 3);
        for (int i = 3; i < 10; i++) {
            if (heights[i] > threeHighest[0])
                threeHighest[0] = heights[i];
            else if (heights[i] > threeHighest[1])
                threeHighest[1] = heights[i];
            else if (heights[i] > threeHighest[2])
                threeHighest[2] = heights[i];
        }

        System.out.println(" ");
        System.out.println(threeHighest[0]);
        System.out.println(threeHighest[1]);
        System.out.println(threeHighest[2]);
        */

        Arrays.sort(heights);
        System.out.println(heights[9]);
        System.out.println(heights[8]);
        System.out.println(heights[7]);
    }

    public static void main (String args[]) {
        topThreeHills();
    }
}