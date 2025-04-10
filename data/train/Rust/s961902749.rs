use std::cmp;
use std::collections::VecDeque;

fn main(){
  loop {
    let n: usize = read();

    if n == 0 { break; }

    let mut wll: Vec<Vec<usize>> = Vec::new();

    wll.push(read_vec());
    wll.push(read_vec());
    
    let mut jmp: Vec<Vec<usize>> = vec![vec![10000;n];2];
    jmp[0][0] = 0;
    jmp[1][0] = 0;

    let mut que: VecDeque<(usize, usize)> = VecDeque::new();

    que.push_back((0, 0));
    que.push_back((1, 0));

    loop {
      match que.pop_front() {
        Some((p, i)) => {
          if i < n - 1 && wll[p][i] == 1 && wll[p][i+1] == 1 {
            if jmp[p][i] < jmp[p][i+1] {
              jmp[p][i+1] = jmp[p][i];
              que.push_back((p, i+1));
            }
          } else if wll[p][i] == 2 {
            if jmp[p][i] < jmp[p][i-1] {
              jmp[p][i-1] = jmp[p][i];
              que.push_back((p, i-1));
            }
          } else {
            if jmp[p][i] + 1 < jmp[1-p][i] {
              jmp[1-p][i] = jmp[p][i] + 1;
              que.push_back((1-p, i));
            }
            if i+1 < n && jmp[p][i] + 1 < jmp[1-p][i+1] {
              jmp[1-p][i+1] = jmp[p][i] + 1;
              que.push_back((1-p, i+1));
            }
            if i+2 < n && jmp[p][i] + 1 < jmp[1-p][i+2] {
              jmp[1-p][i+2] = jmp[p][i] + 1;
              que.push_back((1-p, i+2));
            }
          }
        },
        None => {
          if wll[0][n-1] == 2 && wll[1][n-1] == 2 ||
             wll[0][n-1] == 2 && jmp[1][n-1] == 10000 ||
             jmp[0][n-1] == 10000 && wll[1][n-1] == 2 ||
             jmp[0][n-1] == 10000 && jmp[1][n-1] == 10000 {
               println!("NA");
             } else {
               println!("{}", cmp::min(jmp[0][n-1], jmp[1][n-1]));
             }
          break;
        },
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

