import java.util.Random;
import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);

		int[] heights = new int[10];

		for (int i = 0; i < 10; i++) {
			heights[i] = in.nextInt();
		}
		
		quicksort(heights, 0, heights.length - 1);
		
		for (int i = heights.length - 1; i >= heights.length - 3; i--) {
			System.out.println(heights[i]);
		}
	}

	private static void quicksort(int[] data, int start, int end) {
		if (start > end) {
			return;
		}

		int index = partition(data, start, end);
		quicksort(data, start, index - 1);
		quicksort(data, index + 1, end);
	}

	private static int partition(int[] data, int start, int end) {
		int index = -1;
		Random rd = new Random();

		while (index < start || index > end) {
			index = rd.nextInt(end + 1);
		}

		swap(data, index, end);
		int pivot = data[end];

		int i = -1, j = 0;

		for (; j < end; j++) {
			if (data[j] <= pivot) {
				swap(data, ++i, j);
			}
		}
		
		swap(data, ++i, end);
		
		return i;
	}

	private static void swap(int[] data, int i, int j) {
		int tmp = data[i];
		data[i] = data[j];
		data[j] = tmp;
	}
}