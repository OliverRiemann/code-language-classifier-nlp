import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Main {
	private StringTokenizer st;
	private BufferedReader bf;
	private int w;
	
	Main() {
//		readData();
		
		Scanner sc = new Scanner(System.in);
		
		while (sc.hasNext()){
			int m = sc.nextInt();
			int n = sc.nextInt();
			System.out.println(Integer.toString(m+n).length());
		}
		sc.close();
	}
	

	private void readData() {
		try {
			bf = new BufferedReader(new InputStreamReader(System.in));
			st = new StringTokenizer(bf.readLine());
			
			int m = nextInt();
			int n = nextInt();
			System.out.println(Integer.toString(m+n).length());

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int nextInt() throws IOException {
		return Integer.parseInt(next());
	}
	
	
	private String next() throws IOException {
		if (st == null || !st.hasMoreTokens())
			st = new StringTokenizer(bf.readLine());
		return st.nextToken();
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Main m = new Main();
	}

}