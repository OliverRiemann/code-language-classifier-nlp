#![allow(non_snake_case)]
#![allow(dead_code)]
#![allow(unused_macros)]
#![allow(unused_imports)]

use std::str::FromStr;
use std::io::*;
use std::collections::*;
use std::cmp::*;

struct Scanner<I: Iterator<Item = char>> {
    iter: std::iter::Peekable<I>,
}

macro_rules! exit {
    () => {{
        exit!(0)
    }};
    ($code:expr) => {{
        if cfg!(local) {
            writeln!(std::io::stderr(), "===== Terminated =====")
                .expect("failed printing to stderr");
        }
        std::process::exit($code);
    }}
}

impl<I: Iterator<Item = char>> Scanner<I> {
    pub fn new(iter: I) -> Scanner<I> {
        Scanner {
            iter: iter.peekable(),
        }
    }

    pub fn safe_get_token(&mut self) -> Option<String> {
        let token = self.iter
            .by_ref()
            .skip_while(|c| c.is_whitespace())
            .take_while(|c| !c.is_whitespace())
            .collect::<String>();
        if token.is_empty() {
            None
        } else {
            Some(token)
        }
    }

    pub fn token(&mut self) -> String {
        self.safe_get_token().unwrap_or_else(|| exit!())
    }

    pub fn get<T: FromStr>(&mut self) -> T {
        self.token().parse::<T>().unwrap_or_else(|_| exit!())
    }

    pub fn vec<T: FromStr>(&mut self, len: usize) -> Vec<T> {
        (0..len).map(|_| self.get()).collect()
    }

    pub fn mat<T: FromStr>(&mut self, row: usize, col: usize) -> Vec<Vec<T>> {
        (0..row).map(|_| self.vec(col)).collect()
    }

    pub fn char(&mut self) -> char {
        self.iter.next().unwrap_or_else(|| exit!())
    }

    pub fn chars(&mut self) -> Vec<char> {
        self.get::<String>().chars().collect()
    }

    pub fn mat_chars(&mut self, row: usize) -> Vec<Vec<char>> {
        (0..row).map(|_| self.chars()).collect()
    }

    pub fn line(&mut self) -> String {
        if self.peek().is_some() {
            self.iter
                .by_ref()
                .take_while(|&c| !(c == '\n' || c == '\r'))
                .collect::<String>()
        } else {
            exit!();
        }
    }

    pub fn peek(&mut self) -> Option<&char> {
        self.iter.peek()
    }
}

const INF: i64 = 1 << 60;

fn main() {
    let cin = stdin();
    let cin = cin.lock();
    let mut sc = Scanner::new(cin.bytes().map(|c| c.unwrap() as char));
    loop {
        let n: usize = sc.get();
        if n == 0 {
            break;
        }
        let a: Vec<i64> = sc.vec(n);
        let mut ans = -INF;
        let mut sum = 0;
        for i in 0..n {
            sum = max(a[i], sum + a[i]);
            ans = max(ans, sum);
        }
        println!("{}", ans);
    }
}

