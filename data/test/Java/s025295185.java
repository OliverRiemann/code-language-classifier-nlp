import java.io.BufferedReader;
import java.io.BufferedOutputStream;
import java.io.PrintWriter;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Scanner;
import java.util.StringTokenizer;
import java.io.IOException;


public class Main{
   public static void main(String[] args) {
      Scanner kb = new Scanner(System.in);
      out = new PrintWriter(new BufferedOutputStream(System.out));
      
      int height[] = new int[10];
      for(int i = 0 ; i < 10 ; i++){
    	  height[i] = kb.nextInt();
      }
      
      Arrays.sort(height);
      
      System.out.println(height[9]);
      System.out.println(height[8]);
      System.out.println(height[7]);

   }

   //-----------PrintWriter for faster output---------------------------------
   public static PrintWriter out;
      
   //-----------MyScanner class for faster input----------
   public static class MyScanner {
      BufferedReader br;
      StringTokenizer st;
 
      public MyScanner() {
         br = new BufferedReader(new InputStreamReader(System.in));
      }
 
      String next() {
          while (st == null || !st.hasMoreElements()) {
              try {
                  st = new StringTokenizer(br.readLine());
              } catch (IOException e) {
                  e.printStackTrace();
              }
          }
          return st.nextToken();
      }
 
      int nextInt() {
          return Integer.parseInt(next());
      }
 
      long nextLong() {
          return Long.parseLong(next());
      }
 
      double nextDouble() {
          return Double.parseDouble(next());
      }
 
      String nextLine(){
          String str = "";
   try {
      str = br.readLine();
   } catch (IOException e) {
      e.printStackTrace();
   }
   return str;
      }

   }
   //--------------------------------------------------------
}