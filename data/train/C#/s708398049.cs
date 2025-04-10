using System;

namespace _0004 {

	public static class Program {

		public static void Main() {
			string input;
			while (!string.IsNullOrEmpty(input = Console.ReadLine())) {
				var splitStr = input.Split(' ');
				var a = int.Parse(splitStr[0]);
				var b = int.Parse(splitStr[1]);
				var c = int.Parse(splitStr[2]);
				var d = int.Parse(splitStr[3]);
				var e = int.Parse(splitStr[4]);
				var f = int.Parse(splitStr[5]);

				if (a != 0 && d != 0) {
					var adLcm = LCM(a, d);
					var beDiff = b * (adLcm / a) - e * (adLcm / d);
					var cfDiff = c * (adLcm / a) - f * (adLcm / d);

					var y = ((double) cfDiff) / beDiff;
					var x = (c - (b * y)) / a;
					Console.WriteLine("{0:f3} {1:f3}", x, y);
				} else if (a == 0) {
					var y = ((double) c) / b;
					var x = (f - (e * y)) / d;
					Console.WriteLine("{0:f3} {1:f3}", x, y);
				} else {
					var y = ((double) f) / e;
					var x = (c - (b * y)) / a;
					Console.WriteLine("{0:f3} {1:f3}", x, y);
				}
			}
		}

		private static int LCM(int m, int n) {
			return m * n / GCD(m, n);
		}

		private static int GCD(int m, int n) {
			m = Math.Abs(m);
			n = Math.Abs(n);

			if (m < n) {
				return GCD(n, m);
			}
			return n == 0 ? m : GCD(n, m % n);
		}

	}

}