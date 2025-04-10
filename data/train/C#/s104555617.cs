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
            while (true)
            {
                string str = Console.ReadLine();
                if (str == null)
                {
                    break;
                }
                float[] array = str.Split(' ').Select(float.Parse).ToArray();
                float[] array2 = new float[6];
                for (int i = 0; i < 3; i++)
                {
                    array2[i] = array[i] * array[3];
                }
                for(int i = 3; i < 6; i++)
                {
                    array2[i] = array[i] * array[0];
                }
                float y = (array2[2] - array2[5]) / (array2[1] - array2[4]);
                float x = (array[2] - array[1] * y)/array[0];

                Console.WriteLine("{0} {1}",x.ToString("0.000"),y.ToString("0.000"));

            }
        }

       
    }
}