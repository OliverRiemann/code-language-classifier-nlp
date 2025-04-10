//using quick sort

import java.io.*;

public class Main {

	static int n;

	static void swap(int[] array, int i, int j) {

		int temp = array[i];
		array[i] = array[j];
		array[j] = temp;
	}

	static void quick_sort(int[] array, int left, int right) {
		int pivot = array[(left + right) / 2];
		int i = left;
		int j = right;

		while (true) {
			while (pivot > array[i])
				i++;
			while (pivot < array[j])
				j--;

			if (i >= j)
				break;

			swap(array, i, j);
			i++; // 次のデータ
			j--;
		}

		if (left < i - 1) /* 基準値の左に 2 以上要素があれば */
			quick_sort(array, left, i - 1); /* 左の配列を Q ソートする */
		if (j + 1 < right) /* 基準値の右に 2 以上要素があれば */
			quick_sort(array, j + 1, right); /* 右の配列を Q ソートする */

	}

	static void display(int[] array, int m, int n) {
		for (int i = n-1; i > m-1; i--) {
			System.out.print(array[i] + "\n");
		}
		//System.out.print("\n");
	}

	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int array[] = new int[10];
		for (int i = 0; i <= 9; i++) {
			String s = br.readLine();
			array[i] = Integer.parseInt(s);
		}

		//int[] array = { 6, 3, 1, 7, 0, 4, 8, 5, 2 };
		n = array.length;

		//System.out.println("初期値");
		//display(array, 0, n);
		quick_sort(array, n - n, n - 1);
		//System.out.println("ソート後");
		//display(array, 0, n);
		
		display(array, 7, 9+1);
	}
}