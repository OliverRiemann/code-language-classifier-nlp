import java.util.*;

public class Main{
        public static void main(String[] args)throws Exception{
                Scanner sc = new Scanner(System.in);

                int[] res = new int[3];

                for(int i = 0; i < 10; i++){
                        int now = sc.nextInt();

                        if(now >= res[0]){
                                int x = res[0];
                                int y = res[1];
                                res[0] = now;
                                res[1] = x;
                                res[2] = y;
                        }else{
                                if(now >= res[1]){
                                        int x = res[1];
                                        res[1] = now;
                                        res[2] = x;
                                }else{
                                        if(now >= res[2]){
                                                res[2] = now;
                                        }
                                }
                         }
                }

                for(int j = 0; j < res.length; j++){
                        System.out.println(res[j]);
                }
        }
}