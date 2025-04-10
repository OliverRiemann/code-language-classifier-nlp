fn main(){
    let _: usize = read();
    let mut v: Vec<u32> = read_vec();
    let q: i32 = read();

    let mut sv: Vec<u32> = v.clone();
    sv.sort();

    let mut dc: usize = v.iter().zip(sv.iter()).filter(|&(&x, &y)| x != y).count();
    let mut ix: i32 = 0;

    loop {
        if dc == 0 { break }

        ix += 1;
        if ix > q { ix = -1; break }

        let xy: Vec<usize> = read_vec();
        let x = xy[0] - 1;
        let y = xy[1] - 1;

        if v[x] != sv[x] && v[x] == sv[y] { dc -= 1 }
        if v[x] == sv[x] && v[x] != sv[y] { dc += 1 }
        if v[y] != sv[y] && v[y] == sv[x] { dc -= 1 }
        if v[y] == sv[y] && v[y] != sv[x] { dc += 1 }

        v.swap(x, y);
    }
    println!("{}", ix);
}

#[allow(dead_code)]
fn read<T>() -> T
where T: std::str::FromStr,
      T::Err: std::fmt::Debug
{
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).expect("failed to read");
    buf.trim().parse().unwrap()
}

#[allow(dead_code)]
fn read_vec<T>() -> Vec<T>
where T: std::str::FromStr,
      T::Err: std::fmt::Debug
{
    let mut buf = String::new();
    std::io::stdin().read_line(&mut buf).expect("failed to read");
    buf.split_whitespace().map(|e| e.parse().unwrap()).collect()
}

