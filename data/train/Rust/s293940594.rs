use std::cmp;

fn main(){
  let n: usize = read();

  let mut a: Vec<Vec<i32>> = vec![vec![0;n+1];n];

  for i in 0 .. n {
    let t: Vec<i32> = read_vec();
    for j in 0 .. n {
      a[i][j+1] = a[i][j] + t[j];
    }
  }

  let mut mxv: i32 = std::i32::MIN;
  
  for i in 0 .. n {
    for j in i+1 .. n+1 {
      let mut ac: i32 = a[0][j] - a[0][i];
      mxv = cmp::max(mxv, ac);
      
      for k in 1 .. n {
        let s: i32 = a[k][j] - a[k][i];
        ac = cmp::max(ac+s, s);
        mxv = cmp::max(mxv, ac);
      }
    }
  }
  
  println!("{}", mxv);
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

