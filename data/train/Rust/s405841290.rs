#![allow(unused_imports, unused_variables, dead_code, non_snake_case, unused_macros)]
use std::io::{stdin, Read, StdinLock};
use std::str::FromStr;
use std::fmt::*;
use std::str::*;
use std::cmp::*;
use std::collections::*;

fn getline() -> String{
    let mut res = String::new();
    std::io::stdin().read_line(&mut res).ok();
    res
}

macro_rules! readl {
    ($t: ty) => {
        {
            let s = getline();
            s.trim().parse::<$t>().unwrap()
        }
    };
    ($( $t: ty),+ ) => {
        {
            let s = getline();
            let mut iter = s.trim().split(' ');
            ($(iter.next().unwrap().parse::<$t>().unwrap(),)*) 
        }
    };
}

macro_rules! readlvec {
    ($t: ty) => {
        {
            let s = getline();
            let iter = s.trim().split(' ');
            iter.map(|x| x.parse().unwrap()).collect::<Vec<$t>>()
        }
    }
}

macro_rules! mvec {
    ($v: expr, $s: expr) => {
        vec![$v; $s]
    };
    ($v: expr, $s: expr, $($t: expr),*) => {
        vec![mvec!($v, $($t),*); $s]
    };
}

macro_rules! debug {
    ($x: expr) => {
        println!("{}: {:?}", stringify!($x), $x)
    }
}

fn printiter<'a, T>(v: &'a T)
where
    &'a T: std::iter::IntoIterator, 
    <&'a T as std::iter::IntoIterator>::Item: std::fmt::Display {
    for (i,e) in v.into_iter().enumerate() {
        if i != 0 {
            print!(" ");
        }
        print!("{}", e);
    }
    println!("");
}

struct ContestPrinter {
    s: String,
}

impl ContestPrinter {
    fn new() -> ContestPrinter {
        ContestPrinter {
        s: String::new(),
        }
    }

    fn print<T>(&mut self, x: T)
        where T: std::fmt::Display {
        self.s.push_str(format!("{}", x).as_str());
    }

    fn println<T>(&mut self, x: T)
        where T: std::fmt::Display {
        self.s.push_str(format!("{}\n", x).as_str());
    }
}

impl std::ops::Drop for ContestPrinter {
    fn drop(&mut self) {
        print!("{}", self.s);
    }
}

fn is_max_i64(num: i64) -> bool { if num == i64::max_value() { true } else { false } }

fn is_prime(n: i64) -> bool {
    let mut i = 2;
    loop {
        if (n % i) == 0 {return false; }
        i += 1;
        if (i*i) > n { break; }
    }
    return true;
}

// 指定した数までの素数のvec エラトステネスの篩
fn prime_list(n: usize) -> Vec<usize> {
    let mut ret: Vec<usize> = Vec::new();
    let num = n - 1;
    let mut table: Vec<bool> = vec![false; num];
    for i in 0..num {
        if !table[i] {
            let next = i + 2;
            ret.push(next);
            let mut j = i + next;
            while j < num {
                table[j] = true;
                j += next;
            }
        }
    }
    ret
} // [2, 3, 5, 7, ..., n]

// 素因数分解
fn prime_factorization(n: usize) -> Vec<(usize, usize)> {
    let mut ret: Vec<(usize, usize)> = Vec::new();
    let pl = prime_list((n as f64).sqrt() as usize + 1);
    let mut num = n;
    for p in pl { // 各素数で割れるだけ割る
        let mut cnt = 0;
        while (num % p) == 0 {
            num /= p;
            cnt += 1;
        }
        if cnt > 0 { ret.push((p, cnt)); }
    }
    if ret.is_empty() { vec![(n, 1); 1] }
    else { ret }
} // n = 2*2*2 + 3 -> [(2, 3), (3, 1)]

fn main() {
    let cin = stdin();
    let cin = cin.lock();
    let mut sc = Scanner::new(cin);
    
    let size = 999999;
    let ps = prime_list(size);
    let mut num: Vec<usize> = vec![0; size+1];
    let mut idx: usize = 0;
    
    for i in 2..size+1 {
        num[i] = num[i-1];
        if idx >= ps.len() { continue; }
        if ps[idx] == i {
            num[i] += 1;
            idx += 1;
        }
    }

    let mut input: Option<usize> = sc.read1();
    while let Some(n) = input {
        println!("{}", num[n]);
        input = sc.read1();
    }
}

struct Scanner<'a> {
    cin: StdinLock<'a>,
}
 
impl<'a> Scanner<'a> {
    fn new(cin: StdinLock<'a>) -> Scanner<'a> {
        Scanner { cin: cin }
    }
 
    fn read1<T: FromStr>(&mut self) -> Option<T> {
        let token = self.cin.by_ref().bytes().map(|c| c.unwrap() as char)
            .skip_while(|c| c.is_whitespace())
            .take_while(|c| !c.is_whitespace())
            .collect::<String>();
        token.parse::<T>().ok()
    }
 
    fn read<T: FromStr>(&mut self) -> T {
        self.read1().unwrap()
    }
}
