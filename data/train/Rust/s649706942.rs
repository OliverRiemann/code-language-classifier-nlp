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
fn main() {
    loop {
        let_all!(n: usize);
        if n == 0 {
            return
        }
        let heights = read_line!(' '; i32);
        for i in 0 .. n + 1 {
            let mut vec = Vec::with_capacity(n);
            for j in 0 .. n + 1 {
                if i != j {
                    vec.push(heights[j]);
                }
            }
            let mut res = true;
            for j in 1 .. n - 1 {
                if vec[j] - vec[j - 1] != vec[j + 1] - vec[j] {
                    res = false;
                }
            }
            if res {
                println!("{}", heights[i]);
                break
            }
        }
    }
}

