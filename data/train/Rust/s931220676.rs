fn main(){
  loop {
    let nc: Vec<usize> = read_vec();
    let n = nc[0];
    let c = nc[1];

    if n == 0 && c == 0 { break; }

    let mut lt: Vec<usize> = Vec::new();
    let mut bt: Vec<usize> = Vec::new();
    
    for _ in 0 .. n {
      let a: Vec<usize> = read_vec();
      let an: usize = a.iter().fold(0, |acc, x| acc * 2 + x);
      lt.push(an);
    }

    for _ in 0 .. c {
      let b: Vec<usize> = read_vec();
      let bn: usize = b.iter().fold(0, |acc, x| acc * 2 + x);
      bt.push(bn);
    }

    let mut pt: Vec<isize> = vec![-1 ; 65536];
    pt[0] = 0;
    
    for h in 0 .. n {
      let mut npt: Vec<isize> = vec![-1 ; 65536];
      
      for i in 0 .. 65536 {
        if pt[i] >= 0 {
          let ni: usize = i | lt[h];
          
          for j in 0 .. c {
            let mut p: isize = 0;
            let mut nni: usize = 0;
            
            for k in (0 .. 16).rev() {
              if bt[j] & (1 << k) > 0 && ni & (1 << k) > 0 {
                p += 1;
                nni *= 2;
              } else if ni & (1 << k) > 0 {
                nni = nni * 2 + 1;
              } else {
                nni *= 2;
              }
            }

            if pt[i] + p > npt[nni] {
              npt[nni] = pt[i] + p;
            }
          }
        }
      }
      pt = npt;
    }
    let ans: &isize = pt.iter().max().unwrap();
    println!("{}", *ans);
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

