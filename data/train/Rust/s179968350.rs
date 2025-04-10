extern crate core;

use std::fmt;
use std::cmp::{Ordering, min, max};
use std::fmt::{Display, Error, Formatter};
use std::collections::{VecDeque, BinaryHeap, BTreeMap};
use std::f32::MAX;
use std::ops::{Add, Sub};

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

fn main() {
    loop {
        let_all!(n: usize);
        if n == 0 {
            return
        }
        let_all!(y: f64);
        let mut max_rate = 0_f64;
        let mut max_bank = 0;
        for _ in 0..n {
            let_all!(b: usize, r: f64, t: usize);
            let rate = match t {
                1 => {
                    (1_f64 + y * r / 100_f64).log10()
                }
                2 => {
                    (1_f64 + r / 100_f64).log10() * y
                }
                _ => unreachable!()
            };
            if max_rate < rate {
                max_bank = b;
                max_rate = rate;
            }
        }
        println!("{}", max_bank);
    }
}
