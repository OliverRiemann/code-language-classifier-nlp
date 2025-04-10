using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Volume0003
{
    class Program
    {
        static int _NumOfData;
        static List<double> _sides = new List<double>();
        static double _longestSide;
        static double _shortSide1;
        static double _shortSide2;

        static void Main(string[] args)
        {
            _NumOfData = int.Parse(Console.ReadLine());
            for (int i = 0; i < _NumOfData; ++i)
            {
                _sides = Console.ReadLine().Split(' ').Select(double.Parse).ToList();
                _sides.Sort();
                _longestSide = Math.Pow(_sides[2], 2);
                _shortSide1 = Math.Pow(_sides[1], 2);
                _shortSide2 = Math.Pow(_sides[0], 2);
                if (_longestSide == _shortSide1 + _shortSide2)
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
}

