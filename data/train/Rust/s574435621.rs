fn main(){
  let n: usize = read();
  let mut sdv: Vec<Vec<i32>> = Vec::new();

  for _ in 0 .. n {
    sdv.push(read_vec());
  }

  let mut dp: Vec<Vec<(f64, i32, usize)>> = vec![vec![(1000000000.0, 0, 0);n]; (1 << n)];
  
  for i in 0 .. n {
    dp[1 << i][i] = (0f64, sdv[i][2], 16usize);
  }
  
  for s in 1 .. (1 << n) {
    for i in 0 .. n {
      if s & (1 << i) > 0 {
        for j in 0 .. n {
          if s & (1 << j) == 0 {
            let &(ot, _, _) = &dp[s|(1 << j)][j];
            let &(ct, cc, _) = &dp[s][i];
            let nt = time((sdv[i][1] - sdv[j][1]).abs(), cc) + ct; 
            if ot > nt {
              dp[s|(1 << j)][j] = (nt, cc + sdv[j][2], i);
            }
          }
        }
      }
    }
  }
  
  let mut ti: usize = 16;
  let mut tt: f64 = 1000000000.0;
  let mut ts: usize = (1 << n) - 1;
  
  for i in 0 .. n {
    let &(t, _, _) = &dp[ts][i];
    if tt > t {ti = i; tt = t}
  }

  let mut ans: Vec<i32> = Vec::new();
  ans.push(sdv[ti][0]);
  
  loop {
    let &(_, _, i) = &dp[ts][ti];
    if i == 16 { break; }
    ts = ts & !(1 << ti);
    ti = i;
    ans.push(sdv[ti][0]);
  }

  for i in 0 .. n {
    if i == n-1 {
      println!("{}", ans[n-1-i]);
    } else {
      print!("{} ", ans[n-1-i]);
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

fn time(l: i32, c: i32) -> f64 {
  (l as f64) * (70.0 + (c as f64) * 20.0) / 2000.0
}

