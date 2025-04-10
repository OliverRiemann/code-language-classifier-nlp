import java.util.Scanner;

public class Main {
	private final static int LIST_MAX = 10;
	private final static int INPUT_MIN = 0;
	private final static int INPUT_MAX = 10000;
	
	public static void main(String[]args){
		int Mt_list[];
		Mt_list = input();
		
		sort(Mt_list);
		
		show(Mt_list);
	}
	
	public static void show(int[] list){
		for(int i = 0;i < 3;i++){
			System.out.println(list[i]);
		}
	}
	
	public static int[] input(){
		Scanner stdIn = new Scanner(System.in);
		int list[] = new int[LIST_MAX];
		
		for(int i = 0;i < LIST_MAX;i++){
			int tmp = stdIn.nextInt();
			if(input_ck(tmp)){
				list[i] = tmp;
			}else{
				continue;
			}
		}
		
		stdIn.close();
		return list;
	}
	
	public static boolean input_ck(int x){
		if(INPUT_MIN <= x && x <= INPUT_MAX){
			return true;
		}
		return false;
	}
	
	public static int[] sort(int[] list){
		for(int i = 0;i < LIST_MAX - 1;i++){
			for(int j = LIST_MAX - 1;j >= i + 1;j--){
				if(list[j - 1] < list[j]){
					int work = list[j - 1];
					list[j - 1] = list[j];
					list[j] = work;
				}
			}
		}
		return list;
	}
}