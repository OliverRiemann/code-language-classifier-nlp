#ifdef _MSC_VER
#define _CRT_SECURE_NO_WARNINGS
#endif
#include<iostream>
#include<cstdio>
#include<algorithm>
#include<utility>
#include<set>
#include<map>
#include<queue>
#include<vector>
#include<string>
#include<cstring>
#include<unordered_map>
#include<cassert>
#include<cmath>

//code by cl3488

#define ri(X) scanf("%d", &(X))
#define rii(X, Y) scanf("%d%d", &(X), &(Y))
#define riii(X, Y, Z) scanf("%d%d%d", &(X), &(Y), &(Z))
#define dri(X) int (X); scanf("%d", &X)
#define drii(X, Y) int X, Y; scanf("%d%d", &X, &Y)
#define driii(X, Y, Z) int X, Y, Z; scanf("%d%d%d", &X, &Y, &Z)
#define pb push_back
#define mp make_pair
#define rep(i, s, t) for ( int i=(s) ; i <(t) ; i++)
#define fill(x, v) memset (x, v, sizeof(x))
#define why(d) cout << (d) << "!\n"
#define whisp(X, Y) cout << (X) << " " << (Y) << "#\n"
#define exclam cout << "!!\n"
typedef long long ll;
using namespace std;
typedef pair<int, int> pii;
const ll inf = (int)1e9 + 70;
const ll mod = 1e9 + 7;
const int maxn = 1e5 + 1000;

int main(){
	//if (fopen("input.txt", "r")) freopen("input.txt", "r", stdin);
	//dri(n);
	rep(i, 1, 10){
		rep(j, 1, 10){
			cout << i << "x" << j << "=" << i*j << "\n";
		}
	}
	return 0;
}