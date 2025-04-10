import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class Main {

	public static void main(String[] args) throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		try {
			String s;

			int input = Integer.parseInt(br.readLine());
			List<String> rightAngleList = new ArrayList<String>();

			for (int i = 1; i <= input; i++) {
				s = br.readLine();
				String[] num = s.split(" ");

				Integer[] side = convertArray(num);

				if (1 <= side[0] && side[0] <= 1000 && 1 <= side[1]
						&& side[1] <= 1000 && 1 <= side[2] && side[2] <= 1000) {

					Arrays.sort(side);

					if (side[2] * side[2] == side[1] * side[1] + side[0]
							* side[0]) {

						rightAngleList.add("YES");

					} else {
						rightAngleList.add("NO");
					}

				} else {
					break;
				}
			}

			String[] rightAngles = rightAngleList.toArray(new String[0]);

			for(String rightAngle : rightAngles){
				System.out.println(rightAngle);
			}


		} finally {
			br.close();
		}

	}

	public static Integer[] convertArray(String[] str) {

		List<Integer> list = new ArrayList<Integer>();

		for (String num : str) {

			list.add(Integer.parseInt(num));

		}

		return list.toArray(new Integer[0]);

	}

}