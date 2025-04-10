// template {{{
#include <bits/stdc++.h>
using namespace std;

// #define int long long

#define GET_MACRO(a, b, c, d, NAME, ...) NAME
#define REP2(i, n) REP3(i, 0, n)
#define REP3(i, a, b) REP4(i, a, b, 1)
#define REP4(i, a, b, s) for (ll i = (a); i < (ll)(b); i += s)
#define RREP2(i, n) RREP3(i, 0, n)
#define RREP3(i, a, b) for (ll i = (b) - 1; i >= (ll)(a); i--)

#define rep(...) GET_MACRO(__VA_ARGS__, REP4, REP3, REP2)(__VA_ARGS__)
#define rrep(...) GET_MACRO(__VA_ARGS__,, RREP3, RREP2)(__VA_ARGS__)
#define eb emplace_back
#define ef emplace_front
#define pb pop_back
#define pf pop_front
#define all(c) begin(c), end(c)
#define mp make_pair
#define mt make_tuple
#define fi first
#define se second
#define popcnt __builtin_popcountll

#ifdef DEBUG
	#define dump(x) cerr << #x " = " << x << endl;
#else
	#define dump(x)
#endif

using uint = unsigned;
using ll = long long;
using ull = unsigned long long;
using ld = long double;
using vi = vector<int>;
using vvi = vector<vi>;

template<typename T>
using maxheap = priority_queue<T, vector<T>, less<T>>;

template<typename T>
using minheap = priority_queue<T, vector<T>, greater<T>>;

const int INF = 1e9 + 10;
const ll LLINF = 1e18 + 10;

const int dx[] = {-1, 0, 1, 0, -1, 1, 1, -1};
const int dy[] = {0, -1, 0, 1, -1, -1, 1, 1};

template<typename T>
inline T sq(T x){
	return x * x;
}

template<typename T, typename U>
inline bool chmax(T &x, U y){
	if (x >= y) return false;
	x = y;
	return true;
}

template<typename T, typename U>
inline bool chmin(T &x, U y){
	if (x <= y) return false;
	x = y;
	return true;
}

template<typename T>
inline T& sort(T &c){
	sort(all(c));
	return c;
}

template<typename T>
inline T& reverse(T &c){
	reverse(all(c));
	return c;
}

template<typename T>
inline T& unique(T &c){
	sort(all(c));
	c.erase(unique(all(c)), end(c));
	return c;
}

template<typename T>
inline T sorted(const T &c){
	T d = c;
	return move(sort(d));
}

template<typename T>
inline T reversed(const T &c){
	T d = c;
	return move(reverse(d));
}

template<typename T>
inline T uniqued(const T &c){
	T d = c;
	return move(unique(d));
}

ll modpow(ll x, ll e, ll mod = 1000000007){
	ll res = 1;
	e %= mod - 1;
	while (e){
		if (e & 1) res = res * x;
		x = x * x;
		e >>= 1;
	}
	return res;
}

inline ll in(){
	ll x;
	scanf("%lld", &x);
	return x;
}

inline double inD(){
	double x;
	scanf("%lf", &x);
	return x;
}

inline string inS(){
	static char s[1 << 20];
	scanf("%s", s);
	return s;
}

pair<ll, ll> rot45(ll x, ll y){
	return mp(x + y, x - y);
}

pair<ll, ll> rot45inv(ll u, ll v){
	return mp((u + v) / 2, (u - v) / 2);
}

template<typename T, size_t N>
struct print_tuple {
	static void print(const T &t, ostream &os){
		print_tuple<T, N - 1>::print(t, os);
		os << " " << get<N - 1>(t);
	}
};

template<typename T>
struct print_tuple<T, 1> {
	static void print(const T &t, ostream &os){
		os << get<0>(t);
	}
};

template<typename ...Args>
ostream& operator<<(ostream &os, const tuple<Args...> &t){
	print_tuple<tuple<Args...>, tuple_size<tuple<Args...>>::value>::print(t, os);
}
// }}}
// modint {{{
#include <string>
#include <cstdint>

template<unsigned MOD>
struct ModInt {
	static const unsigned Mod = MOD;

	ModInt(): v(0){}
	ModInt(long long x, bool need_mod = true): v(x){
		if (need_mod){
			if ((v = x % MOD + MOD) >= MOD) v -= MOD;
		}
	}
	ModInt(const std::string &s){
		bool neg = false;
		auto it = begin(s);
		if (*it == '-'){
			neg = true;
			++it;
		}
		v = 0;
		while (it != end(s)){
			v = (v * 10 + (*it++ - '0')) % MOD;
		}
		if (neg && v) v = MOD - v;
	}
	
	operator unsigned() const {
		return v;
	}

	ModInt operator+() const {
		return *this;
	}

	ModInt operator-() const {
		ModInt res = *this;
		if (res.v > 0) res.v = MOD - res.v;
		return res;
	}

	ModInt& operator+=(const ModInt &r){
		if ((v += r.v) >= MOD) v -= MOD;
		return *this;
	}

	ModInt& operator-=(const ModInt &r){
		if ((v += MOD - r.v) >= MOD) v -= MOD;
		return *this;
	}

	ModInt& operator*=(const ModInt &r){
		v = (unsigned long long)v * r.v % MOD;
		return *this;
	}

	ModInt& operator/=(const ModInt &r){
		v = (unsigned long long)v * r.inv() % MOD;
		return *this;
	}

	ModInt operator+(const ModInt &r) const {
		return ModInt(*this) += r;
	}

	ModInt operator-(const ModInt &r) const {
		return ModInt(*this) -= r;
	}

	ModInt operator*(const ModInt &r) const {
		return ModInt(*this) *= r;
	}

	ModInt operator/(const ModInt &r) const {
		return ModInt(*this) /= r;
	}
	
	ModInt pow(long long e) const {
		if ((e = e % (MOD - 1) + (MOD - 1)) >= (MOD - 1)) e -= MOD - 1;
		ModInt res = 1, x = *this;
		while (e > 0){
			if (e & 1) res *= x;
			x *= x;
			e >>= 1;
		}
		return res;
	}

	ModInt inv() const {
		return pow(MOD - 2);
	}

private:
	std::uint32_t v;
};

using mint = ModInt<1000000007>;
// }}}
// modint_precalc (modint ??? include ??????) {{{
namespace mod {
	const int Mod = mint::Mod;
	const int N = 5000000;
	mint inv[N + 10];
	mint fact[N + 10];
	mint factinv[N + 10];
	
	mint C(int n, int k){
		if (k < 0 || n < k) return 0;
		return fact[n] * factinv[k] * factinv[n - k];
	}

	struct prepare {
		prepare(){
			inv[1] = 1;
			for (int i = 2; i <= N; i++){
				inv[i] = -(inv[Mod % i] * mint(Mod / i, false));
			}
			
			fact[0] = factinv[0] = 1;
			for (int i = 1; i <= N; i++){
				fact[i] = fact[i - 1] * mint(i);
				factinv[i] = factinv[i - 1] * inv[i];
			}
		}
	} prepare_;
}
// }}}

int main()
{
	rep(i, 1, 10) rep(j, 1, 10){
		printf("%dx%d=%d\n", i, j, i * j);
	}
}