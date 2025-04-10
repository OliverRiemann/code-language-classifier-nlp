using System;

namespace V0003{
    public class Program{
        public static void Main(string[] args){
            var sr = new StreamReader();
            //---------------------------------
            foreach(var tri in sr.Next<int>(sr.Next<int>(), 3)){
                Array.Sort(tri);
                var ans = tri[0] * tri[0] + tri[1] * tri[1] == tri[2] * tri[2];
                Console.WriteLine(ans ? "YES" : "NO");
            }
            //---------------------------------
        }
    }

    public class StreamReader{
        private readonly char[] _c = {' '};
        private int _index = -1;
        private string[] _input = new string[0];

        public T Next<T>(){
            if(_index == _input.Length - 1){
                _index = -1;
                while(true){
                    string rl = Console.ReadLine();
                    if(rl == null){
                        if(typeof(T).IsClass) return default(T);
                        return (T)typeof(T).GetField("MinValue").GetValue(null);
                    }
                    if(rl != ""){
                        _input = rl.Split(_c, StringSplitOptions.RemoveEmptyEntries);
                        break;
                    }
                }
            }
            return (T)Convert.ChangeType(_input[++_index], typeof(T), System.Globalization.CultureInfo.InvariantCulture);
        }

        public T[][] Next<T>(int y, int x){
            var result = new T[y][];
            for(var i = 0; i < y; ++i){
                result[i] = new T[x];
                for(var j = 0; j < x; ++j){
                    result[i][j] = Next<T>();
                }
            }
            return result;
        }
    }
}