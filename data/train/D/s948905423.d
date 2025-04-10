import std.stdio;
import std.string;

/+
const int LEFT  = 0;
const int RIGHT = 1;
const int UP    = 2;
const int DOWN  = 3;
+/
enum {
    LEFT,
    RIGHT,
    UP,
    DOWN
}


void main()
{
    string[9] kabe;
    int x, y;
    int direction;

    foreach (i; 0..9) {
        kabe[i] = readln().chomp;
        kabe[i].length = 18;
    }
    x = 0;
    y = 0;
    direction = RIGHT;
    move(&x, &y, direction);
    while (x != 0 || y != 0) {
        if (isKabe(kabe, x, y, getLeft(direction)))
            direction = getLeft(direction);
        else if (isKabe(kabe, x, y, direction))
            {}
        else if (isKabe(kabe, x, y, getRight(direction)))
            direction = getRight(direction);
        else
            direction = getRight(getRight(direction));
        move(&x, &y, direction);
    }
    writeln();
}


bool isKabe(string[9] kabe, int x, int y, int dir)
{
    final switch (dir) {
    case LEFT:
        if (x <= 0) return false;
        return (kabe[y*2][x-1] == '1');
        break;
    case RIGHT:
        if (x >= 4) return false;
        return (kabe[y*2][x] == '1');
        break;
    case UP:
        if (y <= 0) return false;
        return (kabe[y*2-1][x] == '1');
        break;
    case DOWN:
        if (y >= 4) return false;
        return (kabe[y*2+1][x] == '1');
        break;
    }
    return false;
}


int getLeft(int dir)
{
    final switch (dir) {
    case LEFT: return DOWN; break;
    case RIGHT: return UP; break;
    case UP: return LEFT; break;
    case DOWN: return RIGHT; break;
    }
    return 0;
}


int getRight(int dir)
{
    final switch (dir) {
    case LEFT: return UP; break;
    case RIGHT: return DOWN; break;
    case UP: return RIGHT; break;
    case DOWN: return LEFT; break;
    }
    return 0;
}

void move(int* x, int* y, int dir)
{
    final switch (dir) {
    case LEFT:
        (*x)--;
        write("L");
        break;
    case RIGHT:
        (*x)++;
        write("R");
        break;
    case UP:
        (*y)--;
        write("U");
        break;
    case DOWN:
        (*y)++;
        write("D");
        break;
    }
}