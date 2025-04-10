import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class Main {

	public static void main (String [] a){

		int numMountain = 10;
		int minConst = 0;
		int maxConst = 10000;
		int[] mountainList = new int[numMountain];
		int topOne = 0;
		int topTwo = 0;
		int topThree = 0;
		
		BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));
		String line;
		int i = 0;
		
		try {
			while (i < numMountain && (line = stdin.readLine()) != null && 
					line.length()!= 0 ) {
					
					try {
						int tempHeight = Integer.parseInt(line);
						if (tempHeight < minConst || tempHeight > maxConst) {
						} else {
							mountainList[i] = tempHeight;
							i++;
						}
					} catch (NumberFormatException e){
						// TODO Auto-generated catch block
						//e.printStackTrace();
					}
					
			}
			
			for (int j=0; j<numMountain; j++){
				if (mountainList[j] >= topOne){
					topThree = topTwo;
					topTwo = topOne;
					topOne = mountainList[j];
				} else if (mountainList[j] >= topTwo){
					topThree = topTwo;
					topTwo = mountainList[j];
				} else if (mountainList[j] >= topThree){
					topThree = mountainList[j];
				}
			}
			
			System.out.println(topOne +"\n"+ topTwo +"\n"+ topThree);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
		}
	}
}