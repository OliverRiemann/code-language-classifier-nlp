using System;
using System.Collections.Generic;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {


            List<string> YesNo = new List<string>();

            int  count =Convert.ToInt32( Console.ReadLine());

            List<int> datList;

            string s="";

            for (int i = 0; i < count; i++)
            {
                s= Console.ReadLine();

                datList = new List<int>();

                datList.Add(Convert.ToInt32(s.Split(' ')[0]));
                datList.Add(Convert.ToInt32(s.Split(' ')[1]));
                datList.Add(Convert.ToInt32(s.Split(' ')[2]));

                datList.Sort();

                if (Math.Pow(datList[2], 2) == Math.Pow(datList[0], 2) + Math.Pow(datList[1], 2))
                { 
                    YesNo.Add("YES"); 
                }
                else {
                    YesNo.Add("NO"); 
                }

            }


            for (int i = 0; i < YesNo.Count; i++)
            {
                Console.WriteLine(YesNo[i]);
            }
            Console.ReadLine(); 
        }
    }

}