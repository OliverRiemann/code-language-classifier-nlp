#include <cstdio>
#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <string>
#include <cstring>
#include <sstream>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <iomanip>
#include <queue>
#include <stack>
#include <list>
#include <bitset>
#include <deque>
#include <cmath>
#include <iomanip>

using namespace std;

inline int toInt(string s) { int v; istringstream sin(s); sin >> v; return v; }
template<class T> inline string toString(T x) { ostringstream sout; sout << x; return sout.str(); }

#define FOR(i,a,b) for(int i=(a);i<(b);++i)
#define REP(i,n)  FOR(i,0,n)
#define CLR(a) memset((a), 0 ,sizeof(a))
#define MCLR(a) memset((a), -1 ,sizeof(a))
#define SZ(a) (sizeof(a))
#define FILL(a,v) fill((int*)a,(int*)(a+(SZ(a)/SZ(*(a)))),v)
#define SORT(c) sort((c).begin(),(c).end())

bool cheak(int x, int y, int xMax, int yMax)
{
	return x >= 0 && y >= 0 && xMax > x && yMax > y;
}
const int dx[4] = { -1, 0, 1, 0 }, dy[4] = { 0, 1, 0, -1 };
typedef pair<int, int> P;
typedef long long ll;
typedef unsigned long long ull;
const int INF    = 2147483647;
const ll  LLINF  = 9223372036854775807;
const ull ULLINF = 18446744073709551615;



int main()
{
	REP(i, 9)REP(j, 9)
	{
		cout << i + 1 << "x" << j + 1 << "=" << (i + 1)*(j + 1) << endl;
	}

	return 0;
}