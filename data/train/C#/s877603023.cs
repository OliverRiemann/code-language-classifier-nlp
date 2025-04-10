using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AthleteProgramming
{
    class Program
    {
        static void Main()
        {
            int n = int.Parse(Console.ReadLine());
            for(int i = 0; i < n; i++)
            {
                int[] array = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
                Sort(ref array);
                CheckRightTriangle(array);
            }
        }

        static void CheckRightTriangle(int[] array)
        {
            if (array[0] * array[0] == array[1] * array[1] + array[2] * array[2])
            {
                Console.WriteLine("YES");
            }
            else
            {
                Console.WriteLine("NO");
            }
        }

        static void Sort(ref int[] array)
        {
            for(int i = array.Length-1; i >= 0; i--)
            {
                for(int j = 0; j < i; j++)
                {
                    if (array[j] < array[j + 1])
                    {
                        Swap(ref array[j], ref array[j + 1]);
                    }
                }
            }
        }

        static void Swap(ref int a, ref int b)
        {
            int tmp = a;
            a = b;
            b = tmp;
        }

    }
}