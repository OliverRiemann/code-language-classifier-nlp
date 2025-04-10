using System;

namespace Prob0003
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.ReadLine();
            
            string line;
            while((line = Console.ReadLine()) != null)
            {
                string[] tokens = line.Split(' ');
                
                int[] sides = new int[tokens.Length];
                for(int i = 0; i < tokens.Length; i++)
                {
                    sides[i] = int.Parse(tokens[i]);
                    sides[i] *= sides[i];
                }
                
                bool flag = false;
                for(int i = 0; i < tokens.Length; i++)
                {
                    int sum = 0;
                    for(int j = 0; j < tokens.Length; j++)
                    {
                        if(i != j)
                        {
                            sum += sides[j];
                        }
                    }

                    if(sides[i] == sum)
                    {
                        flag = true;
                    }
                }

                Console.WriteLine((flag ? "YES" : "NO"));
            }
        }
    }
}

