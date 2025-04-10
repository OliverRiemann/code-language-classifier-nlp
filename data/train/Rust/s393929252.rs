use std::cmp;

fn main(){
  let n: usize = read();
  let m: usize = read();

  let mut dm: Vec<Vec<u32>> = vec![vec![std::u32::MAX / 4;n];n];
  
  for _ in 0 .. m {
    let abcd: Vec<u32> = read_vec();
    let a = (abcd[0] - 1) as usize;
    let b = (abcd[1] - 1) as usize;
    let c = abcd[2];
    let d = abcd[3];
    dm[a][b] = c;
    dm[b][a] = d;
  }

  let sgvp: Vec<u32> = read_vec();
  let s = (sgvp[0] - 1) as usize;
  let g = (sgvp[1] - 1) as usize;
  let v = sgvp[2];
  let p = sgvp[3];
  
  for k in 0 .. n {
    for i in 0 .. n {
      for j in 0 .. n {
        dm[i][j] = cmp::min(dm[i][j], dm[i][k] + dm[k][j]);
      }
    }
  }

  let ans: u32 = v - p - dm[s][g] - dm[g][s];
  
  println!("{}", ans);
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
  buf.trim().split(',').map(|e| e.parse().unwrap()).collect()
}

