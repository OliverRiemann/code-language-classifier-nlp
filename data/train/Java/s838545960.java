import java.util.*;
import java.lang.*;

public class Main
{
    public static void main (String[] args) throws java.lang.Exception
	{
        
        int top = 0;
        int second = 0;
        int third = 0;
        int wk = 0;
        Scanner sc = new Scanner(System.in);
        while(sc.hasNext()){
            int height = sc.nextInt();
            
            if( !(0 <= height && height <= 10000)) {
                continue;
            }
            
            if (top < height) {
                wk = top;
                top = height;
                height = wk;
            }
            if (second < height) {
                wk = second;
                second = height;
                height = wk;
            }
            if (third < height) {
                wk = third;
                third = height;
                height = wk;
            }
	    }
        
        System.out.println(top);
        System.out.println(second);
        System.out.println(third);
    }   
}