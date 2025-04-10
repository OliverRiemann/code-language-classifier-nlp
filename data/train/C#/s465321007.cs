using System;
class three
{
    static void Main()
    {
        string a = Console.ReadLine();
        int b = int.Parse(a);
        bool[] c = new bool[b];
        for (int i = 0; i < b; i++)
        {
            string d = Console.ReadLine();
            string[] e = d.Split(' ');
            int[] f = new int[3];
            for(int j = 0; j < 3; j++)
            {
                f[j]=int.Parse(e[j]);
            }
            if (f[0] > f[1])
            {
                int w = f[0];
                f[0] = f[1];
                f[1] = w;
            }
             if (f[1] > f[2])
            {
                int w = f[1];
                f[1] = f[2];
                f[2] = w;
            }
            if (f[0] > f[2])
            {
                int w = f[0];
                f[0] = f[2];
                f[2] = w;
            }
            if (f[0] > f[1])
            {
                int w = f[0];
                f[0] = f[1];
                f[1] = w;
            }
            if (f[1] > f[2])
            {
                int w = f[1];
                f[1] = f[2];
                f[2] = w;
            }
            if (f[0] * f[0] + f[1] * f[1] == f[2] * f[2])
            {
                c[i] = true;
            }
            
        }
        for (int k = 0; k < b; k++)
            {
                if (c[k])
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