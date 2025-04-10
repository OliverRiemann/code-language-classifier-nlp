fn main(){
  loop {
    let nm: Vec<usize> = read_vec();
    let n = nm[0];
    let m = nm[1];

    if n == 0 && m == 0 { break; }
  
    let mut wv: Vec<Vec<isize>> = Vec::new();
  
    for _ in 0 .. n {
      wv.push(read_vec());
    }
  
    let mut pv: Vec<Vec<Vec<isize>>> = vec![vec![vec![0;m];m];4];
  
    for i in 0 .. m {
      let t: Vec<isize> = read_vec();
      for j in 0 .. m {
        pv[0][i][j] = t[j];
      }
    }
  
    for k in 1 .. 4 {
      for i in 0 .. m {
        for j in 0 .. m {
          pv[k][j][m-i-1] = pv[k-1][i][j];
        }
      }
    }

    let mut ofs: Vec<usize> = vec![0;4];

    for k in 0 .. 4 {
      for i in (0 .. m).rev() {
        if pv[k][0][i] >= 0 { ofs[k] = i; }
      }
    }

    let mut ans: (usize, usize) = (n, n);

    for y in 0 .. n - m + 1 {
      for x in 0 .. n - m + 1 {
        for r in 0 .. 4 {
          if equal(&wv, &pv, r, y, x) && ans > (y, x + ofs[r]) {
            ans = (y, x + ofs[r]);
          }
        }
      }
    }

    if ans == (n, n) {
      println!("NA");
    } else {
      println!("{} {}", ans.1 + 1, ans.0 + 1);
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

fn equal(w: &Vec<Vec<isize>>, p: &Vec<Vec<Vec<isize>>>, r: usize, y: usize, x: usize) -> bool {
  let m = p[0][0].len();
  let mut ret = true;

  for i in 0 .. m {
    for j in 0 .. m {
      if p[r][i][j] >= 0 && w[y+i][x+j] != p[r][i][j] { ret = false; }
    }
  }
  ret
}

