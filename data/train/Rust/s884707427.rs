/**
*  _           _                 __                            _   _ _   _                                 _                    _                  _
* | |         | |               / /                           | | (_) | (_)                               | |                  (_)                | |
* | |__   __ _| |_ ___   ___   / /__ ___  _ __ ___  _ __   ___| |_ _| |_ ___   _____ ______ _ __ _   _ ___| |_ ______ ___ _ __  _ _ __  _ __   ___| |_ ___
* | '_ \ / _` | __/ _ \ / _ \ / / __/ _ \| '_ ` _ \| '_ \ / _ \ __| | __| \ \ / / _ \______| '__| | | / __| __|______/ __| '_ \| | '_ \| '_ \ / _ \ __/ __|
* | | | | (_| | || (_) | (_) / / (_| (_) | | | | | | |_) |  __/ |_| | |_| |\ V /  __/      | |  | |_| \__ \ |_       \__ \ | | | | |_) | |_) |  __/ |_\__ \
* |_| |_|\__,_|\__\___/ \___/_/ \___\___/|_| |_| |_| .__/ \___|\__|_|\__|_| \_/ \___|      |_|   \__,_|___/\__|      |___/_| |_|_| .__/| .__/ \___|\__|___/
*                                                  | |                                                                           | |   | |
*                                                  |_|                                                                           |_|   |_|
*
* https://github.com/hatoo/competitive-rust-snippets
*/
#[allow(unused_imports)]
use std::cmp::{max, min, Ordering};
#[allow(unused_imports)]
use std::collections::{BTreeMap, BTreeSet, BinaryHeap, HashMap, HashSet, VecDeque};
#[allow(unused_imports)]
use std::iter::FromIterator;
#[allow(unused_imports)]
use std::io::{stdin, stdout, BufWriter, Read, Write};
mod util {
    use std::io::{stdin, stdout, BufWriter, StdoutLock};
    use std::str::FromStr;
    use std::fmt::Debug;
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

#[derive(Eq, PartialEq, Clone, Debug)]
/// Equivalent to std::cmp::Reverse
pub struct Rev<T>(pub T);
impl<T: PartialOrd> PartialOrd for Rev<T> {
    fn partial_cmp(&self, other: &Rev<T>) -> Option<Ordering> {
        other.0.partial_cmp(&self.0)
    }
}
impl<T: Ord> Ord for Rev<T> {
    fn cmp(&self, other: &Rev<T>) -> Ordering {
        other.0.cmp(&self.0)
    }
}

#[allow(dead_code)]
pub const INF: u64 = 1 << 60;

fn solve() {
    let mut buf = String::new();
    stdin().read_to_string(&mut buf).unwrap();
    let mut iter = buf.split_whitespace();

    loop {
        let n: usize = iter.next().unwrap().parse().unwrap();
        let k: usize = iter.next().unwrap().parse().unwrap();

        if n == 0 && k == 0 {
            break;
        }

        let mut g = vec![HashMap::new(); n];

        for _ in 0..k {
            let t: usize = iter.next().unwrap().parse().unwrap();

            if t == 0 {
                let a: usize = iter.next().unwrap().parse().unwrap();
                let b: usize = iter.next().unwrap().parse().unwrap();

                let mut ds = vec![INF; n];

                let mut heap = BinaryHeap::new();
                heap.push(Rev((0, a - 1)));

                while let Some(Rev((c, i))) = heap.pop() {
                    if ds[i] > c {
                        ds[i] = c;

                        if i == b - 1 {
                            break;
                        }

                        for (&t, &d) in g[i].iter() {
                            if ds[t] > c + d {
                                heap.push(Rev((c + d, t)));
                            }
                        }
                    }
                }

                if ds[b - 1] == INF {
                    println!("-1");
                } else {
                    println!("{}", ds[b - 1]);
                }
            } else {
                let a: usize = iter.next().unwrap().parse().unwrap();
                let b: usize = iter.next().unwrap().parse().unwrap();
                let c: u64 = iter.next().unwrap().parse().unwrap();

                {
                    let x = g[a - 1].entry(b - 1).or_insert(c);
                    *x = min(*x, c);
                }

                {
                    let y = g[b - 1].entry(a - 1).or_insert(c);
                    *y = min(*y, c);
                }
            }
        }
    }
}

