import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Main {
  static InputReader in;
  static PrintWriter out;
  
  static class Solution {
    void solve() throws IOException {
      int[] height = new int[10];
      int first;
      int second;
      int third;
      
      
      height[0] = in.nextInt();
      int max = height[0];
      int memmax = 0;
      
      for (int i = 1; i < 10; i++) {
        height[i] = in.nextInt();
        max = Math.max(max, height[i]);
        if (max == height[i]) {
          memmax = i;
        }
      }
      first = max;
      
      height[memmax] = -1;
      max = height[0];
      memmax = 0;
      for (int i = 1; i < 10; i++) {
        max = Math.max(max, height[i]);
        if (max == height[i]) {
          memmax = i;
        }
      }
      second = max;
      
      height[memmax] = -1;
      max = height[0];
      memmax = 0;
      for (int i = 1; i < 10; i++) {
        max = Math.max(max, height[i]);
        if (max == height[i]) {
          memmax = i;
        }
      }
      third = max;
      
      out.println(first);
      out.println(second);
      out.println(third);
      
//      End solve()
    }
//    End Solution
}


  public static void main(String[] args) throws IOException {
    in = new InputReader(System.in);
    out = new PrintWriter(System.out);
    Solution solver = new Solution();
    solver.solve();
    out.close();
}


  static class InputReader {
    public BufferedReader br;
    public StringTokenizer st;

    public InputReader(InputStream stream) {
      br = new BufferedReader(new InputStreamReader(stream));
    }

    public int nextInt() throws IOException {
      while (st == null || !st.hasMoreTokens()) {
        st = new StringTokenizer(br.readLine());
      }
      return Integer.parseInt(st.nextToken());
    }

    public long nextLong() throws IOException {
      while (st == null || !st.hasMoreTokens()) {
        st = new StringTokenizer(br.readLine());
      }
      return Long.parseLong(st.nextToken());
    }

    public String next() throws IOException {
      while (st == null || !st.hasMoreTokens()) {
        st = new StringTokenizer(br.readLine());
      }
      return st.nextToken();
    }

    public double nextDouble() throws IOException {
      while (st == null || !st.hasMoreTokens()) {
        st = new StringTokenizer(br.readLine());
      }
      return Double.parseDouble(st.nextToken());
    }

  }

}