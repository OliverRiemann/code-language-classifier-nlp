import java.util.Scanner;

class Main{
        public static void main(String[] args){
                Scanner scan = new Scanner(System.in);
                int data=0;
                int top[] = new int[3];
                top[0]=0;
                top[1]=0;
                top[2]=0;
                for(int i=0;i<10;i++){
                        data=scan.nextInt();
                        if(data>top[2]){
                                if(data>top[1]){
                                        if(data>top[0]){
                                                top[2]=top[1];
                                                top[1]=top[0];
                                                top[0]=data;
                                                continue;
                                        }
                                        top[2]=top[1];
                                        top[1]=data;
                                        continue;
                                }
                                top[2]=data;
                                continue;
                        }
                }
                System.out.println(top[0]+"\n"+top[1]+"\n"+top[2]);
                
        }
}