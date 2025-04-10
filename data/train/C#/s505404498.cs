using System;
using System.Collections.Generic;
using System.Linq;

namespace JagArrayTest
{
    class Program
    {
        static void Main(string[] args)
        {
            var dataSetCount = Convert.ToInt32(Console.ReadLine());

            List<List<double>> dataSetList = new List<List<double>>();

            for(int count = 0; count< dataSetCount; count++)
            {
                var dataSet = Console.ReadLine().Split(' ').ToList().ConvertAll(double.Parse);
                dataSetList.Add(new List<double>() { dataSet[0], dataSet[1], dataSet[2] });
            }

            foreach(var elm in dataSetList)
            {
                if(isRightTriangle(elm))
                {
                    Console.WriteLine("YES");
                }
                else
                {
                    Console.WriteLine("NO");
                }
            }
        }

        static bool isRightTriangle(List<double> lengthList)
        {
            var sortedList = lengthList.OrderByDescending(d => d).ToList();

            if(Math.Pow(sortedList[0], 2) == (Math.Pow(sortedList[1], 2) + (Math.Pow(sortedList[2], 2))))
            {
                return true;
            }

            return false;
        }
    }
}

