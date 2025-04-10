using System;
using System.Collections.Generic;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            string A1 = Console.ReadLine();
            string A2 = Console.ReadLine();
            string A3 = Console.ReadLine();
            string A4 = Console.ReadLine();
            string A5 = Console.ReadLine();
            string A6 = Console.ReadLine();
            string A7 = Console.ReadLine();
            string A8 = Console.ReadLine();
            string A9 = Console.ReadLine();
            string A10 = Console.ReadLine();
            int a1 = int.Parse(A1);
            int a2 = int.Parse(A2);
            int a3 = int.Parse(A3);
            int a4 = int.Parse(A4);
            int a5 = int.Parse(A5);
            int a6 = int.Parse(A6);
            int a7 = int.Parse(A7);
            int a8 = int.Parse(A8);
            int a9 = int.Parse(A9);
            int a10 = int.Parse(A10);
            
            var A = new List<int>();
            A.Add(a1);
            A.Add(a2);
            A.Add(a3);
            A.Add(a4);
            A.Add(a5);
            A.Add(a6);
            A.Add(a7);
            A.Add(a8);
            A.Add(a9);
            A.Add(a10);
            A.Sort();
            Console.WriteLine(A[9]);
            Console.WriteLine(A[8]);
            Console.WriteLine(A[7]);
            Console.ReadKey();
        }
    }
}