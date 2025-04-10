using System.Collections;
using System;
using System.Collections.Generic;

public class Sample4{

	public static void Main(){

		string line;
		List <string> stringList = new List<string> ();

		do {

			line = Console.ReadLine ();

			if (line == null || !canDo(line)){
				break;
			}
			stringList.Add (line);

		} while (line != null);


		foreach (var s in stringList) {

			string[] tempStr = s.Split (' ');

			double x = getX (int.Parse (tempStr [0]),
				int.Parse (tempStr [1]),
				int.Parse (tempStr [2]),
				int.Parse (tempStr [3]),
				int.Parse (tempStr [4]),
				int.Parse (tempStr [5]));

			double y = getY (int.Parse(tempStr[0]),
				int.Parse(tempStr[1]),
				int.Parse(tempStr[2]),
				x);

			Console.WriteLine ("{0:f3} {1:f3}",x,y);
		}

	}

	public static double getX(int a, int b, int c, int d, int e, int f){

        double value1 = c*e - b*f;
        double value2 = a*e - d*b;
        
		double x = value1/value2;


		return Math.Round(x, 3, MidpointRounding.AwayFromZero);;
	}

	public static double getY (int a, int b, int c, double x){


		double y = (c - a * x) / b;
		return Math.Round(y, 3, MidpointRounding.AwayFromZero);;
	}

	public static bool canDo (string line){

		string[] tempStr = line.Split (' ');

			foreach (var t in tempStr) {

			if (int.Parse (t) < -1000 || int.Parse (t) > 1000) {
					return false;
				}

			}
		return true;
	}
}