import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
	public static void main(String[] args) throws IOException{
	    BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
	    int i;
		int [] mountain;
		int escape = 0;

		mountain = new int[10];
		/*
		mountain[0] = 2362;
		mountain[1] = 1121;
		mountain[2] = 1462;
		mountain[3] = 1896;
		mountain[4] = 1082;
		mountain[5] = 2362;
		mountain[6] = 953;
		mountain[7] = 1545;
		mountain[8] = 3532;
		mountain[9] = 1170;
		*/

		/*System.out.println("山の高さ一覧");
		for(int i = 0; i < 10; i++) {
			System.out.println(mountain[i]);
		}
		*/

		for(i=0;i<10;i++)
	        mountain[i]=Integer.parseInt(br.readLine());

		/*System.out.println("ソート中");*/
		for(int a = 0; a < 9; a++) {
		    for(int b = a + 1; b < 10; b++) {
		    	if(mountain[a] < mountain[b]) {
		    		escape = mountain[b];
					mountain[b] = mountain[a];
					mountain[a] = escape;
				}
		    }
		    //System.out.println(mountain[i]);
		}

		/*System.out.println("ソート完了：高い順に３つ出力します");*/
		System.out.println(mountain[0]);
        System.out.println(mountain[1]);
        System.out.println(mountain[2]);

	}
}
