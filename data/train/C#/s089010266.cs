using System.Linq;
using System.Collections.Generic;
using System;

public class Hello{
    public static void Main(){
        // ???????????????????¨??????§
        // Let's ?????£??¬????????????
        var n = int.Parse(System.Console.ReadLine());
        
        // var line = line.Select(elem => int.Parse(elem)).ToList();
        
        
        for (var i = 0; i < n; i++) {
            var line = System.Console.ReadLine().Split(' ');
            var line2 = line.Select(elem => int.Parse(elem)).ToList();
            var a = line2[0];
            var b = line2[1];
            var c = line2[2];
            var a2 = Math.Pow(a,2) == Math.Pow(b,2) + Math.Pow(c,2);
            var b2 = Math.Pow(b,2) == Math.Pow(c,2) + Math.Pow(a,2);
            var c2 = Math.Pow(c,2) == Math.Pow(a,2) + Math.Pow(b,2);
            
            if (a2 || b2 || c2) {
                System.Console.WriteLine("YES");
            }
            else {
                System.Console.WriteLine("NO");
            }
        }
       
        
    }
}