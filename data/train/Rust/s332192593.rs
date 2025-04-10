use std::io::*;
use std::str::FromStr;

//https://qiita.com/tubo28/items/e6076e9040da57368845
fn read<T: FromStr>() -> T {
    let stdin = stdin();
    let stdin = stdin.lock();
    let token: String = stdin
        .bytes()
        .map(|c| c.expect("failed to read char") as char)
        .skip_while(|c| c.is_whitespace())
        .take_while(|c| !c.is_whitespace())
        .collect();
    token.parse().ok().expect("failed to parse token")
}

fn main() {
    loop {
        let n: usize = read();
        let k: usize = read();
        if n == 0 && k == 0 {
            break;
        }
        let a: Vec<i64> = (0..n).map(|_| read()).collect();
        let mut s: Vec<i64> = vec![0; n + 1];

        //累積和 前処理
        for i in 0..n {
            s[i + 1] = s[i] + a[i];
        }

        //答えを求める
        let mut max = std::i64::MIN;
        for i in 0..n + 1 - k {
            max = std::cmp::max(s[i + k] - s[i], max);
        }

        println!("{}", max);
    }
}

