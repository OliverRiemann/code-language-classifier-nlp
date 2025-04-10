fn solve() {
    loop {
        let n: usize = read();
        if n == 0 {
            break;
        }
        let a: Vec<i64> = (0..n).map(|_| read::<i64>()).collect();
        let mut s = a[0];
        let mut ans = s;
        for i in 1..n {
            s = max(s + a[i], a[i]);
            ans = max(ans, s);
        }
        println!("{}", ans);
    }
}

fn main() {
    let stack_size = 104_857_600;
    let thd = std::thread::Builder::new().stack_size(stack_size);
    thd.spawn(|| solve()).unwrap().join().unwrap();
}

// =========
#[allow(unused_imports)]
use std::cmp::{max, min};
#[allow(unused_imports)]
use std::collections::{BinaryHeap, HashMap, HashSet};
#[allow(unused_imports)]
use std::process::exit;

#[allow(dead_code)]
const MOD: usize = 1000000007;

fn read<T: std::str::FromStr>() -> T {
    use std::io::Read;
    let stdin = std::io::stdin();
    let stdin = stdin.lock();
    let token: String = stdin
        .bytes()
        .map(|c| c.expect("failed to read char") as char)
        .skip_while(|c| c.is_whitespace())
        .take_while(|c| !c.is_whitespace())
        .collect();
    token.parse().ok().expect("failed to parse token")
}

// =========

