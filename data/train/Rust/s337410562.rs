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
fn clockwise_first(origin: Point, points: &Vec<Point>) -> Option<usize> {
    if !points.is_empty() {
        let mut suspect = 0;
        for i in 1 .. points.len() {
            if (points[suspect] - origin).cross(&(points[i] - origin)) > 0_f64 {
                suspect = i;
            }
        }
        Some(suspect)
    }else {
        None
    }
}
fn clockwise_last(origin: Point, points: &Vec<Point>) -> Option<usize> {
    if !points.is_empty() {
        let mut suspect = 0;
        for i in 1 .. points.len() {
            if (points[suspect] - origin).cross(&(points[i] - origin)) < 0_f64  {
                suspect = i;
            }
        }
        Some(suspect)
    }else {
        None
    }
}
fn min_f64(a: f64, b: f64) -> f64 {
    match a.partial_cmp(&b) {
        Some(Ordering::Greater) => b,
        Some(_) => a,
        None => {unimplemented!()}
    }
}
fn min_distance_on_edge(start: Point, goal: Point, edge: Edge) -> f64 {
    let line = Line::by_two_points(&edge.from, &edge.to);
    let symmetry_goal = line.line_symmetry_point(&goal);
    let default = min_f64(start.distance(&edge.from) + goal.distance(&edge.from), start.distance(&edge.to) + goal.distance(&edge.to));
    if let Some(cp) = Line::by_two_points(&start, &symmetry_goal).cross_point(&line) {
        if (edge.from - start).cross(&(cp - start)) <= 0_f64 && (edge.to - start).cross(&(cp - start)) >= 0_f64 {
            min_f64(default, start.distance(&cp) + goal.distance(&cp))
        }else {
            default
        }
    }else {
        default
    }
}
fn main() {
    let_all!(from_x: f64, from_y: f64);
    let_all!(to_x: f64, to_y: f64);
    let start = Point{x: from_x, y: from_y};
    let goal = Point{x: to_x, y: to_y};
    let_all!(n: usize);
    let mut points = Vec::with_capacity(n);
    for _ in 0 .. n {
        let_all!(x: f64, y: f64);
        points.push(Point{x: x, y: y});
    }
    let mut suspect = std::f64::MAX;
    match (clockwise_first(start, &points), clockwise_last(goal, &points)) {
        (Some(to), Some(from)) if (points[to] - start).cross(&(goal - start)) < 0_f64 => {
            let mut temp = start.distance(&points[to]) + goal.distance(&points[from]);
            for i in 0 .. (to + n - from) % n {
                temp += (points[(i + from) % n] - points[(i + from + 1) % n]).norm();
            }
            if suspect > temp {
                suspect = temp;
            }
        }
        (Some(from), Some(to)) if from != to => {
            let mut temp = 0_f64;
            for i in 0 .. (to + n - from) % n {
                temp = min_distance_on_edge(start, goal, Edge{from: points[(i + from) % n], to: points[(i + from + 1) % n]});
                if temp < suspect {
                    suspect = temp;
                }
            }
        }
        (Some(from), Some(to)) => {
            let temp = start.distance(&points[from]) + goal.distance(&points[to]);
            if suspect > temp {
                suspect = temp;
            }
        }
        _ => {}
    }
    match (clockwise_last(start, &points), clockwise_first(goal, &points)) {
        (Some(from), Some(to)) if (points[from] - start).cross(&(goal - start)) > 0_f64 => {
            let mut temp = start.distance(&points[from]) + goal.distance(&points[to]);
            for i in 0 .. (to + n - from) % n {
                temp += (points[(i + from) % n] - points[(i + from + 1) % n]).norm();
            }
            if suspect > temp {
                suspect = temp;
            }
        }
        (Some(to), Some(from)) if from != to => {
            let mut temp = 0_f64;
            for i in 0 .. (to + n - from) % n {
                temp = min_distance_on_edge(start, goal, Edge{from: points[(i + from) % n], to: points[(i + from + 1) % n]});
                if temp < suspect {
                    suspect = temp;
                }
            }
        }
        (Some(to), Some(from)) => {
            let temp = start.distance(&points[from]) + goal.distance(&points[to]);
            if suspect > temp {
                suspect = temp;
            }
        }
        _ => {}
    }
    println!("{:.*}", 10, suspect);
}
#[derive(Copy, Clone)]
struct Edge{
    from: Point, to: Point
}
#[derive(Copy, Clone)]
struct Point {
    x: f64, y: f64,
}
impl Point {
    fn cross(&self, other: &Self) -> f64 {
        self.x * other.y - self.y * other.x
    }
    fn dot(&self, other: &Self) -> f64 {
        self.x * other.x + self.y * other.x
    }
    fn norm(&self) -> f64 {
        (self.x * self.x + self.y * self.y).sqrt()
    }
    fn sin(&self, other: &Self) -> f64 {
        self.cross(other) / self.norm() / other.norm()
    }
    fn cos(&self, other: &Self) -> f64 {
        self.dot(other) / self.norm() / other.norm()
    }
    fn angle(&self, other: &Self) -> Angle {
        let ab = self.norm() * other.norm();
        Angle{sin: self.cross(other) / ab, cos: self.dot(other) / ab}
    }
    fn distance(&self, other: &Self) -> f64 {
        let diff = *self - *other;
        (diff.x * diff.x + diff.y * diff.y).sqrt()
    }
}
struct Angle {
    sin: f64, cos: f64
}
impl Add for Angle {
    type Output = Self;
    fn add(self, rhs: Self) -> Self::Output {
        Angle{sin: self.sin * rhs.cos + self.cos * rhs.sin, cos: self.cos * rhs.cos - self.sin * rhs.sin}
    }
}
impl Sub for Angle {
    type Output = Self;
    fn sub(self, rhs: Self) -> Self::Output {
        Angle{sin: self.sin * rhs.cos - self.cos * rhs.sin, cos: self.cos * rhs.cos + self.sin * rhs.sin}
    }
}
impl Add for Point {
    type Output = Point;
    fn add(self, rhs: Self) -> Self::Output {
        Point{x: self.x + rhs.x, y: self.y + rhs.y}
    }
}
impl Sub for Point {
    type Output = Point;
    fn sub(self, rhs: Self) -> Self::Output {
        Point{x: self.x - rhs.x, y: self.y - rhs.y}
    }
}
impl Display for Point {
    fn fmt(&self, f: &mut Formatter) -> Result<(), Error> {
        write!(f, "Point({}, {})", self.x, self.y)
    }
}
pub struct Line {
    a: f64, b: f64, c: f64,//ay + bx + c == 0
}
impl Line {
    fn by_two_points(a: &Point, b: &Point) -> Line {
        Line{a: a.x - b.x, b: b.y - a.y, c: a.y * b.x - a.x * b.y}
    }
    fn by_point_and_angle(point: &Point, angle: &Angle) -> Line {
        Line{a: angle.cos, b: -angle.sin, c: angle.sin * point.x - angle.cos * point.y}
    }
    fn is_parallel(&self, other: &Self) -> bool {
        self.a * other.b == self.b * other.a
    }
    fn cross_point(&self, other: &Self) -> Option<Point> {
        if self.is_parallel(other) {
            None
        }else {
            let d = self.b * other.a - self.a * other.b;
            Some(Point{x: (self.a * other.c - self.c * other.a) / d, y: (self.c * other.b - self.b * other.c) / d})
        }
    }
    fn angle(&self) -> Angle {
        Angle{sin: -self.b, cos: self.a}
    }
    fn line_symmetry_point(&self, point: &Point) -> Point {
        let line = Line::by_point_and_angle(point, &(self.angle() + Angle{sin: 1_f64, cos: 0_f64}));
        let cp = line.cross_point(self).unwrap();
        cp - *point + cp
    }
}
impl Display for Line {
    fn fmt(&self, f: &mut Formatter) -> Result<(), Error> {
        write!(f, "Line({} y + {} x + {})", self.a, self.b, self.c)
    }
}
