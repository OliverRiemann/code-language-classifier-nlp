import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Stack;
import java.util.Scanner;
import java.util.Queue;

/**
 * @author yoshikyoto
 */



class Main{
	static final boolean DEBUG = false;
	static Scanner sc = new Scanner(new InputStreamReader(System.in));
	static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	
	public static void main(String args[]) throws Exception{
		int[] m = new int[10];
		for(int i = 0; i < 10; i++) m[i] = readInt();
		Arrays.sort(m);
		for(int i = 0; i < 3; i++) p(m[9-i]);
	}

	public static String readLine() throws IOException{return br.readLine();}
	public static int readInt(){return sc.nextInt();}
	public static void pa(Object[] arr){System.out.println(Arrays.toString(arr));}
	public static void pa(int[] arr){System.out.println(Arrays.toString(arr));}
	public static void pa(double[] arr){System.out.println(Arrays.toString(arr));}
	public static void pa(boolean[] arr){System.out.println(Arrays.toString(arr));}
	public static void p(Object o){System.out.println(o.toString());}
	public static void d(Object o){if(DEBUG)System.out.println(o.toString());}
	public static int[] parseInt(String[] arr){
		int[] res = new int[arr.length];
		for(int i = 0; i < arr.length; i++)res[i] = Integer.parseInt(arr[i]);
		return res;
	}
	public static int parseInt(Object o){return Integer.parseInt(o.toString());};
}

class MyHashMap<E> extends HashMap<E, Integer>{
	ArrayList<E> keyArray = new ArrayList<E>();
	public void add(E key){add(key, 1);}
	public void add(E key, Integer value){
		if(containsKey(key)){
			value += get(key);
		}else{
			keyArray.add(key);
		}
		put(key, value);
	}
}