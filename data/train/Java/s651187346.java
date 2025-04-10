import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.*;

public class Main {
    final BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    final String LINE_SPR = System.getProperty("line.separator");
    final int BIG_MOD = 1000000007;

    void run() throws Exception {
        int nt = ni();
        for(int t = 0; t < nt; t++) {
            String[] nums = ns().split(" ");
            int a = Integer.parseInt(nums[0]);
            int b = Integer.parseInt(nums[1]);
            int c = Integer.parseInt(nums[2]);
            if(a * a + b * b == c * c || b * b + c * c == a * a
                    || c * c + a * a == b * b)
                System.out.println("YES");
            else
                System.out.println("NO");
        }

    }


    /*
     * Templates
     */
    void dumpObjArr(Object[] arr, int n) {
        for(int i = 0; i < n; i++) {
            System.out.print(arr[i]);
            if(i < n - 1)
                System.out.print(" ");
        }
        System.out.println("");
    }

    void dumpObjArr2(Object[][] arr, int m, int n) {
        for(int j = 0; j < m; j++) 
            dumpObjArr(arr[j], n);
    }

    int ni() throws Exception {
        return Integer.parseInt(br.readLine().trim());
    }

    long nl() throws Exception {
        return Long.parseLong(br.readLine().trim());
    }

    String ns() throws Exception {
        return br.readLine();
    }

    boolean isPrime(int n) {
        for(int i=2;i<n;i++) {
            if(n%i==0)
                return false;
        }
        return true;
    }

    int getPrime(int n) {
        List<Integer> primes = new ArrayList<Integer>();
        primes.add(2);
        int count = 1;

        int x = 1;
        while(primes.size() < n) {
            x+=2;
            int m = (int)Math.sqrt(x);
            for(int p : primes) {
                if(p > m) {
                    primes.add(x);
                    break;
                }

                if(x % p == 0) 
                    break;
            }
        }

        return primes.get(primes.size() - 1);
    }

    void gcjPrint(String str, int t) {
        System.out.println("Case #" + t + ": " + str);
    }

    public static void main(String[] args) throws Exception {
        new Main().run();
    }
}