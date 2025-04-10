use std::collections::BTreeSet;
use std::fmt::Debug;
use std::str::FromStr;

fn read_line<T>() -> Vec<T>
where
    T: FromStr,
    <T as FromStr>::Err: Debug,
{
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    s.trim()
        .split_whitespace()
        .map(|c| T::from_str(c).unwrap())
        .collect()
}

fn sub() -> bool {
    let datas: Vec<usize> = read_line();
    let n = datas[0];
    if n == 0 {
        return false;
    }
    let mut cards0 = BTreeSet::new();
    for _i in 0..n {
        let datas: Vec<u32> = read_line();
        cards0.insert(datas[0]);
    }
    let mut cards1 = BTreeSet::new();
    for i in 1..2 * n + 1 {
        let i_u32 = i as u32;
        if !cards0.contains(&i_u32) {
            cards1.insert(i_u32);
        }
    }
    let mut cardss = vec![&mut cards0, &mut cards1];
    let mut ba = 0u32;
    'fin: loop {
        for cards in &mut cardss {
            ba = {
                let val = cards.iter().find(|&card| card > &ba);
                if val == None {
                    ba = 0u32;
                    continue;
                }
                *val.unwrap()
            };
            cards.remove(&ba);
            if cards.is_empty() {
                break 'fin;
            }
        }
    }
    println!("{}", cardss[1].len());
    println!("{}", cardss[0].len());
    return true;
}

fn main() {
    loop {
        if !sub() {
            break;
        }
    }
}
