using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Collections;
using System.Collections.Generic;
 
class Program
{
    static void Main()
    {
        string input;
        while((input = Console.ReadLine()) != null)
        {
            double[] nums = input.Split(' ')
                                .Select(val => double.Parse(val))
                                .ToArray();
            double x = 0.0, y = 0.0;
            if(nums[0] != 0 && nums[4] != 0)
            {
                double a0 = nums[0];
                for(int i = 0; i < 3; i++)
                {
                    nums[i] /= a0;
                }
                double d1 = nums[3];
                for (int i = 3; i < 6; i++)
                {
                    nums[i] -= d1 * nums[i - 3];
                }
                double e2 = nums[4];
                for (int i = 4; i < 6; i++)
                {
                    nums[i] /= e2;
                }
                y = nums[5];
                x = nums[2] - nums[1] * y;
                
            }
            else if(nums[0] == 0 && nums[1] != 0)
            {
                y = nums[2] / nums[1];
                x = (nums[5] - nums[3] * y) / nums[4];
            }
            else if(nums[3] != 0 && nums[4] == 0)
            {
                x = nums[5] / nums[3];
                y = (nums[2] - nums[0] * x) / nums[1];
            }
            else Console.WriteLine("unknown");
            x = Math.Round(1000.0 * x, MidpointRounding.AwayFromZero) / 1000.0;
            y = Math.Round(1000.0 * y, MidpointRounding.AwayFromZero) / 1000.0;
            Console.WriteLine("{0:F3} {1:F3}", x, y);
        }
    }
}