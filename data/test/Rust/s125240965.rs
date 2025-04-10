use std::collections::HashMap;

fn main(){
  let n: usize = read();

  for t in 0 .. n {
    let mut sdv: Vec<Vec<u32>> = Vec::new();
    let mut stv: Vec<Vec<char>> = vec![vec![' ';9];9];
  
    for _ in 0 .. 9 {
      sdv.push(read_vec());
    }

    for i in 0 .. 9 {
      let mut hm1: HashMap<u32, (usize, usize)> = HashMap::new();
      let mut hm2: HashMap<u32, (usize, usize)> = HashMap::new();
      for j in 0 .. 9 {
        match hm1.get(&sdv[i][j]) {
          Some(&(u, v)) => {
            stv[i][j] = '*';
            stv[u][v] = '*';
          },
          None => {
            hm1.insert(sdv[i][j], (i, j));
          },
        }
        match hm2.get(&sdv[j][i]) {
          Some(&(u, v)) => {
            stv[j][i] = '*';
            stv[u][v] = '*';
          },
          None => {
            hm2.insert(sdv[j][i], (j, i));
          },
        }
      }
    }
    
    for bi in 0 .. 3 {
      for bj in 0 .. 3 {
        let mut hm: HashMap<u32, (usize, usize)> = HashMap::new();
        for i in 0 .. 3 {
          for j in 0 .. 3 {
            let ii = bi * 3 + i;
            let jj = bj * 3 + j;
            match hm.get(&sdv[ii][jj]) {
              Some(&(u, v)) => {
                stv[ii][jj] = '*';
                stv[u][v] = '*';
              },
              None => {
                hm.insert(sdv[ii][jj], (ii, jj));
              },
            }
          }
        }
      }
    }
    if t > 0 { println!(""); }

    for i in 0 .. 9 {
      for j in 0 .. 9 {
        print!("{}{}", stv[i][j], sdv[i][j]);
        if j == 8 { println!(""); }
      }
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

