import std.stdio,std.conv,std.string;

void main(){
    bool[9][9] m;
    foreach(y;0..8){
        foreach(x,c;readln.chomp){
            m[y*2][1+x*2]=c=='1';
        }
        foreach(x,c;readln.chomp){
            m[y*2+1][x*2]=c=='1';
        }
    }
    int x,y,dir=6;
    while(true){
        final switch(dir){
            case 2:
                if(x!=8&&m[y][x+1]){
                    x+=2;
                    dir=6;
                    dir.p;
                }else if(y!=8&&m[y+1][x]){
                    y+=2;
                    dir.p;
                }else{
                    dir=4;
                }
                break;
            case 4:
                if(y!=8&&m[y+1][x]){
                    y+=2;
                    dir=2;
                    dir.p;
                }else if(x!=0&&m[y][x-1]){
                    x-=2;
                    dir.p;
                }else{
                    dir=8;
                }
                break;
            case 6:
                if(y!=0&&m[y-1][x]){
                    y-=2;
                    dir=8;
                    dir.p;
                }else if(x!=8&&m[y][x+1]){
                    x+=2;
                    dir.p;
                }else{
                    dir=2;
                }
                break;
            case 8:
                if(x!=0&&m[y][x-1]){
                    x-=2;
                    dir=4;
                    dir.p;
                }else if(y!=0&&m[y-1][x]){
                    y-=2;
                    dir.p;
                }else{
                    dir=6;
                }
        }
        if(!x&&!y)break;
    }
    writeln;
}

void p(int dir){
    final switch(dir){
        case 2:'D'.write;break;
        case 4:'L'.write;break;
        case 6:'R'.write;break;
        case 8:'U'.write;break;
    }
}