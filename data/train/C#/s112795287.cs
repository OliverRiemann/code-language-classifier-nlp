using System;
class clas{
    public static void Main(){
        int[] mountain = new int[10];
        int a, b, c, d = 0, e = 0, f = 0;
        string x;
        for (int i = 0; i < 10; i++){
            x = Console.ReadLine();
            mountain[i] = int.Parse(x);
        }
        a = mountain[0];
        b = mountain[1];
        c = mountain[2];
        for(int n = 3; n < 10; n++){
            if (a <= b && a <= c && a <= mountain[n]){
                a = mountain[n];
                continue;
            }
            if (b <= a && b <= c && b <= mountain[n]){
                b = mountain[n];
                continue;
            }
            if (c <= b && c <= a && c <= mountain[n]){
                c = mountain[n];
                continue;
            }
        }
        if (a <= b && a <= c ){
            f = a;
            if (b <= c){
                e = b;
                d = c;
            }else{
                e = c;
                d = b;
            }
        }
        if (b <= a && b <= c ){
            f = b;
            if (a <= c)
            {
                e = a;
                d = c;
            }
            else
            {
                e = c;
                d = a;
            }
        }
        if (c <= b && c <= a ){
            f = c;
            if (b <= a)
            {
                e = b;
                d = a;
            }
            else
            {
                e = a;
                d = b;
            }
        }
        Console.WriteLine(d);
        Console.WriteLine(e);
        Console.WriteLine(f);
    }
}