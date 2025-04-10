import java.io.*;

class Main {
	public static void main(String args[]) {
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			String s[], t;
			int i, j, ans, l, m;
			boolean flag = false;
			while((t = reader.readLine()) != null) {
				s = t.split(" ");
				i = s[0].length()-1 >= s[1].length()-1 ? s[0].length()-1 : s[1].length()-1;
				j = s[0].length()-1 <= s[1].length()-1 ? s[0].length()-1 : s[1].length()-1;
				l = s[0].length()-1 >= s[1].length()-1 ? 0 : 1;
				int a[][] = {new int[i+1], new int[j+1]};
				for(int k = 0;k < i+1;k++) {
					a[0][k] = s[l].charAt(k)-'0';
				}
				int f = Math.abs(l-1);
				for(int k = 0;k < j+1;k++) {
					a[1][k] = s[f].charAt(k)-'0';
				}
				while(i>=0) {
					if(j >= 0)
						m = a[1][j];
					else
						m = 0;
					a[0][i] = a[0][i] + m;
					if(a[0][i]>9) {
						if(i>0) {
							a[0][i] %= 10; 
							a[0][i-1]++;
						}
						else if(i==0){
							flag = true;
							break;
						}
					}
					i--;
					j--;
				}
				ans = flag ? a[0].length+1 : a[0].length;
				System.out.println(ans);
				flag = false;
			}
		}
		catch(IOException e) {
			System.out.println(e);
		}
	}
}