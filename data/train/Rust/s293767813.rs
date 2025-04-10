fn main(){
  let mut pv: Vec<bool> = vec![true;1000001];
  pv[0] = false;
  pv[1] = false;

  let mut i: usize = 2;
  
  while i * i <= 1000000 {
    if pv[i] {
      let mut j: usize = i * i;

      while j <= 1000000 {
        pv[j] = false;
        j += i;
      }
    }
    i += 1;
  }
  
  loop {
    let nx:Vec<usize> = read_vec();
    let n = nx[0];
    let x = nx[1];

    if n == 0 && x == 0 { break; }

    let mut dp: Vec<bool> = vec![false;x+1];
    dp[0] = true;
    
    for _ in 0 .. n {
      let i: usize = read();

      for j in 0 .. x + 1 {
        if dp[j] && i + j <= x {
          dp[i + j] = true;
        }
      }
    }

    let mut ans = 0;
    
    for i in (1 .. x + 1).rev() {
      if dp[i] && pv[i] {
        ans = i;
        break;
      }
    }

    if ans == 0 {
      println!("NA");
    } else {
      println!("{}", ans);
    }
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

