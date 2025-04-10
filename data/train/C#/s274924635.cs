using System;
using System.Collections.Generic;


class UNKO
{
    
    static void Main()
    {
        string str;

        List<double> Answers = new List<double>();
        int count = 0;

        while ((str = Console.ReadLine()) != null)
        {
            string[] strarray = str.Split(' ');

            double[] abcdef = new double[6];

            for (int i=0;i<6;i++)
            {
                abcdef[i] = double.Parse(strarray[i]);
            }

           
                    double x = ((abcdef[4] * abcdef[2]) - (abcdef[1] * abcdef[5])) / ((abcdef[4] * abcdef[0]) - (abcdef[1] * abcdef[3]));
                    double y = ((abcdef[3] * abcdef[2]) - (abcdef[0] * abcdef[5])) / ((abcdef[1] * abcdef[3]) - (abcdef[0] * abcdef[4]));
     
            Answers.Add(x);
            Answers.Add(y);


            count++;   
        }

        for (int i=0; i< count;i++)
        {
            Console.WriteLine("{0} {1}", (Answers[2 * i]).ToString("F3"), (Answers[1 + (2 * i)]).ToString("F3"));

        }
    }
}