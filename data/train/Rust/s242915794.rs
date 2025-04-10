#![allow(unused_imports)]
#![allow(unused_macros)]
use std::cmp::{ min, max };

macro_rules! ewriteln {
    ($($args:expr),*) => { let _ = writeln!(&mut std::io::stderr(), $($args),*); };
}
macro_rules! trace {
    ($x:expr) => { ewriteln!(">>> {} = {:?}", stringify!($x), $x) };
    ($($xs:expr),*) => { trace!(($($xs),*)) }
}
macro_rules! put {
    ($x:expr) => { println!("{}", $x) };
    ($x:expr, $($xs:expr),*) => { print!("{} ", $x); put!($($xs),*) }
}

#[derive(Debug, Clone, Copy)]
struct Point(f64, f64);

#[allow(dead_code)]
impl Point {
    fn norm(self) -> f64 {
        (self * self).sqrt()
    }
    fn det(self, other: Point) -> f64 {
        self.0 * other.1 - self.1 * other.0
    }
    fn arg(self) -> f64 {
        let x = self.0 / self.norm();
        (if x < -1.0 { -1.0 } else if x > 1.0 { 1.0 } else { x } as f64).acos()
    }
}

use std::cmp::{PartialEq, Eq};
impl PartialEq for Point {
    fn eq(&self, other: &Point) -> bool {
        let eps = 0.0001;
        (self.0 - other.0).abs() < eps && (self.1 - other.1).abs() < eps
    }
    fn ne(&self, other: &Point) -> bool {
        !(self == other)
    }
}
impl Eq for Point { }

use std::ops::{Add, Sub, Neg, Mul, Div};
impl Add for Point {
    type Output = Point;
    fn add(self, other: Point) -> Point {
        Point(self.0 + other.0, self.1 + other.1)
    }
}

impl Neg for Point {
    type Output = Point;
    fn neg(self) -> Point {
        Point(-self.0, -self.1)
    }
}

impl Sub for Point {
    type Output = Point;
    fn sub(self, other: Point) -> Point {
        self + (-other)
    }
}

// scalar multiplication
impl Mul<Point> for f64 {
    type Output = Point;
    fn mul(self, other: Point) -> Point {
        Point(self * other.0, self * other.1)
    }
}

impl Mul<f64> for Point {
    type Output = Point;
    fn mul(self, other: f64) -> Point {
        Point(other * self.0, other * self.1)
    }
}

// inner-product
impl Mul<Point> for Point {
    type Output = f64;
    fn mul(self, other: Point) -> f64 {
        self.0 * other.0 + self.1 * other.1
    }
}

impl Div<f64> for Point {
    type Output = Point;
    fn div(self, other: f64) -> Point {
        Point(self.0 / other, self.1 / other)
    }
}

#[derive(Debug, Clone, Copy)]
struct Line(Point, Point);

#[allow(dead_code)]
impl Line {
    fn len(self) -> f64 {
        (self.0 - self.1).norm()
    }
    fn rev(self) -> Line {
        Line(self.1, self.0)
    }
}

#[derive(Debug, Clone, Copy)]
struct Circle(Point, f64);

#[derive(Debug)]
enum CircleRelation {
    EQUAL,
    SUB, SUP,  // one contains the other
    INTERSECTION(usize)  // intersection with `n` points
}

fn circle_relation(a: Circle, b: Circle) -> CircleRelation {
    use CircleRelation::*;
    let d = (a.0 - b.0).norm();
    let eps = 1e-9;
    if d < eps && (a.1 - b.1).abs() < eps {
        EQUAL
    } else if d + a.1 < b.1 {
        SUB
    } else if a.1 > d + b.1 {
        SUP
    } else if d < a.1 + b.1 {
        INTERSECTION(2)
    } else if d <= a.1 + b.1 + eps {
        INTERSECTION(1)
    } else {
        INTERSECTION(0)
    }
}

fn main() {

    use CircleRelation::*;

    let mut sc = Scanner::new();
    let q: usize = sc.cin();
    for _ in 0..q {
        let x1: f64 = sc.cin();
        let y1: f64 = sc.cin();
        let r1: f64 = sc.cin();
        let x2: f64 = sc.cin();
        let y2: f64 = sc.cin();
        let r2: f64 = sc.cin();
        let a = Circle(Point(x1, y1), r1);
        let b = Circle(Point(x2, y2), r2);
        match circle_relation(a, b) {
            SUB => {
                put!(-2);
            },
            SUP => {
                put!(2);
            },
            INTERSECTION(0) => {
                put!(0);
            },
            _ => {
                put!(1);
            }
        }
    }


}

use std::io::{self, Write};
use std::str::FromStr;
use std::collections::VecDeque;

struct Scanner { stdin: io::Stdin, buffer: VecDeque<String>, }
impl Scanner {
    fn new() -> Scanner { Scanner { stdin: io::stdin(), buffer: VecDeque::new() } }
    fn cin<T: FromStr>(&mut self) -> T {
        while self.buffer.len() == 0 {
            let mut line = String::new();
            let _ = self.stdin.read_line(&mut line);
            for w in line.split_whitespace() {
                self.buffer.push_back(String::from(w));
            }
        }
        self.buffer.pop_front().unwrap().parse::<T>().ok().unwrap()
    }
}

