using System;
using System.Text;
using System.Collections.Generic;

namespace Solution
{
    class Solution
    {
        static void Main(string[] args)
        {
            List<int> mountains = new List<int>();
            for(int i = 0; i <= 9; i++)
            {
                int height = Int32.Parse(Console.ReadLine());
                for(int j = 0; j <= mountains.Count; j++)
                {
                    if (j == mountains.Count)
                    {
                        mountains.Add(height);
                        break;
                    }

                    if (height >= mountains[j])
                    {
                        mountains.Insert(j, height);
                        break;
                    }
                }
            }

            StringBuilder sb = new StringBuilder();
            sb.AppendLine(mountains[0].ToString());
            sb.AppendLine(mountains[1].ToString());
            sb.Append(mountains[2].ToString());
            Console.WriteLine(sb.ToString());
        }

    }
}
