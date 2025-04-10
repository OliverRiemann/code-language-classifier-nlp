import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Main {
	public String[] inputMountain = new String[10];
	public int[] mountain = new int[10];
	
	public static void main(String args[])throws IOException{
		int i;
		Main app = new Main();
		
		app.input();
		app.stringToInteger();
		app.sortMountain();
		app.output();
	}
	
	public void input()throws IOException{
		InputStreamReader isr = new InputStreamReader(System.in);
		BufferedReader br = new BufferedReader(isr);
		int i;
		for(i=0;i<10;i++)
			inputMountain[i] = br.readLine();
	}
	
	public void stringToInteger(){
		int i;
		for(i=0;i<10;i++)
			mountain[i] = Integer.parseInt(inputMountain[i]);
	}
	
	public void sortMountain(){
		int i,j,t;
		
		for(i=0;i<9;i++){
			for(j=9;j>i;j--){
				if(mountain[j]<mountain[j-1]){
					t = mountain[j];
					mountain[j] = mountain[j-1];
					mountain[j-1] = t;
				}
			}
		}
	}
	
	public void output(){
		int i;
		for(i=9;i>6;i--)
			System.out.println(mountain[i]);
	}
}