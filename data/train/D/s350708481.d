import std.stdio, std.array, std.conv, std.string;

void main()
{
	string[] input;
	solve: while(!stdin.eof()) {
		input = readln.split(",");
		if(input.length != 8) return;
		auto inx = new double[](4);
		auto iny = new double[](4);
		for(int i = 0; i < 4; i++)
		{
			inx[i] = input[2 * i].chomp.to!double;
			iny[i] = input[2 * i + 1].chomp.to!double;
		}
		for(int xi = 0; xi < 4; xi++)
		{
			double[] x;
			double[] y;
			double xp, yp;
			for(int i = 0; i < 4; i++)
			{
				if(i == xi)
				{
					xp = inx[i];
					yp = iny[i];
					continue;
				}
					
				x ~= inx[i];
				y ~= iny[i];
			}
			bool l;
			bool r;
			l = r = false;
		
			x ~= x[0];
			y ~= y[0];
		
			bool isConvex = false;
			for(int i = 0; i < 3; i++) {
				double ax = x[i+1] - x[i];
				double ay = y[i+1] - y[i];
				double px = xp - x[i];
				double py = yp - y[i];
				if(ax*py - ay*px < 0)
					r = true;
				else
					l = true;
			}
			if(l != r)
			{
				"NO".writeln;
				continue solve;
			}
				
		}
		"YES".writeln;
		
    }
}