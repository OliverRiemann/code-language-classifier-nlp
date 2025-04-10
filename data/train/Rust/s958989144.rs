// JOI - Prelim  0524
// 星座探し
use std::fmt::Debug;
use std::str::FromStr;
use std::collections::*;

// std input(line)
fn read_line<T>() -> Vec<T>
where T: FromStr, <T as FromStr>::Err : Debug{
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    s.trim().split_whitespace().map(|c| T::from_str(c).unwrap()).collect()
}

fn sub() -> bool
{
    let ms = read_line();
    let m = ms[0];
    if m == 0 {
        return false;
    }
    let mut m_xys = Vec::with_capacity(m);
    let mut base_x = 0;
    let mut base_y = 0;
    for i in 0..m {
        let mut line: Vec<i64> = read_line();
        if i == 0 {
            base_x = line[0];
            base_y = line[1];
        }
        else {
            line[0] -= base_x;
            line[1] -= base_y;
            m_xys.push(line);
        }
    }
    let ns = read_line();
    let n = ns[0];
    let mut n_xys = HashSet::with_capacity(n);
    for _i in 0..n {
        let ns: Vec<i64> = read_line();
        n_xys.insert(ns);
    }

    if m == 1 {
        // 例外:探したい星が1つのみ
        assert!(m_xys.is_empty());
        for n_xy in &n_xys {
            println!("{} {}", n_xy[0] - base_x, n_xy[1] - base_y);
            return true;
        }
    }

    let mut matchs = Vec::new();
    for n_xy in &n_xys {
        if !m_xys.iter().all(|m_xy| {
            matchs.clear();
            matchs.push(n_xy[0] + m_xy[0]);
            matchs.push(n_xy[1] + m_xy[1]);
            n_xys.contains(&matchs)
        }) {
            continue;
        }
        println!("{} {}", n_xy[0] - base_x, n_xy[1] - base_y);
    }

    return true;
}

fn main()
{
    loop {
        if !sub() {
            return;
        }
    }
}
