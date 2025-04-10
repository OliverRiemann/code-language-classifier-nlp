fn main(){
    let n=readln();
    for _i in 0..n{
        let a:String=readln();
        let b:String=readln();
        let mut aaa=a.as_bytes();
        let mut bbb=b.as_bytes();
        let mut aa=Vec::new();
        let mut bb=Vec::new();
        for k in 0..aaa.len(){
            aa.push(aaa[k] as i32);
        }
        for k in 0..bbb.len(){
            bb.push(bbb[k] as i32);
        }
        aa.reverse();
        bb.reverse();
        let mut res:Vec<i32>=Vec::new();
        let mut bef=0;
        let mut xx=0;
        if bb.len()<aa.len(){
            xx=bb.len();
        }
        else {
            xx=aa.len();
        }
        for j in 0..xx{
            let tmp=bef+aa[j]+bb[j]-96;
            if tmp>=10{
                res.push(tmp-10);
                bef=1;
            }
            else {
                res.push(tmp);
                bef=0;
            }

        }
        if aa.len()>bb.len(){
            for j in bb.len()..aa.len(){
                let tmp=bef+aa[j]-48;
            
                if tmp>=10{
                    res.push(tmp-10);
                    bef=1;
                }
                else {
                    res.push(tmp);
                    bef=0;
                }
            }
        }
        else if bb.len()>aa.len(){              
              for j in aa.len()..bb.len(){   
                  let tmp=bef+bb[j]-48;
                  if tmp>=10{
                    res.push(tmp-10);
                    bef=1;
                  }
                  else {
                    res.push(tmp);
                  bef=0;
                  }
              }
        }
        if bef==1{
            res.push(1);
        }
        if res.len()>80{
            println!("overflow");
        }
        else{
            res.reverse();
            for l in res{
                print!("{}",l);
            }
            println!("");
        }
        
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

