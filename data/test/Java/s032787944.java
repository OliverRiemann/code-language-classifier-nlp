public class Main {

    private static final int BEGIN = 1;
    private static final int END = 9;

    /**
     * 九九の一覧を表示する
     *
     * @param args
     */
    public static void main(String[] args) {
        // 各オペランドにつき、9回ずつループを回し、全ての組み合わせを表示する
        for (int i = BEGIN; i <= END; i++) {
            for (int j = BEGIN; j <= END; j++) {
                System.out.println(createMultiplicationLine(i, j));
            }
        }
    }

    /**
     * 指定されたオペランドを用いて、掛け算の1行を表す文字列作成する。
     * 例： "1x2=2"
     *
     * @param i オペランド1
     * @param j オペランド2
     * @return 指定されたオペランドを用いて作成した掛け算を表す文字列
     */
    protected static String createMultiplicationLine(int i, int j) {
        StringBuilder buffer = new StringBuilder();
        buffer.append(i);
        buffer.append("x");
        buffer.append(j);
        buffer.append("=");
        buffer.append(i * j);
        return buffer.toString();
    }
}