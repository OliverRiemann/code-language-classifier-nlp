use std::cmp::min;
use std::io;
use std::io::prelude::*;
use std::iter::repeat;

fn main() {
    let mut stdin = io::stdin();
    let mut buf = String::new();
    stdin.read_to_string(&mut buf);
    let mut iter = buf.split_whitespace();

    loop {
        let a: usize = iter.next().unwrap().parse().unwrap();
        let b: usize = iter.next().unwrap().parse().unwrap();
        if (a, b) == (0, 0) {
            break;
        }
        let n: usize = iter.next().unwrap().parse().unwrap();
        let c: Vec<(usize, usize)> = (0..n)
            .map(|_| {
                (
                    iter.next().unwrap().parse().unwrap(),
                    iter.next().unwrap().parse().unwrap(),
                )
            })
            .collect();

        let mut path: Vec<Vec<u64>> = repeat(repeat(0).take(b + 1).collect())
            .take(a + 1)
            .collect();
        path[1][1] = 1;

        for d in 3..(a + b + 1) {
            for x in 1..min(d, a + 1) {
                let y = d - x;
                if y > b || c.contains(&(x, y)) {
                    continue;
                }
                path[x][y] = path[x-1][y] + path[x][y-1];
            }
        }

        println!("{}", path[a][b]);
    }
}

