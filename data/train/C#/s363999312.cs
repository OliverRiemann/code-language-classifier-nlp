using System;
class main
{
    static void Main(string[] args)
    {
            string s = Console.ReadLine();
            if (s != null)
            {
                int n = int.Parse(s);
                for (int i = 1; i <= n; ++i)
                {
                string s2 = Console.ReadLine();

                    if (s2 != null)
                    {
                        string[] t = s2.Split(' ');
                        int[] a = new int[3];
                        a[0] = int.Parse(t[0]);
                        a[1] = int.Parse(t[1]);
                        a[2] = int.Parse(t[2]);

                        Array.Sort(a);
                        if ((a[2] * a[2]) == (a[1] * a[1] + a[0] * a[0]))
                        {
                            Console.WriteLine("YES");
                        }
                        else
                        {
                            Console.WriteLine("NO");
                        }
                    }
                }
            }
        //Console.ReadKey();
    }
}