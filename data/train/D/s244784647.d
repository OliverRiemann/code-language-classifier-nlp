import std.stdio;
import std.conv;
import std.cstream;
import std.string;
import std.algorithm;

int Map[20][20];
int ms,wp;

int[] dx3 = [0,1,2,1,1,0,0,0,0,-1,-2,-1,-1];
int[] dy3 = [0,0,0,-1,1,-1,-2,1,2,0,0,1,-1];

int[] dx2 = [0,-1,-1,0,1,1,1,0,-1];
int[] dy2 = [0,0,-1,-1,-1,0,1,1,1];

int[] dx = [0,0,1,0,-1];
int[] dy = [0,1,0,-1,0];


void main(){
int x,y,size;
for(int i;i<20;i++)for(int j;j<20;j++)Map[i][j]=0;
wp = 100;


while(scanf("%d,%d,%d",&x,&y,&size) != EOF)transaction(x,y,size);
printf("%d\n%d\n",wp,ms);

}

void transaction(int x,int y,int size){
if(size == 3){
  for(int i;i<dx3.length;i++){
    if(0<=y+dy3[i] && y+dy3[i]<10 && 0<=x+dx3[i] && x+dx3[i] < 10){
      if(Map[y+dy3[i]][x+dx3[i]] == 0)wp--;
      Map[y+dy3[i]][x+dx3[i]]+=1;
      if(ms < Map[y+dy3[i]][x+dx3[i]])ms = Map[y+dy3[i]][x+dx3[i]];
    }
  }
}
else if(size == 2){
  for(int i;i<dx2.length;i++){
    if(0<=y+dy2[i] && y+dy2[i]<10 && 0<=x+dx2[i] && x+dx2[i] < 10){
      if(Map[y+dy2[i]][x+dx2[i]] == 0)wp--;
      Map[y+dy2[i]][x+dx2[i]]+=1;
      if(ms < Map[y+dy2[i]][x+dx2[i]])ms = Map[y+dy2[i]][x+dx2[i]];
    }
  }
}else{
  for(int i;i<dx.length;i++){
    if(0<=y+dy[i] && y+dy[i]<10 && 0<=x+dx[i] && x+dx[i] < 10){
      if(Map[y+dy[i]][x+dx[i]] == 0)wp--;
      Map[y+dy[i]][x+dx[i]]+=1;
      if(ms < Map[y+dy[i]][x+dx[i]])ms = Map[y+dy[i]][x+dx[i]];
    }
  }
}
}