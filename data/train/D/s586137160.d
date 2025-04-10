import std.stdio;
import std.string;
import std.conv;

void main() {
    
    string[][100] str;
    int line = 0;
    
    // input
    for(int i=0; ; ++i) {
        
        if(stdin.eof) {
            break;
        }
        
        str[i] = readln().split;
        
        ++line;
    }
    
    for(int i=0; i<line; ++i) {
        
        double[100] arr;
        int len;
        
        bool flag = false;
        
        for(int j=0; j<str[i].length; ++j) {
            
            try {
                
                arr[len] = to!int(str[i][j]);
                ++len;
                flag = true;
                
            } catch(Exception e) {
                
                final switch(str[i][j]) {
                    case "+":
                        arr[len-2] = arr[len-2] + arr[len-1];
                        break;
                       
                    case "-":
                        arr[len-2] = arr[len-2] - arr[len-1];                       
                        break;
                        
                    case "*":
                        arr[len-2] = arr[len-2] * arr[len-1];
                        break;
                      
                    case "/":
                        arr[len-2] = arr[len-2] / arr[len-1];
                        break;
                }
                
                len -= 1;
                
            }
            
        }
        
        if(flag)
            writefln("%.8f", arr[0]);
    }
    
}