import java.util.*;
import static java.lang.Math.*;
import static java.lang.System.out;

public class Main {
	Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		new Main().AOJ0001();
	}
	
	void AOJ0001(){	// List of Top 3 Hills
		int[] m = new int[10];
		for(int i=0; i<10; i++)	m[i]=sc.nextInt();
		Arrays.sort(m);
		for(int i=9; i>=7; i--)	out.println(m[i]);
	}
	
	void AOJ10029(){	// Sort II
		int n=sc.nextInt();
		int[] ans = new int[n];
		for(int i=0; i<n; i++)	ans[i]=sc.nextInt();
		Arrays.sort(ans);
		out.print(ans[0]);
		for(int i=1; i<n; i++)	out.print(" "+ans[i]);
		out.println();
	}
	
	int[][] p26 = new int[10][10];
	int c26=100;
	void AOJ0026(){	// Dropping Ink
		int ans=0;
		while(sc.hasNext()){
			Scanner sc2 = new Scanner(sc.nextLine()).useDelimiter(",");
			int x=sc2.nextInt(), y=sc2.nextInt(), s=sc2.nextInt();
			// out.println("x"+x+" y"+y+" s"+s);
			ans=max(solve26(x,y),ans);
			ans=max(solve26(x-1,y),ans);	ans=max(solve26(x+1,y),ans);
			ans=max(solve26(x,y-1),ans);	ans=max(solve26(x,y+1),ans);
			if(s>=2){
				ans=max(solve26(x-1,y-1),ans);	ans=max(solve26(x-1,y+1),ans);
				ans=max(solve26(x+1,y-1),ans);	ans=max(solve26(x+1,y+1),ans);
			}
			if(s>=3){
				ans=max(solve26(x-2,y),ans);	ans=max(solve26(x+2,y),ans);
				ans=max(solve26(x,y-2),ans);	ans=max(solve26(x,y+2),ans);
			}
		}
		out.println(c26);
		out.println(ans);
	}
	int solve26(int x, int y){
		int r=-1;
		if(0<=x && x<=9 && 0<=y && y<=9){
			c26 -= p26[x][y]==0? 1: 0;
			p26[x][y]++;
			r=p26[x][y];
		}
		return r;	// RA
	}
	
	void AOJ0008(){	//Sum of 4 Integers
		while(sc.hasNext()){
			int ans=0, n=sc.nextInt();
			for(int a=0; a<10; a++){
				for(int b=0; b<10; b++){
					for(int c=0; c<10; c++){
						for(int d=0; d<10; d++){
							if((a+b+c+d)==n)	ans++;
						}
					}
				}
			}
			out.println(ans);
		}
	}
	
	void AOJ0055(){	// Sequence
		while(sc.hasNext()){
			double last=sc.nextDouble(), ans=last;
			for(int i=2; i<=10; i++){
				ans+= i%2==0? last*2: last/3;
				last = i%2==0? last*2: last/3;
				// out.println(last);
			}
			out.println(ans);
		}
	}
}