using System;
class _0003
{
    public static void Main()
    {
        int dataNum = int.Parse(Console.ReadLine());
        double[] a = new double[dataNum];
        double[] b = new double[dataNum];
        double[] c = new double[dataNum];
        char[] splitChar = { ' ' };
        for (int i = 0; i < dataNum; i++)
        {
            string[] nums = Console.ReadLine().Split(splitChar);
            a[i] = double.Parse(nums[0]);
            b[i] = double.Parse(nums[1]);
            c[i] = double.Parse(nums[2]);
        }
        for (int i = 0; i < dataNum; i++)
        {
            double angle_A = Math.Acos((Math.Pow(b[i], 2.0) + Math.Pow(c[i], 2.0) - Math.Pow(a[i], 2.0)) / (2 * b[i] * c[i])) * 180.0 / Math.PI;
            double angle_B = Math.Acos((Math.Pow(c[i], 2.0) + Math.Pow(a[i], 2.0) - Math.Pow(b[i], 2.0)) / (2 * c[i] * a[i])) * 180.0 / Math.PI;
            double angle_C = Math.Acos((Math.Pow(a[i], 2.0) + Math.Pow(b[i], 2.0) - Math.Pow(c[i], 2.0)) / (2 * a[i] * b[i])) * 180.0 / Math.PI;
            if (angle_A == 90.0 || angle_B == 90.0 || angle_C == 90.0)
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