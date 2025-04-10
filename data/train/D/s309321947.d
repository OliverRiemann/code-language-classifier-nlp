import std.cstream;
import std.stdio;
import std.string;
import std.algorithm;
 
void main(){
 
string inc=readln();
/+inc = chomp(inc);/+ /+改/+行+/を/+と+/る+/ +/ +/
 
int[string] mostLongestHash;
int[string] frequent;
int first,ansLength,ansFrequent;
 
 
  for(int i/+ use 0 as default +/;i<inc.length;i++){
    if(inc[i] == ' ' || i == inc.length-1){
     mostLongestHash[inc[first..i]]=cast(int)inc[first..i].length;
     ansLength = max(cast(int)inc[first..i].length,ansLength);
     ansFrequent = max(++frequent[inc[first..i]],ansFrequent);
    /+
     writeln(inc[first..i]);
     writeln(mostLongestHash[inc[first..i]]);
     writeln(frequent[inc[first..i]]);
     writeln(ansLength);
     writeln(ansFrequent);
    +/
     first=i+1;
    }
  }
 
  //writeln(mostLongestHash.values);
 
first=0;
  for(int i=0;i<inc.length;i++){
    if(inc[i] == ' ' || i == inc.length-1){
      if(frequent[inc[first..i]] == ansFrequent){
      write(inc[first..i]);
      write(" ");
      break;
      }
      first=i+1;
    }
  }
 
first=0;
  for(int i=0;i<inc.length;i++){
    if(inc[i] == ' ' || i == inc.length-1){
      if(mostLongestHash[inc[first..i]] == ansLength){
      writeln(inc[first..i]);
      break;
      }
      first=i+1;
    }
  }
 
 
 
}