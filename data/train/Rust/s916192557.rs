extern crate core;

use std::fmt;
use std::i32::{MAX};
use std::cmp::{Ordering, min, max };
use std::ops::{Add, Sub, Mul, Div, Neg, Index, IndexMut, SubAssign, Range};
use std::collections::{BTreeMap, VecDeque, BinaryHeap, BTreeSet, HashMap};
use std::fmt::{Display, Formatter, Error};
use std::str::Chars;

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
macro_rules! read_lines{
    ($count: expr; $delimiter: expr; $ty: ty) => {{
        let line_count = $count;
        let mut vec: Vec<Vec<$ty>> = Vec::with_capacity(line_count);
        for _ in 0 .. line_count {
            vec.push(read_line!($delimiter; $ty));
        }
        vec
    }};
    ($count: expr; $ty: ty) => {{
        let line_count = $count;
        let mut vec: Vec<$ty> = Vec::with_capacity(line_count);
        for _ in 0 .. line_count {
            vec.push(read_value!());
        }
        vec
    }}
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
fn main() {
    const max_card:usize = 300000;
    let_all!(n: usize, q: usize);
    let mut max_cards = vec![0; max_card + 1];
    for c in read_line!(' '; usize) {
        max_cards[c] = c;
    }
    for i in 1 .. max_cards.len() {
        max_cards[i] = max(max_cards[i], max_cards[i - 1]);
    }
    let max_cards = max_cards;
    for _ in 0 .. q {
        let_all!(m: usize);
        let mut max_rest = max_cards.last().unwrap() % m;
        let mut i = m - 1;
        while i < max_cards.len() {
            max_rest = max(max_rest, max_cards[i] % m);
            i += m;
        }
        print!("{}\n", max_rest);
    }
}

