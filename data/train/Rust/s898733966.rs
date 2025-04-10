fn main(){
  let n: usize = read();
  let inf: usize = 100000;
  let mut rv: Vec<Vec<usize>> = vec![vec![inf;n];n];
  
  for _ in 0 .. n {
    let rkt: Vec<usize> = read_vec();
    let r = rkt[0] - 1;
    for t in rkt.iter().skip(2) {
      rv[r][t-1] = 1;
    }
  }

  for k in 0 .. n {
    for i in 0 .. n {
      for j in 0 .. n {
        if rv[i][j] > rv[i][k] + rv[k][j] {
          rv[i][j] = rv[i][k] + rv[k][j];
        }
      }
    }
  }

  let p: usize = read();

  for _ in 0 .. p {
    let sdv: Vec<usize> = read_vec();
    let s = sdv[0] - 1;
    let d = sdv[1] - 1;
    let v = sdv[2];

    if v > rv[s][d] {
      println!("{}", rv[s][d] + 1);
    } else {
      println!("NA");
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

