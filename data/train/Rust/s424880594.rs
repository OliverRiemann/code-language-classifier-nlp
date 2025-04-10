fn main(){
  loop {
    let xy: Vec<usize> = read_vec();
    let x = xy[0];
    let y = xy[1];

    if x == 0 && y == 0 { break; }

    let mut fv: Vec<Vec<usize>> = Vec::new();

    for _ in 0 .. y {
      fv.push(read_vec());
    }
    
    let mut dp: Vec<Vec<usize>> = vec![vec![0;x];y];

    for i in 0 .. x {
      if fv[0][i] != 1 { dp[0][i] = 1; }
    }

    for i in 1 .. y {
      for j in 0 .. x {
        if fv[i][j] == 0 {
          if j > 0 && fv[i-1][j-1] == 0 {
            dp[i][j] += dp[i-1][j-1];
          }
          if fv[i-1][j] == 0 {
            dp[i][j] += dp[i-1][j];
          }
          if j + 1 < x && fv[i-1][j+1] == 0 {
            dp[i][j] += dp[i-1][j+1];
          }
          if i > 1 && fv[i-2][j] == 2 {
            dp[i][j] += dp[i-2][j];
          }
        } else if fv[i][j] == 2 {
          if fv[i-1][j] == 0 {
            dp[i][j] += dp[i-1][j];
          }
          if i > 1 && fv[i-2][j] == 2 {
            dp[i][j] += dp[i-2][j];
          }
        }
      }
    }
    
    let mut ans: usize = 0;

    for i in 0 .. x {
      ans += dp[y-1][i];
    }

    if y > 1 {
      for i in 0 .. x {
        if fv[y-2][i] == 2 {
          ans += dp[y-2][i];
        }
      }
    }

    println!("{}", ans);
  }
}

fn read_vec<T>() -> Vec<T>
  where T: std::str::FromStr,
        T::Err: std::fmt::Debug
{
  let mut buf = String::new();
  std::io::stdin().read_line(&mut buf).expect("failed to read");
  buf.split_whitespace().map(|e| e.parse().unwrap()).collect()
}

