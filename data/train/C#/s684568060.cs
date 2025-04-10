using System;
class Program{
    static void Main(){
        int how_many = int.Parse(Console.ReadLine());
        for(int i=0;i<how_many;i++){
            string str = Console.ReadLine();
            string[] stArray = str.Split(' ');
            int[] intArray = new int[3];
            int j, k;// This is count val for forloop.
            for(j=0;j<3;j++){
                intArray[j] = int.Parse(stArray[j]);
            }
            //sort three size of side.
            int tmp;
            for(j=0;j<3;j++){
                for(k=j+1;k<3;k++){
                    if(intArray[k] > intArray[j]){
                        tmp = intArray[k];
                        intArray[k] = intArray[j];
                        intArray[j] = tmp;
                    }
                }
                
            }
            if(intArray[0] * intArray[0]  == intArray[1] * intArray[1] + intArray[2] * intArray[2]){
                Console.WriteLine("YES");
            }else{
                Console.WriteLine("NO");
            }
        }

    }

}