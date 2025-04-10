use std::cmp;

fn main(){
  loop {
    let nk: Vec<usize> = read_vec();
    let n = nk[0];
    let k = nk[1];

    if n == 0 && k == 0 { break; }

    let mut cv: Vec<bool> = vec![false; n+1];

    for _ in 0 .. k {
      let c: usize = read();
      cv[c] = true;
    }

    let mut mxl: usize = 1;
    let mut av: Vec<usize> = vec![0; n+1];
    
    if cv[0] {
      for i in 1 .. n+1 {
        if cv[i] {
          if cv[i-1] {
            av[i] = av[i-1] + 1;
          } else {
            av[i] = 1;
          }
        }
      }
      
      let mut mv: Vec<usize> = vec![0; n+1];

      mv[n] = av[n];
      
      for i in (1 .. n).rev() {
        if av[i] > 0 {
          if av[i+1] > 0 {
            mv[i] = mv[i+1];
          } else {
            mv[i] = av[i];
          }
        }
      }

      for i in 1 .. n+1 {
        if !cv[i] {
          let s = 1 +
                  if i > 1 { mv[i-1] } else { 0 } +
                  if i < n { mv[i+1] } else { 0 };
          mxl = cmp::max(mxl, s);
        }
      }
    } else {
      for i in 1 .. n+1 {
        if cv[i] {
          if cv[i-1] {
            av[i] = av[i-1] + 1;
            mxl = cmp::max(mxl, av[i]);
          } else {
            av[i] = 1;
          }
        }
      }
    }
    
    println!("{}", mxl);
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

