import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

public class Main {
	Scanner sc = new Scanner(System.in);

	public static void main(String[] args) {

		@SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);

		int num1 = sc.nextInt();
		int num2 = sc.nextInt();
		int num3 = sc.nextInt();
		int num4 = sc.nextInt();
		int num5 = sc.nextInt();
		int num6 = sc.nextInt();
		int num7 = sc.nextInt();
		int num8 = sc.nextInt();
		int num9 = sc.nextInt();
		int num10 = sc.nextInt();

		checkNum(num1);
		checkNum(num2);
		checkNum(num3);
		checkNum(num4);
		checkNum(num5);
		checkNum(num6);
		checkNum(num7);
		checkNum(num8);
		checkNum(num9);
		checkNum(num10);

		List<Integer> list = new ArrayList<Integer>();

		list.add(num1);
		list.add(num2);
		list.add(num3);
		list.add(num4);
		list.add(num5);
		list.add(num6);
		list.add(num7);
		list.add(num8);
		list.add(num9);
		list.add(num10);

		Collections.sort(list);
		Collections.reverse(list);

		for(int cnt = 0; cnt < 3; cnt++){

			System.out.println(list.get(cnt));
		}


	}

	public static void checkNum(int x){

		if(x < 0 || 10000 < x){

			throw new IllegalArgumentException("out of range");

		}
	}

}