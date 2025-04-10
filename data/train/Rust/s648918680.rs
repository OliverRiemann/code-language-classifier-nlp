fn main(){
  let inf: usize = 200000000;
  
  loop {
    let nk: Vec<usize> = read_vec();
    let n = nk[0];
    let k = nk[1];

    if n == 0 && k == 0 { break; }

    let mut ntu = false;
    let mut dist: Vec<Vec<usize>> = vec![vec![inf; n]; n];
    
    for i in 0 .. n {
      dist[i][i] = 0;
    }
    
    for _ in 0 .. k {
      let q: Vec<usize> = read_vec();

      if q[0] == 0 {
        let a = q[1] - 1;
        let b = q[2] - 1;

        if ntu {
          wf(&mut dist, n);
          ntu = false;
        }
        
        if dist[a][b] == inf {
          println!("-1");
        } else {
          println!("{}", dist[a][b]);
        }
      } else {
        let c = q[1] - 1;
        let d = q[2] - 1;
        let e = q[3];

        if dist[c][d] > e {
          dist[c][d] = e;
          dist[d][c] = e;
          ntu = true;
        }
      }
    }
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

fn wf(d: &mut Vec<Vec<usize>>, n: usize) {
  for k in 0 .. n {
    for i in 0 .. n {
      for j in 0 .. n {
        let t = d[i][k] + d[k][j];
        if t < d[i][j] {
          d[i][j] = t;
        }
      }
    }
  }
}

