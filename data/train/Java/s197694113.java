import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[] array = new int[10];
		for(int i = 0; i < array.length; i++)
		array[i] = sc.nextInt();
		array = mergeSort(array);
		for(int i = 0; i < 3; i++)
		System.out.println(array[i]);
		}

		public static int[] mergeSort(int[] array) {
		if(array.length <= 1)
		return array;
		int[] head = split(array, 0, array.length / 2);
		int[] tail = split(array, array.length / 2, array.length);
		return merge(mergeSort(head), mergeSort(tail));
		}

		private static int[] split(int[] array, int start, int end) {
		int[] newArray = new int[end-start];
		for(int i = start, j = 0; i < end; i++, j++)
		newArray[j] = array[i];
		return newArray;
		}

		private static int[] merge(int[] a, int[] b) {
		int[] merged = new int[a.length + b.length];
		for(int i = 0, j = 0, k = 0; i < a.length + b.length; i++) {
		if(j == a.length || k == b.length)
		merged[i] = (j == a.length ? b[k++] : a[j++]);
		else
		merged[i] = (a[j] > b[k] ? a[j++] : b[k++]);
		}
		return merged;
		}
		}
