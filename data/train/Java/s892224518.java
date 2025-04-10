import java.util.Scanner;
public class Main{
	static void swap(int[] a, int idx1, int idx2) {
        int t = a[idx1];
        a[idx1] = a[idx2];
        a[idx2] = t;
    }
    static void quickSort(int[] a, int left, int right) {
        int pl = left;
        int pr = right;
        int x = a[(pl + pr) / 2];
 
        do {
            while (a[pl] < x) {
                pl++;
            }
            while (a[pr] > x) {
                pr--;
            }
            if (pl <= pr) {
                swap(a, pl++, pr--);
            }
        } while (pl <= pr);
 
        if (left < pr) {
            quickSort(a, left, pr);
        }
        if (pl < right) {
            quickSort(a, pl, right);
        }
    }
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		int[] hill=new int[10];
		for(int i=0;i<10;i++){
			hill[i]=scan.nextInt();
		}	
		quickSort(hill,0,9);
		System.out.println(hill[9]);
		System.out.println(hill[8]);
		System.out.println(hill[7]);
	}
}