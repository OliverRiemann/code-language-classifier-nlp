use std::cmp;

fn main(){
  loop {
    let n: usize = read();
    if n == 0 { break; }

    let mut mt: Vec<Vec<usize>> = Vec::new();
    
    for _ in 0 .. n {
      mt.push(read_vec());
    }
    
    let m: usize = read();
    
    for _ in 0 .. m {
      mt.push(read_vec());
    }
    
    mt.sort();

    let mut dp: Vec<usize> = vec![1;n+m];

    for i in 1 .. n+m {
      for j in 0 .. i {
        if mt[i][1] > mt[j][1] && mt[i][0] > mt[j][0] {
          dp[i] = cmp::max(dp[i], dp[j]+1);
        }
      }
    }
    
    println!("{}", dp.iter().max().unwrap());
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

