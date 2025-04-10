extern crate core;

use std::fmt;
use std::cmp::{Ordering, min, max};
use std::f32::MAX;
use std::ops::{Add, Sub, Mul, Div, Neg, Index, IndexMut, SubAssign, Range};
use std::collections::{BTreeMap, VecDeque, BinaryHeap, BTreeSet, HashMap};
use std::fmt::Display;

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
fn show2<T: Display>(vec: &Vec<Vec<T>>) {
    if vec.is_empty() {
        println!("[]");
    }else {
        for l in vec {
            show(l);
        }
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
macro_rules! read_value{
    () => {
        read_line!().trim().parse().ok().unwrap()
    }
}
macro_rules! let_all {
    ($($n:ident:$t:ty),*) => {
        let line = read_line!(delimiter: ' ');
        let mut iter = line.iter();
        $(let $n:$t = iter.next().unwrap().parse().ok().unwrap();)*
    };
}

macro_rules! let_mut_all {
    ($($n:ident:$t:ty),*) => {
        let line = read_line!(delimiter: ' ');
        let mut iter = line.iter();
        $(let mut $n:$t = iter.next().unwrap().parse().ok().unwrap();)*
    };
}
fn count_step(a: i32, b: i32) -> i32 {
    if b == 0 {
        0
    }else if a >= b {
        1 + count_step(b, a % b)
    }else {
        count_step(b, a)
    }
}
fn gcd(a: i32, b: i32) -> i32 {
    if b == 0 {
        a
    }else {
        gcd(b, a % b)
    }
}
fn main() {
    loop {
        let_all!(a: i32, b: i32);
        if a == 0 && b == 0 {
            return
        }
        println!("{} {}", gcd(a, b), count_step(a, b));
    }
}

