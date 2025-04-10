extern crate core;

use std::fmt;
use std::cmp::{Ordering, min, max};
use std::fmt::{Display, Error, Formatter, Binary};
use std::f32::MAX;
use std::ops::{Add, Sub, Mul, Div, Neg, Index, IndexMut};
use std::collections::{BTreeMap, VecDeque, BinaryHeap, BTreeSet};

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
struct Real {
    vec: [bool;32]
}
impl Real {
    fn new(expression: &String) -> Real {
        let expression: Vec<_> = expression.chars().map(|c| {c.to_digit(16).unwrap() as i32 }).collect();
        let mut vec = [false; 32];
        for i in 0 .. 8 {
            for j in 0 .. 4 {
                vec[i * 4 + j] = (expression[i] & (1 << (3 - j as i32))) != 0;
            }
        }
        Real{vec: vec}
    }
    fn to_real_expression(&self) -> String {
        let mut vec = Vec::new();
        let mut value = 0;
        for i in 25 .. 32 {
            value *= 2;
            if self.vec[i] {
                value += 1;
            }
        }
        value *= 78125;
        let mut has_digit = false;
        for _ in 0 .. 7 {
            if has_digit || value % 10 != 0 {
                vec.push((value % 10).to_string());
                has_digit = true;
            }
            value /= 10;
        }
        if !has_digit {vec.push("0".to_string())};
        vec.push(".".to_string());
        value = 0;
        for i in 1 .. 25 {
            value *= 2;
            if self.vec[i] {
                value += 1;
            }
        }
        while value >= 10 {
            vec.push((value % 10).to_string());
            value /= 10;
        }
        vec.push(value.to_string());
        if self.vec[0] {
            vec.push("-".to_string());
        }
        vec.reverse();
        vec.concat()
    }
}
fn main() {
    let_all!(q: usize);
    for _ in 0 .. q {
        let string = read_line!().trim().to_string();
        println!("{}", Real::new(&string).to_real_expression());
    }
}
