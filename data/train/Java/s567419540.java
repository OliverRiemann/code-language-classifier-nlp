
//Digit Number
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

class Main {

	public static void main(String[] args) throws IOException {

		BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

		while (true) {

			String tmp = in.readLine();
			if (tmp == null) {
				break;
			}
			String[] ab = tmp.split(" ");

			int a = Integer.parseInt(ab[0]);
			int b = Integer.parseInt(ab[1]);

			 String out =Integer.toString(a+b);
			 System.out.println(out.length());
			


		}

		// Scanner scan = new Scanner(System.in);
		//
		// while(scan.hasNext()){
		//
		// String[] ab = scan.next().split(" ");
		//
		// int a = Integer.parseInt(ab[0]);
		// int b = Integer.parseInt(ab[1]);
		//
		//// String out =Integer.toString(a+b);
		//// System.out.println(out.length());
		////
		//
		// int i=0;
		// while(true){
		// i++;
		// if(Math.pow(10, i)>a+b){
		// break;
		// }
		// }
		// System.out.println(i);
		//
		// }
		// scan.close();
	}
}