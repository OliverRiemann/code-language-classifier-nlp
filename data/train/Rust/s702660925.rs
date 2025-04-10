use std::ops::Sub;
use std::fmt::Debug;

fn read_line() -> String {
    let mut buffer = String::new();
    std::io::stdin().read_line(&mut buffer).expect("No Line");
    buffer
}
fn read_values<T: std::str::FromStr>() -> Vec<T> {
    read_line().trim().split(' ').map(|x| x.parse().ok().expect("Can't Parse")).collect::<Vec<T>>()
}
fn read_multi_line<T: std::str::FromStr>(count: usize) -> Vec<T> {
    let mut buffer = String::new();
    let mut vec = Vec::with_capacity(count);
    for i in 0 .. count {
        std::io::stdin().read_line(&mut buffer).expect("No Line");
        vec.push(buffer.parse().ok().expect("Can't Parse"));
    }
    vec
}

macro_rules! ignore {
    ($id:ident) => {};
}
macro_rules! assign {
    (let $($id:ident),* = $value:expr) => {
        let ($($id), *) = {
            let mut iter = $value.into_iter();
            ($({ignore!($id); iter.next().unwrap()}), *)
        }
    };
}
fn inspect<T: Debug>(vec: &Vec<T>) -> () {
    if let Some(first) = vec.first() {
        println!("Vec({:?}", first);
        for i in 1..vec.len() {
            println!(", {:?}", vec[i]);
        }
        println!(")");
    }else {
        println!("Vec()");
    }
}

#[derive(Copy, Clone, Debug)]
struct Angle {
    sin: f64,
    cos: f64
}
impl Angle {
    fn from_degree(degree: f64) -> Angle {
        if degree > 180f64 {Angle::from_degree(degree - 360f64)} else if degree < -180f64 {Angle::from_degree(degree + 360f64)} else {
            let rad = degree / 180f64 * std::f64::consts::PI;
            Angle { sin: rad.sin(), cos: rad.cos() }
        }
    }
}
impl Sub for Angle {
    type Output = Angle;
    fn sub(self, rhs: Self) -> Self::Output {
        Angle{sin: self.sin * rhs.cos - self.cos * rhs.sin, cos: self.cos * rhs.cos + self.sin * rhs.sin}
    }
}
fn main() {
    let radius = 6378.1f64;
    loop {
        assign!(let a, b, c, d = read_values::<f64>());
        if a == -1f64 && b == -1f64 && c == -1f64 && d == -1f64 {break;}
        let h1 = Angle::from_degree(a);
        let h2 = Angle::from_degree(c);
        let v1 = Angle::from_degree(b);
        let v2 = Angle::from_degree(d);
        let rad = (h1.sin * h2.sin + h1.cos * h2.cos * Angle::from_degree((b - d).abs()).cos).acos();
        println!("{}", (rad * radius + 0.5) as i32);
    }
}

