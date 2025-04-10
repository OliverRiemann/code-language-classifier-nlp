#![allow(non_snake_case)]
fn main(){
   let dataset  = readln();
   for d in 0..dataset{
       let mut v:Vec<f64> = readln();
       let res=center_of_circle(v);
       println!("{:.3} {:.3} {:.3}",res.0,res.1,res.2);
    }
}

//(x1,y1,x2,y2,x3,y3)->(x0,y0,R)
fn center_of_circle(v: Vec<f64>) -> (f64,f64,f64){
    let x1=v[0];let x2=v[2];let x3=v[4];let y1=v[1];let y2=v[3];let y3=v[5];
    let mut x0 = (x1*x1+y1*y1)*(y2-y3)+(x2*x2+y2*y2)*(y3-y1)+(x3*x3+y3*y3)*(y1-y2);
    x0=0.5*x0/(x1*(y2-y3)+x2*(y3-y1)+x3*(y1-y2));
    
    let mut y0 = (x1*x1+y1*y1)*(x2-x3)+(x2*x2+y2*y2)*(x3-x1)+(x3*x3+y3*y3)*(x1-x2);
    y0=0.5*y0/(y1*(x2-x3)+y2*(x3-x1)+y3*(x1-x2));


    let mut R=(( (x1-x2)*(x1-x2) + (y1-y2)*(y1-y2) )*( (x2-x3)*(x2-x3) + (y2-y3)*(y2-y3) )*( (x3-x1)*(x3-x1) + (y3-y1)*(y3-y1) )).sqrt();
    R=R*0.5/(x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)).abs();
    return (x0,y0,R);


}


// --- template ---
#[allow(unused_imports)]
use std::cmp::{max, min};
#[allow(unused_imports)]
 
pub trait FromLn {
    fn fromln(s: &str) -> Self;
}
pub fn readln<T: FromLn>() -> T {
    let mut buf = String::new();
    let _ = ::std::io::stdin().read_line(&mut buf).unwrap();
    T::fromln(buf.trim())
}
pub fn readlns<T: FromLn>(n: usize) -> Vec<T> {
    let mut vs = vec![];
    for _ in 0..n {
        vs.push(readln());
    }
    vs
}
macro_rules! fromln_primitives {
    ($($t:ty),*) => { $(
        impl FromLn for $t {
            fn fromln(s: &str) -> $t {
                s.parse().unwrap()
            }
        }
    )* }
}
fromln_primitives!(
    String,
    bool,
    f32,
    f64,
    isize,
    i8,
    i16,
    i32,
    i64,
    usize,
    u8,
    u16,
    u32,
    u64
);
impl<T> FromLn for Vec<T>
where
    T: FromLn,
{
    fn fromln(s: &str) -> Vec<T> {
        s.split_whitespace().map(T::fromln).collect()
    }
}
impl FromLn for Vec<char> {
    fn fromln(s: &str) -> Vec<char> {
        s.chars().collect()
    }
}
macro_rules! fromln_tuple {
    ($($t:ident),*) => {
        impl<$($t),*> FromLn for ($($t),*) where $($t: FromLn),* {
            fn fromln(s: &str) -> ($($t),*) {
                let mut it = s.split_whitespace();
                let t = ($($t::fromln(it.next().unwrap())),*);
                assert_eq!(it.next(), None);
                t
            }
        }
    }
}
fromln_tuple!(A, B);
fromln_tuple!(A, B, C);
fromln_tuple!(A, B, C, D);
fromln_tuple!(A, B, C, D, E);
fromln_tuple!(A, B, C, D, E, F);

