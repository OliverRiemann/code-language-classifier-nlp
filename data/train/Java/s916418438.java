
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class Main {


	
	public static void main(String[] args) throws NumberFormatException, IOException {
	        BufferedReader br = new BufferedReader(new InputStreamReader(System.in), 1);
	        String str = "";
	        StringTokenizer st;
	        while ((str = br.readLine()) != null) {
	            st = new StringTokenizer(str, " ");
	            if(st.countTokens() > 2)
	            	System.out.println("Only 2 numbers per dataset allowed.");
	            int n1;
				int n2;
				try {
					n1 = Integer.parseInt(st.nextToken());
					n2 = Integer.parseInt(st.nextToken());
		            if(n1<0 || n2 < 0 || n1 > 1000000 || n2 > 1000000)
		            	System.out.println("Out of range. 0 ??? a, b ??? 1,000,000");
		            
		            str = String.valueOf(n1+n2);
		            System.out.println(str.length());
				} catch (NumberFormatException e) {
					System.out.println("Only number as follows allowed: 0 ??? a, b ??? 1,000,000");
				}
	        }
	}

}