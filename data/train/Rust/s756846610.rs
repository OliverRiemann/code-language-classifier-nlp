
fn main() {
    loop {
        let (n, k) = read_tuple();
        if n == 0 && k == 0 {
            break;
        }
        let data = (0..n).map(|_| read::<i64>()).collect::<Vec<i64>>();

        let acc_sum = accumulate_each(data.iter(), add_i64, 0);

        let mut ans = 0;
        for i in 0..(n - k + 1) {
            let local_sum = acc_sum[i + k] - acc_sum[i];
            if ans < local_sum {
                ans = local_sum;
            }
        }

        println!("{:?}", ans);
    }
}

fn add_i64(a: i64, b:i64) -> i64 {
    a + b
}

fn accumulate_each<T: std::clone::Clone>(iterable: std::slice::Iter<T>, func: fn(T, T) -> T, init: T) -> Vec<T> {
    let mut res = Vec::new();
    let mut acc = init.clone();
    res.push(acc.clone());
    for element in iterable {
        acc = func(acc, element.clone());
        res.push(acc.clone());
    }
    res
}


fn read_tuple<T: std::str::FromStr + Copy>() -> (T, T) {
    let temp = read_vec();
    (temp[0], temp[1])
}


fn read_vec<T: std::str::FromStr>() -> Vec<T> {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).ok();
    s.trim().split_whitespace()
        .map(|e| e.parse().ok().unwrap()).collect()
}


fn read<T: std::str::FromStr>() -> T {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).ok();
    s.trim().parse().ok().unwrap()
}
