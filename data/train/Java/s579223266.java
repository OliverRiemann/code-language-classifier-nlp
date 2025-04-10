import java.io.*;
import java.util.*;

class Main{
	private static ArrayList<Integer> sum_dig(ArrayList<Integer> a){
		ArrayList<Integer> b = new ArrayList<Integer>();
		for(int i = 0;i<a.size()/2;i++){
			int sum = 0;
			if(i == 0) sum = a.get(0)+a.get(1);
			sum =  a.get(i*2)+a.get(i*2+1);
			String sums;
			sums = String.valueOf(sum);
			b.add(sums.length());
			}
		return b;
	}
	private static void print_dig(ArrayList<Integer> a){
		for(int i = 0;i<a.size();i++){
			System.out.println(a.get(i));
		}
	}
		public static void main(String args[]) throws IOException{
			ArrayList<Integer> dig = new ArrayList<Integer>();
			Scanner scan = new Scanner(System.in);

			int n1,n2;
			while(scan.hasNext()){
				try{
				String str1 = scan.next();
				String str2 = scan.next();
				
				n1 = Integer.parseInt(str1);
				n2 = Integer.parseInt(str2);
				dig.add(n1);
				dig.add(n2);
			}
			catch(NumberFormatException e){
				break;
			}
		}
			ArrayList<Integer> res = new ArrayList<Integer>();
			res = sum_dig(dig);
			print_dig(res);
	}
}