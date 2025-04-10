import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {
	public static void main(String[] a) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in), 1);
		String str = "";
		StringTokenizer st;
		int num[] = new int[3];
		int index[] = new int[2];
		int max = 0, i, j, k;
		
		str = br.readLine();
		int datasets =  Integer.parseInt(str);
		
		for (i = 0; i < datasets; i++) {
			str = br.readLine();
			st = new StringTokenizer(str, " ");
			num[0] = Integer.parseInt(st.nextToken());
			num[1] = Integer.parseInt(st.nextToken());
			num[2] = Integer.parseInt(st.nextToken());
			for (j =0; j < 3; j++) 
	            if(num[max] < num[j]) max = j;
			k = 0;
			for (j = 0; j < 3; j++) 
	            if(num[j] != num[max]) index[k++] = j;
			if ((num[max] * num[max]) == (num[index[0]] * num[index[0]] + num[index[1]] * num[index[1]]))
				System.out.println("YES");
			else
				System.out.println("NO");
		}
	}
}