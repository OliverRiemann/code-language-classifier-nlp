/** Micro Mezz Macro Flation -- Overheated Economy ., Last Update: Nov. 7th 2014 **/ //{

/** Header .. **/ //{
#pragma comment(linker, "/STACK:36777216")
//#pragma GCC optimize ("O2")
#define LOCAL
//#include "testlib.h"
#include <functional>
#include <algorithm>
#include <iostream>
#include <fstream>
#include <sstream>
#include <iomanip>
#include <numeric>
#include <cstring>
#include <climits>
#include <cassert>
#include <complex>
#include <cstdio>
#include <string>
#include <vector>
#include <bitset>
#include <queue>
#include <stack>
#include <cmath>
#include <ctime>
#include <list>
#include <set>
#include <map>

//#include <tr1/unordered_set>
//#include <tr1/unordered_map>
//#include <array>

using namespace std;

#define REP(i, n) for (int i=0;i<n;++i)
#define REP_1(i, n) for (int i=1;i<=n;++i)

#define REP_2_1(i, j, n, m) REP_1(i, n) REP_1(j, m)

const int N = int(1e3) + 9;

int main(){

#ifndef ONLINE_JUDGE
    freopen("in.txt", "r", stdin);
    //freopen("out.txt", "w", stdout);
#endif

    REP_2_1(i, j, 9, 9){
        printf("%dx%d=%d\n", i, j, i*j);
    }


}