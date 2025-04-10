use std::collections::*;

#[allow(dead_code)]
fn read_line(n: usize) -> String {
    let mut ss = String::new();
    for _i in 0..n {
        let mut s = String::new();
        std::io::stdin().read_line(&mut s).unwrap();
        ss.push_str(&s);
    }
    ss
}

macro_rules! parse {
    ($s:expr => $($r:tt)*) => {
        let s = $s;
        let mut iter = s.split_whitespace();
        input_inner!{iter, $($r)*}
    };
    ($($r:tt)*) => {
        use std::io::Read;
        let mut s = String::new();
        std::io::stdin().read_to_string(&mut s).unwrap();
        parse!{s => $($r)*}
    };
}

macro_rules! input_inner {
    ($iter:expr) => {};
    ($iter:expr, ) => {};
    ($iter:expr, $var:ident : $t:tt $($r:tt)*) => {
        let $var = read_value!($iter, $t);
        input_inner!{$iter $($r)*}
    };
    ($iter:expr, mut $var:ident : $t:tt $($r:tt)*) => {
        let mut $var = read_value!($iter, $t);
        input_inner!{$iter $($r)*}
    };
}

macro_rules! read_value {
    ($iter:expr, ( $($t:tt),* )) => {
        ( $(read_value!($iter, $t)),* )
    };
    ($iter:expr, [ $t:tt ; $len:expr ]) => {
        (0..$len).map(|_| read_value!($iter, $t)).collect::<Vec<_>>()
    };
    ($iter:expr, chars) => {
        read_value!($iter, String).chars().collect::<Vec<char>>()
    };
    ($iter:expr, usize1) => {
        read_value!($iter, usize) - 1
    };
    ($iter:expr, $t:ty) => {
        $iter.next().unwrap().parse::<$t>().expect("Parse error")
    };
}

fn calc(n: i32, cur: i32, s: i32, sum: i32, used: &mut BTreeSet<i32>, useds: &mut BTreeSet<BTreeSet<i32>>) {
    if s < sum {
        return;
    }
    if n == cur {
        if s == sum {
            useds.insert(used.clone());
        }
        return;
    }
    for i in cur..10 {
        if used.get(&i).is_some() {
            continue;
        }
        let mut new_used = used.clone();
        new_used.insert(i);
        calc(n, cur + 1, s, sum + i, &mut new_used, useds);
    }
}

fn sub() -> bool {
    parse!{
        read_line(1) =>
        n: i32,
        s: i32,
    }
    if n == 0 && s == 0 {
        return false;
    }
    let mut used = BTreeSet::new();
    let mut useds = BTreeSet::new();
    calc(n, 0, s, 0, &mut used, &mut useds);
    println!("{}", useds.len());
    return true;
}

fn main()
{
    while sub() {
    }
}
