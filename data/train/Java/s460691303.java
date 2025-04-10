import static java.lang.System.out;
import java.io.File;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Main extends BaseExe {

    public static void main(String[] args) {
        new Main().exeSysIn();
    }

    @Override
    protected void execute() throws Exception {
        List<Integer> nums = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);
        nums.forEach(x -> nums.forEach(y -> out.println(x + "x" + y + "=" + x * y)));
    }

    public void recursionQQ() {
        recursionQQ(1);
    }

    public void recursionQQ(int i) {
        if (i > 9)
            return;
        recursionQ(i, 1);
        recursionQQ(++i);
    }

    public void recursionQ(int i, int j) {
        if (j > 9)
            return;
        out.println(i + "x" + j + "=" + i * j);
        recursionQ(i, ++j);
    }

}

abstract class BaseExe {

    private Scanner scan;

    private String inData;

    public void exeSysIn() {
        try (Scanner scan = new Scanner(System.in)) {
            exeCtrl(scan);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void exeFileIn(String inDataPath) {
        try (Scanner scan = new Scanner(new File(inDataPath))) {
            exeCtrl(scan);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void exeCtrl(Scanner scan) throws Exception {
        this.scan = scan;
        execute();
    }

    protected abstract void execute() throws Exception;

    protected String nextLine() {
        return scan.nextLine();
    }

    protected boolean judgeInData() {
        return hasNextLine() && isNotEmptyInData();
    }

    protected boolean hasNextLine() {
        return scan.hasNextLine();
    }

    protected boolean isNotEmptyInData() {
        inData = nextLine();
        return !inData.isEmpty();
    }

    protected String getInData() throws Exception {
        if (inData.isEmpty())
            throw new Exception("inData is Empty.");
        return inData;
    }
}