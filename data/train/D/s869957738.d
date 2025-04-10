import std.stdio;
import std.array;
import std.conv;
import std.string;
import std.algorithm;


void main()
{
    while (true) {
        auto cards = readln.chomp.split(",").map!(to!int).array;
        
        if(!cards.length) break;
        cards.sort.hand.writeln;
    }
}


string hand(int[] cards){
    if(cards[0] == cards[1] && cards[1] == cards[2] && cards[2] == cards[3] ||
       cards[1] == cards[2] && cards[2] == cards[3] && cards[3] == cards[4]) {
        return "four card";
    }else if(cards[0] == cards[1] && cards[1] == cards[2] && cards[3] == cards[4] ||
             cards[0] == cards[1] && cards[2] == cards[3] && cards[3] == cards[4]){
        return "full house";
    }else if(cards[0] == 1 && cards[1] == 10 && cards[2] == 11 && cards[3] == 12 && cards[4] == 13 ||
             cards[1] == cards[0] + 1 && cards[2] == cards[0] + 2 && cards[3] == cards[0] + 3 && cards[4] == cards[0] + 4) {
        return "straight";
    }else if(cards[0] == cards[1] && cards[1] == cards[2] ||
             cards[1] == cards[2] && cards[2] == cards[3] ||
             cards[2] == cards[3] && cards[3] == cards[4]) {
        return "three card";
    }else if(cards[0] == cards[1] && cards[2] == cards[3] ||
             cards[0] == cards[1] && cards[3] == cards[4] ||
             cards[1] == cards[2] && cards[3] == cards[4]) {
        return "two pair";
    }else if(cards[0] == cards[1] ||
             cards[1] == cards[2] ||
             cards[2] == cards[3] ||
             cards[3] == cards[4]) {
        return "one pair";
    }else{
        return "null";
    }
}