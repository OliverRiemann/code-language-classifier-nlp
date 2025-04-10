extern crate core;

use std::fmt;
use std::i32::{MAX};
use std::cmp::{Ordering, min, max };
use std::ops::{Add, Sub, Mul, Div, Neg, Index, IndexMut, SubAssign, Range};
use std::collections::{BTreeMap, VecDeque, BinaryHeap, BTreeSet, HashMap};
use std::fmt::{Display, Formatter, Error};
use std::collections::hash_map::Values;

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
fn find_first_true<F>(mut from: usize, mut until: usize, predicate: F) -> usize where F: Fn(usize) -> bool {
    while from < until {
        let mid = (from + until) / 2;
        if predicate(mid){
            until = mid;
        }
        else {
            from = mid + 1;
        }
    }
    until
}
trait SortedVec<Value> {
    fn lower_bound(&self, value: Value) -> usize;
    fn upper_bound(&self, value: Value) -> usize;
}
impl <T> SortedVec<T> for Vec<T> where T: Ord {
    fn lower_bound(&self, value: T) -> usize {
        let mut left = 0;
        let mut right = self.len();
        while left < right {
            let mid = (left + right) / 2;
            if self[mid] < value {
                left = mid + 1;
            }else {
                right = mid;
            }
        }
        right
    }

    fn upper_bound(&self, value: T) -> usize {
        let mut left = 0;
        let mut right = self.len();
        while left < right {
            let mid = (left + right) / 2;
            if self[mid] <= value {
                left = mid + 1;
            }else {
                right = mid;
            }
        }
        right
    }
}
fn main(){
    loop {
        let_all!(m: usize, n: usize); if n == 0 {break}
        let books = read_lines!(n; usize);
        let mut width_sum = Vec::with_capacity(n + 1); width_sum.push(0usize);
        for b in books { width_sum.push(b) }
        for i in 1 .. width_sum.len() { width_sum[i] += width_sum[i - 1]; }
        let width_sum = width_sum;
        println!("{}", find_first_true(1, 1500000, |w| -> bool {
            let mut current = 0;
            for c in 0 .. m {
                current = width_sum.upper_bound(width_sum[current] + w) - 1;
            }
            return current == n;
        }))
    }
}
