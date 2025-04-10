
import std.stdio;
import std.typecons;
import std.algorithm;
import std.conv;
import std.math;
import std.string;
import std.array;

// 最大抱合を求める問題
// グラハムスキャンを用いて解く
// アルゴリズム: http://en.wikipedia.org/wiki/Graham_scan

struct Point {
  double x, y;
  double dot(Point a) {return x * a.x + y * a.y;}
  double cross(Point a) {return x * a.y - y * a.x;}
  Point opBinary(string s)(Point p) if (s == "+") {p.x += x; p.y += y; return p;}
  Point opBinary(string s)(Point p) if (s == "-") {
    p.x = x - p.x;
    p.y = y - p.y;
    return p;
  }
}

// CCW, 3 点の外積を求める
// X1 x X2 == 0  ... X1, X2 は並行
// X1 x X2 > 0   ... X1, X2 は反時計周り
// X1 x X2 < 0   ... X1, X2 は時計周り
// (-1) * (BA x BC) = (-1) * (X1 - X2) x (X3 - X2)

// ccw > 0 ... 時計周り, ccw < 0 反時計周り
double ccw(Point p1, Point p2, Point p3) {
  return - (p1.x - p2.x) * (p3.y - p1.y) + (p1.y - p2.y) * (p3.x - p1.x);
}

// 最大抱合を求める
Point[] max_convex_full(Point[] points) {
  Point[] res = new Point[](points.length * 2);
  sort!((a, b) {
      if (a.x != b.x)  return a.x < b.x;
      return a.y < b.y;
    })(points);
  uint k = 0;
  // 下部の凸部
  for(int i = 0; i < points.length; i++) {
    while(k >= 2 && ccw(res[k - 2], res[k - 1], points[i]) <= 0) k--;
    res[k++] = points[i];
  }
  // 上部の凸部
  for(int i = cast(int)points.length - 2, t = k + 1; i >= 0; i--) {
    while(k >= t && ccw(res[k - 2], res[k - 1], points[i]) <= 0) k--;
    res[k++] = points[i];
  }
  res.length = k - 1;
  return res;
}

void main() {
  while(true) {
    int n = readln.chomp.to!(int);
    if (n == 0) break;
    Point[] points;
    foreach(t; 0..n) {
      auto line = readln.chomp.split(",").map!(to!(double)).array;
      points ~= Point(line[0], line[1]);
    }
    (points.length - points.max_convex_full.length).writeln;
  }
}