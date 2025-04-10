using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _0003
{
    class Program
    {
        static void Main(string[] args)
        {
            int infomationLength = int.Parse(Console.ReadLine());
            List<string> answerList = new List<string>();
            for (int i = 0; i < infomationLength; ++i)
            {
                int[] sideList = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
                Array.Sort(sideList);
                answerList.Add(IsRightAngle(sideList));
            }
            foreach(string i in answerList)
            {
                Console.WriteLine(i);
            }
        }
        static string IsRightAngle(int[] sideList)
        {
            if(Math.Pow(sideList[2],2) == (Math.Pow(sideList[0], 2) + Math.Pow(sideList[1], 2)))
            {
                return "YES";
            }
            else
            {
                return "NO";
            }
        }
    }
}

