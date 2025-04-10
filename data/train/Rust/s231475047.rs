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

fn main() {
    loop {
        let_all!(n: usize, m: usize);
        if n == 0 && m == 0 {return}
        let mut picture: Vec<Vec<i32>> = Vec::with_capacity(n);
        for _ in 0 .. n {
            picture.push(read_line!(' '; i32));
        }
        let mut piece: Vec<Vec<i32>> = Vec::with_capacity(m);
        for _ in 0 .. m {
            piece.push(read_line!(' '; i32));
        }
        let picture = Picture{state: picture, height: n, width: n};
        let mut piece = Piece::read(&piece);
        let mut left_top = Point{x: n, y: n};
        'out: for _ in 0 .. 4 {
            piece = piece.rotate_right();
            for y in 0 .. n - m + 1 {
                for x in 0 .. n - m + 1 {
                    if let Some(p) = piece.is_match_at(&picture, Point{x: x, y: y}) {
                        if left_top.y > p.y || (left_top.y == p.y && left_top.x > p.x) {
                            left_top = p;
                        }
                        continue 'out;
                    }
                }
            }
        }
        if left_top.y == n {
            println!("NA");
        }else {
            println!("{} {}", left_top.x + 1, left_top.y + 1);
        }
    }
}
#[derive(Copy, Clone)]
struct Point {
    x: usize, y: usize
}
struct Piece {
    peaces: Vec<(Point, i32)>,
    height: usize, width: usize,
}
struct Picture {
    state: Vec<Vec<i32>>,
    height: usize, width: usize,
}

impl Piece {
    fn read(piece: &Vec<Vec<i32>>) -> Piece {
        //println!("create");
        //show2(&piece);
        let mut vec = Vec::new();
        for y in 0 .. piece.len() {
            for x in 0 .. piece[y].len() {
                if piece[y][x] != -1 {
                    vec.push((Point{x: x, y: y}, piece[y][x]));
                }
            }
        }
        Piece{peaces: vec, height: piece.len(), width: piece[0].len()}
    }
    fn is_match_at(&self, picture: &Picture, left_top: Point) -> Option<Point> {
        let left = left_top.x;
        let top = left_top.y;
        for &(p, n) in &self.peaces {
            if p.x + left >= picture.width || p.y + top >= picture.height || picture.state[p.y + top][p.x + left] != n{
                return None
            }
        }
        let (ret, _) = self.peaces[0];
        Some(Point{x: ret.x + left, y: ret.y + top})
    }
    fn rotate_right(&self) -> Piece {
        let mut vec = vec![vec![-1; self.height]; self.width];
        for &(p, n) in &self.peaces {
            vec[p.x][self.height - p.y - 1] = n;
        }
        Piece::read(&vec)
    }
}
