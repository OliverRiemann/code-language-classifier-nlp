import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;
import java.util.Set;

public class Main {
	public static void main(String[] args) {
		Map<Integer, Integer> heightsOfMountain = new HashMap<>();
		Scanner scanner = new Scanner(System.in);
		for(int i=1;i<=10;i++){
			int height = scanner.nextInt();
			heightsOfMountain.put(i, height);
		}
		
		Set<Entry<Integer, Integer>> set = heightsOfMountain.entrySet();
        List<Entry<Integer, Integer>> list = new ArrayList<Entry<Integer, Integer>>(set);
        Collections.sort( list, new Comparator<Map.Entry<Integer, Integer>>()
        {
        			@Override
			public int compare(Entry<Integer, Integer> o1, Entry<Integer, Integer> o2) {
				// TODO Auto-generated method stub
				 return (o2.getValue()).compareTo( o1.getValue() );
			}
        } );
        for(int i=0;i<3;i++){
        		Map.Entry<Integer, Integer> entry = list.get(i);
            System.out.println(entry.getValue());
        }
	}
}