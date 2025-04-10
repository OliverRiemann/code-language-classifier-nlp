//using System;
//class p0003
//{
//    static void Main(string[] args)
//    {
//        int cnt = int.Parse(Console.ReadLine());
//        while (0 < cnt--)
//        {
//            var ary = Console.ReadLine().Split(' ');
//            Array.Sort(ary);
//            var x = (int)Math.Pow(double.Parse(ary[0]), 2);
//            var y = (int)Math.Pow(double.Parse(ary[1]), 2);
//            var z = (int)Math.Pow(double.Parse(ary[2]), 2);
//            Console.WriteLine((x + y == z) ? "YES" : "NO");
//        }
//    }
//}


using System;
 
class p0003{
     
    static void Main(string[] args){
        int n;
        string str;
        string[] s;
        int[] a = new int[3];

        while ((str = Console.ReadLine()) != null)
        {
            n = int.Parse(str);

            while (0 < n--)
            {
                s = (Console.ReadLine()).Split(' ');
                for (int i = 0; i < 3; ++i)
                {
                    a[i] = int.Parse(s[i]);
                    a[i] = a[i] * a[i];
                }
                Console.WriteLine("{0}", ((a[0] == a[1] + a[2] || a[1] == a[0] + a[2] || a[2] == a[0] + a[1]) ? "YES" : "NO"));
            }
        }
    }
     
}