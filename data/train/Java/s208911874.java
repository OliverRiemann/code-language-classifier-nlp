import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Comparator;

class Main {

    private static final int MOUNTAIN_COUNT = 10;

    public static void main(final String[] args) throws IOException, NumberFormatException {

        Integer[] mountainHeights = new Integer[10];

        BufferedReader input = null;
        try {
            input = new BufferedReader(new InputStreamReader(System.in));
            for (int i = 0; i < MOUNTAIN_COUNT; i++) {
                mountainHeights[i] = Integer.parseInt(input.readLine());
            }
        } finally {
            if (input != null) {
                input.close();
            }
        }

        Arrays.sort(mountainHeights, new Comparator<Integer>() {
            @Override
            public int compare(final Integer lhs, final Integer rhs) {
                return rhs.compareTo(lhs);
            }
        });

        for (int i = 0; i < 3; i++) {
            System.out.println(mountainHeights[i]);
        }
    }

}