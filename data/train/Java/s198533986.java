import java.util.*;

public class Main {
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int[] a = new int[10];
        for(int i = 0; i < 10; i++){
            a[i] = sc.nextInt();
        }
        int top1 = 0;
        int top2 = 0;
        int top3 = 0;
        int num1 = 0;
        int num2 = 0;
        for(int i = 0; i < 10; i++){
            if(a[i] > top1){
                top1 = a[i];
                num1 = i;
            }
        }
        for(int i = 0; i < 10; i++){
            if(i == num1){
                continue;
            }else if(a[i] > top2){
                top2 = a[i];
                num2 = i;
            }
        }
        for(int i = 0; i < 10; i++){
            if(i == num1 || i == num2){
                continue;
            }else if(a[i] > top3){
                top3 = a[i];
            }
        }
        System.out.println(top1);
        System.out.println(top2);
        System.out.println(top3);
    }
}

