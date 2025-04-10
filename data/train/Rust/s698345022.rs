use std::collections::VecDeque;

fn main(){
  loop {
    let nm: Vec<usize> = read_vec();
    let n = nm[0];
    let m = nm[1];

    if n == 0 && m == 0 { break; }

    let mut mp: Vec<Vec<char>> = vec![vec!['.'; n+2]; m+2];
    let mut dv: Vec<Vec<usize>> = vec![vec![10000; n+2]; m+2];
    
    let mut si: usize = 0;
    let mut sj: usize = 0;
    
    for i in 1 .. m+1 {
      let ts: String = read();
      let tl: Vec<char> = ts.chars().collect();
      for j in 1 .. n+1 {
        mp[i][j] = tl[j-1];
        if mp[i][j] == '&' { si = i; sj = j; }
      }
    }
    
    dv[si][sj] = 0;
    
    let mut que: VecDeque<(usize, usize)> = VecDeque::new();
    que.push_back((si, sj));
    
    let d: Vec<(isize, isize)> = vec![(1,0),(-1, 0), (0, 1), (0, -1)];
    
    loop {
      match que.pop_front() {
        None => { break; },
        Some((i, j)) => {
          for &(di, dj) in &d {
            let ti = (i as isize) + di;
            let tj = (j as isize) + dj;
            if ti < 0 || tj < 0 || ti > (m as isize)+1 || tj > (n as isize)+1 { continue; }
            let ni: usize = ti as usize;
            let nj: usize = tj as usize;
            let tc: usize =  dv[i][j] + if mp[i][j] != '#' && mp[ni][nj] == '#' {1} else {0};
            if tc < dv[ni][nj] {
              dv[ni][nj] = tc;
              que.push_back((ni, nj));
            }
          }
        },
      }
    }
    println!("{}", dv[0][0]);
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

