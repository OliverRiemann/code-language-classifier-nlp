#[doc = " https://github.com/hatoo/competitive-rust-snippets"]
#[allow(unused_imports)]
use std::cmp::{max, min, Ordering};
#[allow(unused_imports)]
use std::collections::{BTreeMap, BTreeSet, BinaryHeap, HashMap, HashSet, VecDeque};
#[allow(unused_imports)]
use std::io::{stdin, stdout, BufWriter, Write};
#[allow(unused_imports)]
use std::iter::FromIterator;
mod util {
    use std::fmt::Debug;
    use std::io::{stdin, stdout, BufWriter, StdoutLock};
    use std::str::FromStr;
    #[allow(dead_code)]
    pub fn line() -> String {
        let mut line: String = String::new();
        stdin().read_line(&mut line).unwrap();
        line.trim().to_string()
    }
    #[allow(dead_code)]
    pub fn chars() -> Vec<char> {
        line().chars().collect()
    }
    #[allow(dead_code)]
    pub fn gets<T: FromStr>() -> Vec<T>
    where
        <T as FromStr>::Err: Debug,
    {
        let mut line: String = String::new();
        stdin().read_line(&mut line).unwrap();
        line.split_whitespace()
            .map(|t| t.parse().unwrap())
            .collect()
    }
    #[allow(dead_code)]
    pub fn with_bufwriter<F: FnOnce(BufWriter<StdoutLock>) -> ()>(f: F) {
        let out = stdout();
        let writer = BufWriter::new(out.lock());
        f(writer)
    }
}
#[allow(unused_macros)]
macro_rules ! get { ( $ t : ty ) => { { let mut line : String = String :: new ( ) ; stdin ( ) . read_line ( & mut line ) . unwrap ( ) ; line . trim ( ) . parse ::<$ t > ( ) . unwrap ( ) } } ; ( $ ( $ t : ty ) ,* ) => { { let mut line : String = String :: new ( ) ; stdin ( ) . read_line ( & mut line ) . unwrap ( ) ; let mut iter = line . split_whitespace ( ) ; ( $ ( iter . next ( ) . unwrap ( ) . parse ::<$ t > ( ) . unwrap ( ) , ) * ) } } ; ( $ t : ty ; $ n : expr ) => { ( 0 ..$ n ) . map ( | _ | get ! ( $ t ) ) . collect ::< Vec < _ >> ( ) } ; ( $ ( $ t : ty ) ,*; $ n : expr ) => { ( 0 ..$ n ) . map ( | _ | get ! ( $ ( $ t ) ,* ) ) . collect ::< Vec < _ >> ( ) } ; ( $ t : ty ;; ) => { { let mut line : String = String :: new ( ) ; stdin ( ) . read_line ( & mut line ) . unwrap ( ) ; line . split_whitespace ( ) . map ( | t | t . parse ::<$ t > ( ) . unwrap ( ) ) . collect ::< Vec < _ >> ( ) } } ; ( $ t : ty ;; $ n : expr ) => { ( 0 ..$ n ) . map ( | _ | get ! ( $ t ;; ) ) . collect ::< Vec < _ >> ( ) } ; }
#[allow(unused_macros)]
macro_rules ! debug { ( $ ( $ a : expr ) ,* ) => { eprintln ! ( concat ! ( $ ( stringify ! ( $ a ) , " = {:?}, " ) ,* ) , $ ( $ a ) ,* ) ; } }
const BIG_STACK_SIZE: bool = true;
#[allow(dead_code)]
fn main() {
    use std::thread;
    if BIG_STACK_SIZE {
        thread::Builder::new()
            .stack_size(32 * 1024 * 1024)
            .name("solve".into())
            .spawn(solve)
            .unwrap()
            .join()
            .unwrap();
    } else {
        solve();
    }
}

#[doc = " Equivalent to std::lowerbound and std::upperbound in c++"]
pub trait BinarySearch<T> {
    fn lower_bound(&self, &T) -> usize;
    fn upper_bound(&self, &T) -> usize;
}
impl<T: Ord> BinarySearch<T> for [T] {
    fn lower_bound(&self, x: &T) -> usize {
        let mut low = 0;
        let mut high = self.len();
        while low != high {
            let mid = (low + high) / 2;
            match self[mid].cmp(x) {
                Ordering::Less => {
                    low = mid + 1;
                }
                Ordering::Equal | Ordering::Greater => {
                    high = mid;
                }
            }
        }
        low
    }
    fn upper_bound(&self, x: &T) -> usize {
        let mut low = 0;
        let mut high = self.len();
        while low != high {
            let mid = (low + high) / 2;
            match self[mid].cmp(x) {
                Ordering::Less | Ordering::Equal => {
                    low = mid + 1;
                }
                Ordering::Greater => {
                    high = mid;
                }
            }
        }
        low
    }
}

fn f(xs: &[u64]) -> Vec<u64> {
    let mut res = xs.to_vec();
    res.push(0);

    for &x in xs {
        for &y in xs {
            res.push(x + y);
        }
    }
    res.sort();
    res.dedup();
    res
}

fn solve() {
    loop {
        let (n, m) = get!(usize, u64);
        if n == 0 && m == 0 {
            return;
        }
        let xs = get!(u64; n);

        let v = f(&xs);
        let mut ans = 0;
        for &x in &v {
            if x <= m {
                let i = v.upper_bound(&(m - x));
                ans = max(ans, x + v[i - 1]);
            }
        }
        println!("{}", ans);
    }
}

