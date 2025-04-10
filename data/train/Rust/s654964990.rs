extern crate core;

use std::fmt;
use std::cmp::{Ordering, min, max};
use std::fmt::{Display, Error, Formatter};
use std::collections::{VecDeque, BinaryHeap, BTreeMap};
use std::f32::MAX;

fn show<T: Display>(vec: &Vec<T>) {
    if vec.is_empty() {
        println!("[]");
    }else {
        print!("[{}", vec[0]);
        for i in 1 .. vec.len() {
            print!(", {}", vec[i]);
        }
        println!("]");
    }
}
macro_rules! read_line{
    () => {{
        let mut line = String::new();
        std::io::stdin().read_line(&mut line).ok();
        line
    }};
    (delimiter: ' ') => {
        read_line!().split_whitespace().map(|x|x.to_string()).collect::<Vec<_>>()
    };
    (delimiter: $p:expr) => {
        read_line!().split($p).map(|x|x.to_string()).collect::<Vec<_>>()
    };
    (' ') => {
        read_line!(delimiter: ' ')
    };
    ($delimiter:expr) => {
        read_line!(delimiter: $delimiter)
    };
    (' '; $ty:ty) => {
        read_line!().split_whitespace().map(|x|x.parse::<$ty>().ok().unwrap()).collect::<Vec<$ty>>()
    };
    ($delimiter:expr; $ty:ty) => {
        read_line!($delimiter).into_iter().map(|x|x.parse::<$ty>().ok().unwrap()).collect::<Vec<$ty>>()
    };
}
macro_rules! let_all {
    ($($n:ident:$t:ty),*) => {
        let line = read_line!(delimiter: ' ');
        let mut iter = line.iter();
        $(let $n:$t = iter.next().unwrap().parse().ok().unwrap();)*
    };
}
fn step(mut num: usize) -> usize {
    let mut digits = Vec::with_capacity(4);
    while num != 0 {
        digits.push(num % 10);
        num /= 10;
    }
    for _ in digits.len() .. 4 {
        digits.push(0);
    }
    digits.sort();
    let mut l = 0;
    let mut s = 0;
    for i in 0 .. 4 {
        l = l * 10 + digits[3 - i];
        s = s * 10 + digits[i];
    }
    l - s
}
fn solve(num: usize, memo: &mut Vec<i32>) -> i32 {
    match memo[num] {
        -1 => {
            let res = solve(step(num), memo) + 1;
            memo[num] = res;
            res
        }
        cache => cache
    }
}
fn main() {
    let mut memo = vec![-1; 10000];
    memo[6174] = 0;
    loop {
        let_all!(n: usize);
        if n == 0 {
            return
        }
        if step(n) == 0 {
            println!("NA");
        }else {
            println!("{}", solve(n, &mut memo));
        }
    }
}

