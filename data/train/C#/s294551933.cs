using System;
using System.Collections;
using System.Collections.Generic;

public class Example3
{
	public static void Main ()
	{
		int count = int.Parse( Console.ReadLine ());
		List <string> triangleParameterList = new List<string> ();

		for (int i = 0; i < count; i++) {

			string tempStr = Console.ReadLine ();
			triangleParameterList.Add (tempStr);
		}

		foreach (var t in triangleParameterList) {

			string[] triangleParameterStr = t.Split (' ');
			int[] triangleParameter = new int[3];

			for (int j = 0; j < 3; j++){
				triangleParameter [j] = int.Parse( triangleParameterStr [j]);
			}

			if (isTriangle (triangleParameter)) {
				Console.WriteLine ("YES");
			} else {
				Console.WriteLine ("NO");
			}

		}

	}

	public static bool isTriangle(int[] triangleParameter){



		Array.Sort (triangleParameter);

		int result1 = triangleParameter[0]*triangleParameter[0] + triangleParameter[1]*triangleParameter[1];
		int result2 = triangleParameter [2] * triangleParameter [2];
		           
		if (result1 == result2) {
			return true;
		} else {
			return false;
		}

	}
}