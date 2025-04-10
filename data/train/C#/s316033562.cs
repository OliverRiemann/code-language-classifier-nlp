using System;
    class Program
    {
        static void Main(string[] args)
        {
            int n = int.Parse(Console.ReadLine());
            double [,]hen=new double[n,3];
            for (int i = 0; i < n; i++)
            {
                string[] s = Console.ReadLine().Split(' ');
                hen[i, 0] = int.Parse(s[0]);
                hen[i, 1] = int.Parse(s[1]);
                hen[i, 2] = int.Parse(s[2]);
            }
            for (int i = 0; i < n; i++)
            {
                hen[i, 0] = Math.Pow(hen[i, 0], 2);
                hen[i, 1] = Math.Pow(hen[i, 1], 2);
                hen[i, 2] = Math.Pow(hen[i, 2], 2);
                if (hen[i, 0] == (hen[i, 1] + hen[i, 2]) || hen[i, 1] == (hen[i, 0] + hen[i, 2])||hen[i, 2] == (hen[i, 0] + hen[i, 1])) 
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