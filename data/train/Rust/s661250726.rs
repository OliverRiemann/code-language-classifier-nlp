use std::collections::VecDeque;
use std::collections::HashSet;

fn main(){
  loop {
    let wh: Vec<usize> = read_vec();
    let w = wh[0];
    let h = wh[1];
    
    if w == 0 && h == 0 { break; }
    
    let txy: Vec<usize> = read_vec();
    let tx = txy[0] - 1;
    let ty = txy[1] - 1;
    let kxy: Vec<usize> = read_vec();
    let kx = kxy[0] - 1;
    let ky = kxy[1] - 1;
    let mut d : Vec<Vec<usize>> = Vec::new();
    
    for _ in 0 .. h {
      d.push(read_vec());
    }
    
    let mut que: VecDeque<((usize, usize), (usize, usize), usize)> = VecDeque::new();
    let mut set: HashSet<(usize, usize, usize, usize)> = HashSet::new();

    que.push_back(((tx, ty), (kx, ky), 0));
    set.insert((tx, ty, kx, ky));

    loop {
      match que.pop_front() {
        Some(((x1, y1), (x2, y2), wk)) => {
          if wk >= 100 { continue; }
          
          if x1 == x2 && y1 == y2 {
            println!("{}", wk);
            break;
          }
          
          let nx1 = if x1 < w - 1 && d[y1][x1+1] == 0 { x1 + 1 } else { x1 };
          let nx2 = if x2 > 0 && d[y2][x2-1] == 0 { x2 - 1 } else { x2 };
          if !set.contains(&(nx1, y1, nx2, y2)) {
            que.push_back(((nx1, y1), (nx2, y2), wk + 1));
            set.insert((nx1, y1, nx2, y2));
          }
          
          let nx1 = if x1 > 0 && d[y1][x1-1] == 0 { x1 - 1 } else { x1 };
          let nx2 = if x2 < w - 1 && d[y2][x2+1] == 0 { x2 + 1 } else { x2 };
          if !set.contains(&(nx1, y1, nx2, y2)) {
            que.push_back(((nx1, y1), (nx2, y2), wk + 1));
            set.insert((nx1, y1, nx2, y2));
          }
          
          let ny1 = if y1 < h - 1 && d[y1+1][x1] == 0 { y1 + 1 } else { y1 };
          let ny2 = if y2 > 0 && d[y2-1][x2] == 0 { y2 - 1 } else { y2 };
          if !set.contains(&(x1, ny1, x2, ny2)) {
            que.push_back(((x1, ny1), (x2, ny2), wk + 1));
            set.insert((x1, ny1, x2, ny2));
          }
          
          let ny1 = if y1 > 0 && d[y1-1][x1] == 0 { y1 - 1 } else { y1 };
          let ny2 = if y2 < h - 1 && d[y2+1][x2] == 0 { y2 + 1 } else { y2 };
          if !set.contains(&(x1, ny1, x2, ny2)) {
            que.push_back(((x1, ny1), (x2, ny2), wk + 1));
            set.insert((x1, ny1, x2, ny2));
          }
        },
        None => {
          println!("NA");
          break;
        },
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

