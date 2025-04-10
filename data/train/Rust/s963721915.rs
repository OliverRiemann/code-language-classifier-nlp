fn main(){
  let mut sieve: Vec<bool> = vec![true; 999984];
  sieve[0] = false;
  sieve[1] = false;

  for i in 2 .. 1000 {
    if sieve[i] {
      let mut j = i * i;
      while j < 999984 {
        sieve[j] = false;
        j += i;
      }
    }
  }

  let mut pn: Vec<usize> = vec![0; 999984];
  
  for i in 1 .. 999984 {
    if sieve[i] {
      pn[i] = pn[i-1] + 1;
    } else {
      pn[i] = pn[i-1];
    }
  }
  
  loop {
    let n: usize = read();
    
    if n == 0 { break; }

    let mut ans: usize = 0;
    
    for _ in 0 .. n {
      let pm: Vec<usize> = read_vec();
      let p = pm[0];
      let m = pm[1];

      let rmn: usize = if p < m + 1 { 0 } else { p - m - 1 };
      let rmx: usize = if p + m > 999983 { 999983 } else { p + m };

      ans += pn[rmx] - pn[rmn];
    }

    ans -= n;
    
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

