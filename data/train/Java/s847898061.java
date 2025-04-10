import java.util.*;                                                                 
public class Main{                                                               
  public static void main(String [] args){                                          
    Scanner sc = new Scanner(System.in);                                            
    int m_count = 10, ans_count = 3;                                                
    int[] m = new int[m_count];                                                     
    int i;                                                                          
    for(i = 0;i < m_count;i++){                                                     
      m[i] = sc.nextInt();                                                          
    }                                                                               
    Arrays.sort(m);
    int t = 0; 
    for (i = 0; i < m_count / 2; i++){
      t = m[i];
      m[i] = m[m_count - i - 1];
      m[m_count - i - 1] = t;
    }
    for(i = 0;i < ans_count;i++){
      System.out.println(m[i]);
    }
  }
}