fn main(){
  loop {
    let xyz: Vec<usize> = read_vec();
    let x = xyz[0];
    let y = xyz[1];
    let z = xyz[2];

    if x == 0 && y == 0 && z == 0 { break; }
    
    let v: Vec<usize> = read_vec();

    let mut bd: Vec<(usize, usize)> = vec![(0, 0);y+1];
    
    for _ in 0 .. z {
      let nea: Vec<usize> = read_vec();
      let n = nea[0];
      let e = nea[1];
      let a = nea[2];
      bd[n] = (e, a);
    }

    let mut dp: Vec<Vec<f64>> = vec![vec![0.0 ; 5000] ; y + 1];
    dp[0][0] = 1.0;

    for i in 0 .. y {
      for j in 0 .. 5000 {
        for k in 0 .. x {
          let ni = if i + v[k] < y { i + v[k] } else { y };
          match bd[ni] {
            (1, a) => {
              let nni = if ni + a < y { ni + a } else { y };
              dp[nni][j] += dp[i][j] / (x as f64);
            },
            (2, a) => {
              if j + a < 5000 {
                dp[ni][j + a] += dp[i][j] / (x as f64);
              }
            },
            (3, a) => {
              dp[ni][if j > a { j - a } else { 0 }] += dp[i][j] / (x as f64);
            },
            (_, _) => {
              dp[ni][j] += dp[i][j] / (x as f64);
            },
          }
        }
      }
    }

    let ans: f64 = dp[y].iter().enumerate().map(|(i, &j)| (i as f64) * j).sum();
    println!("{}", ans as usize);
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

