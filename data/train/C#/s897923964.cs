using System;
class main
{
    static void Main(string[] args)
    {
        //int g = 1;
        //int[] a = new int[2];
        //string[] i = Console.ReadLine().Split(' ');
        //string[] j = Console.ReadLine().Split('\r');
        //int j = int.Parse(Console.ReadLine());
        //decimal j = decimal.Parse(Console.ReadLine());
        //double j = double.Parse(Console.ReadLine());
        //int y = int.Parse(i[0]);
        //int x = int.Parse(i[1]);
        //int z = int.Parse(i[2]);
        //a[0] = int.Parse(i[0]);
        //a[1] = int.Parse(i[1]);
        //a[2] = int.Parse(i[2]);

        for (int a = 1; a <= 9; ++a)
        {
            for (int b = 1; b <= 9; ++b)
            {
                Console.WriteLine(a + "x" + b + "=" + (a*b));
            }
        }

            //Console.WriteLine((j*j*Math.PI) + " " + (2*j*Math.PI));

            /*int d = a[0] / a[1];
            int r = a[0] % a[1];
            decimal f = (decimal)a[0] / (decimal)a[1];
            Console.WriteLine(d + " " + r + " " + f);*/

            /*int i = 1;
            while (true)
            {
                string[] s = Console.ReadLine().Split(' ');
                a[0] = int.Parse(s[0]);
                a[1] = int.Parse(s[1]);
                if (a[0] == 0 && a[1] == 0)
                    break;
                Array.Sort(a);
                Console.WriteLine(a[0] + " " + a[1]);
                i++;
            }*/

            /*if (y < x)
            {
                Console.WriteLine("a" + " < " + "b");
            }
            if (y > x)
            {
                Console.WriteLine("a" + " > " + "b");
            }
            if (y == x)
            {
                Console.WriteLine("a" + " == " + "b");
            }*/

            //Array.Sort(a);
            /*Console.WriteLine(a[0] + " " + a[1] + " " + a[2]);
            while(g <= 1000)
            {
                Console.WriteLine("Hello World");
                ++g;
            }*/

            /*int i = 1;
            while (true)
            {
                string s = Console.ReadLine();
                if (s == "0")
                    break;
                Console.WriteLine("Case {0}: {1}", i, s);
                i++;
            }*/

            /*for (int s = 0; s < j.Length; ++s)
            {
                Console.WriteLine("Case " + (s+1) + ": " + j[s]);
            }
            Console.WriteLine(g);*/
            Console.ReadKey();
    }
}