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
use std::io::{stdin, stdout, BufWriter, Write};
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
macro_rules ! debug { ( $ ( $ a : expr ) ,* ) => { println ! ( concat ! ( $ ( stringify ! ( $ a ) , " = {:?}, " ) ,* ) , $ ( $ a ) ,* ) ; } }

fn search((from, to): (usize, usize), m: usize, s: &[Vec<usize>; 3]) -> Option<usize> {
    let mut s = s.to_vec();

    let x = s[from].pop().unwrap();
    s[to].push(x);
    let mut last = (from, to);

    'outer: for i in 1..m + 1 {
        if (s[0].is_empty() && s[1].is_empty()) || (s[1].is_empty() && s[2].is_empty()) {
            return Some(i);
        }

        for &(f, t) in &[(0, 1), (1, 2), (1, 0), (2, 1)] {
            if last != (t, f) && !s[f].is_empty()
                && s[t].last()
                    .map(|x| x < s[f].last().unwrap())
                    .unwrap_or(true)
            {
                let x = s[f].pop().unwrap();
                s[t].push(x);
                last = (f, t);
                continue 'outer;
            }
        }
    }
    None
}

#[allow(dead_code)]
fn main() {
    loop {
        let (n, m) = get!(usize, usize);

        if n == 0 && m == 0 {
            return;
        }

        let mut s1 = util::gets::<usize>();
        s1.remove(0);
        let mut s2 = util::gets::<usize>();
        s2.remove(0);
        let mut s3 = util::gets::<usize>();
        s3.remove(0);

        if s1.len() == n || s3.len() == n {
            println!("{}", 0);
            continue;
        }
        let s = [s1, s2, s3];

        let mut ans = None;

        for &(f, t) in &[(0, 1), (1, 2), (1, 0), (2, 1)] {
            if !s[f].is_empty()
                && s[t].last()
                    .map(|x| x < s[f].last().unwrap())
                    .unwrap_or(true)
            {
                if let Some(x) = search((f, t), m, &s) {
                    ans = Some(ans.map(|y| min(x, y)).unwrap_or(x));
                }
            }
        }

        if let Some(x) = ans {
            println!("{}", x);
        } else {
            println!("{}", -1);
        }
    }
}

