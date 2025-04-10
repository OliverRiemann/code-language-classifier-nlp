use std::cmp;

fn main(){
  loop {
    let nm: Vec<usize> = read_vec();
    let n = nm[0];
    let m = nm[1] as u32;

    if n == 0 && m == 0 { break; }
    
    let mut d: Vec<u32> = vec![0];
  
    for _ in 0 .. n {
      d.push(read());
    }

    let mut d2: Vec<u32> = Vec::new();
    
    for i in 0 .. n+1 {
      for j in 0 .. n+1 {
        let t = d[i] + d[j];
        if t <= m {
          d2.push(t);
        }
      }
    }

    d2.sort();

    let mut ans: u32 = 0;
    
    for i in 0 .. d2.len() {
      let t = bsearch(&d2, m-d2[i]);
      ans = cmp::max(ans, t + d2[i]);
    }
    
    println!("{}", ans);
  }
}

fn read<T>() -> T
  where T: std::str::FromStr,
        T::Err: std::fmt::Debug
{
  let mut buf = String::new();
  std::io::stdin().read_line(&mut buf).expect("failed to read");
  buf.trim().parse().unwrap()
}

fn read_vec<T>() -> Vec<T>
  where T: std::str::FromStr,
        T::Err: std::fmt::Debug
{
  let mut buf = String::new();
  std::io::stdin().read_line(&mut buf).expect("failed to read");
  buf.split_whitespace().map(|e| e.parse().unwrap()).collect()
}

fn bsearch(v: &Vec<u32>, x: u32) -> u32 {
  let mut l: usize = 0;
  let mut r: usize = v.len();
  
  loop {
    if l + 1 == r { break; }
    let m = (l + r) / 2;
    if v[m] <= x {
      l = m;
    } else {
      r = m;
    }
  }
  v[l]
}

