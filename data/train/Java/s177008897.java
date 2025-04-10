import java.util.Scanner;

public class Main {
	static Scanner scanner = new Scanner(System.in);
	static int Hillta[]= new int[10];

	public static void main(String args[]){
		for(int i=0; i <= 9; i++){
			Hillta[i] = S_content();
		}								//?±±????????????10????????\?????????
		judge();
	}

	public static int S_content(){
		int high = scanner.nextInt();
		return high;
	}

	public static void judge(){
		int rank1=0, rank2=0, rank3=0;
		rank1 = Hillta[0];
		for(int i=1; i <= 9; i++){
			//System.out.println("?????¨?????????:??????" + rank1+"??????"+ rank2 +"??????"+ rank3);
			if(Hillta[i] > rank3){
				if(Hillta[i] > rank2){
					if(Hillta[i] > rank1){
						rank3 = rank2;
						rank2 = rank1;
						rank1 = Hillta[i];

						//System.out.println("1??????"+rank1);
						continue;
					}
					rank3 = rank2;
					rank2 = Hillta[i];
					//System.out.println("2??????"+rank2);
					continue;
				}
				rank3 = Hillta[i];
				//System.out.println("3??????"+rank3);
				continue;
			}
		}
		System.out.println(rank1);
		System.out.println(rank2);
		System.out.println(rank3);

	}
}