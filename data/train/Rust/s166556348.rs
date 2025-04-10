#![allow(non_snake_case)]
#![allow(dead_code)]

fn read_line() -> String {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    s.trim().to_string()
}

fn read_vec<T: std::str::FromStr>() -> Vec<T> {
    read_line()
        .split_whitespace()
        .map(|e| e.parse().ok().unwrap())
        .collect()
}

fn read_tuple<T: std::str::FromStr + Copy>() -> (T, T, T) {
    let v: Vec<T> = read_vec();
    (v[0], v[1], v[2])
}

fn floyd_warshall(d: &mut Vec<Vec<usize>>) {
    let v = d.len();
    for k in 0..v {
        for i in 0..v {
            for j in 0..v {
                d[i][j] = std::cmp::min(d[i][j], d[i][k] + d[k][j]);
            }
        }
    }
}

fn main() {
    loop {
        let n: usize = read_line().parse().unwrap();
        if n == 0 {
            break;
        }
        let mut info = Vec::new();
        let mut v = 1;
        for i in 0..n {
            let (a, b, c) = read_tuple::<usize>();
            v = std::cmp::max(v, std::cmp::max(a+1, b+1));
            info.push((a, b, c));
        }

        let mut d = vec![vec![usize::max_value() / 3; v]; v];
        for i in 0..v {
            d[i][i] = 0;
        }
        for &(a, b, c) in &info {
            d[a][b] = c;
            d[b][a] = c;
        }

        floyd_warshall(&mut d);
        let total: Vec<usize> = d.iter().map(|dist| dist.iter().sum()).collect();
        let min_dist = *total.iter().min().unwrap();
        println!("{} {}", total.iter().position(|&t| t == min_dist).unwrap(), min_dist);
    }
}

