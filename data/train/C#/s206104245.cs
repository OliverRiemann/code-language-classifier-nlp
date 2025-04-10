using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Contest
{
    class Program
    {
        static int Main(string[] args)
        {
            new Program().Process();

            return 0;
        }

        private CommonInput cin;

        private void Process()
        {
            this.cin = new CommonInput();

            int a, b, c, d, e, f;
            double x, y;
            string s;

            while (true)
            {
                s = cin.GetLine();

                if (s == null)
                    break;

                a = int.Parse(s);
                b = cin.GetInt();
                c = cin.GetInt();
                d = cin.GetInt();
                e = cin.GetInt();
                f = cin.GetInt();

                x = (double)(c * e - f * b) / (a * e - d * b);
                y = (double)(c * d - f * a) / (b * d - e * a);

                Console.WriteLine("{0:0.000} {1:0.000}", x, y);
            }
        }
    }

    public class CommonInput
    {
        public CommonInput()
        {
            this._s = new string[0];
            this._i = 0;
        }

        private string[] _s;
        private int _i;
        private char[] _sep = { ' ' };

        public string GetLine()
        {
            if (this._i < this._s.Length)
                return this._s[this._i++];

            string line;
            this._i = 0;
            do
            {
                line = Console.ReadLine();
            } while (line == "");

            if (line == null)
                return null;

            this._s = line.Split(this._sep, StringSplitOptions.RemoveEmptyEntries);

            return this._s[this._i++];
        }

        public int GetInt()
        {
            return int.Parse(this.GetLine());
        }

        public long GetLong()
        {
            return long.Parse(this.GetLine());
        }

        public double GetDouble()
        {
            return double.Parse(this.GetLine());
        }
    }
}