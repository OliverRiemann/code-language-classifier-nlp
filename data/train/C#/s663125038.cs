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

            int N, count;
            List<int> l = new List<int>();

            N = cin.GetInt();
            count = 0;

            while (count < N)
            {
                l.Clear();

                for (int i = 0; i < 3; i++)
                    l.Add(cin.GetInt());

                l = l.OrderByDescending(x => x).ToList();

                Console.WriteLine("{0}", l[0] * l[0] == l[1] * l[1] + l[2] * l[2] ? "YES" : "NO");

                count++;
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