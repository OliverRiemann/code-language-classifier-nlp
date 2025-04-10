use std::str::FromStr;
use std::io::{ self, stdin };
use std::io::BufRead;

fn main() {
    let N: u32 = input();

    for _ in 0..N {
        let mut val_vec: Vec<u32> = input_vec();
        val_vec.sort();
        let mut val_iter = val_vec.into_iter();
        let v1 = val_iter.next().unwrap().pow(2);
        let v2 = val_iter.next().unwrap().pow(2);
        let v3 = val_iter.next().unwrap().pow(2);
        if v1 + v2 == v3 {
            println!("YES");
        } else {
            println!("NO");
        }

    }
}

pub fn input<T>() -> T
where T:FromStr
{
    let mut buf = String::new();
    stdin().read_line(&mut buf).expect("input error");
    let parse_result = buf.trim().parse::<T>();
    if let Ok(v) = parse_result {
        v
    } else {
        panic!("parse error");
    }
}

pub fn input_vec<T>() -> Vec<T>
where T: FromStr
{
    let mut buf = String::new();
    stdin().read_line(&mut buf).expect("input error");
    let split_vec: Vec<_> = buf.trim().split(" ").collect();
    split_vec.iter()
        .map(|&v|{
            let parse_result = v.parse::<T>();
            if let Ok(v) = parse_result { v }
            else {panic!("parse error");}
        })
        .collect::<Vec<T>>()
}
