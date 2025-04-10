use std::collections::BinaryHeap;
use std::collections::VecDeque;

fn main(){

  let mut seat: Vec<usize> = vec![0; 18];

  for i in 0 .. 17 {
    seat[i] = 17 - i;
  }

  let mut tm: usize = 0;

  let mut que: VecDeque<usize> = VecDeque::new();
  
  let mut bh: BinaryHeap<(i32, usize, usize)> = BinaryHeap::new();
  
  seat[0] = 0;
  seat[1] = 0;

  let et: i32 = -1 * ((tm + meal_time(0)) as i32);
  bh.push((et, 0, 0));

  let mut rslt: Vec<usize> = vec![0;100];

  let mut ext: bool = false;
  
  loop {
    tm += 1;

    loop {
      match bh.peek() {
        Some(&(tpt, ti, tsn)) => {
          let tt: usize = (-1 * tpt) as usize;
  
          if tt == tm {
            for i in tsn .. tsn + num_member(ti) {
              seat[i] = 1;
            }
            for i in (0..17).rev() {
              if seat[i] != 0 {
                seat[i] = seat[i+1] + 1;
              }
            }
            bh.pop();
          } else { break; }
        },
        None => { break; }
      }
    }
    
    if tm % 5 == 0  && tm < 500{
      que.push_back(tm / 5);
    }

    loop {
      match que.front() {
        Some(&ti) => {
          let tn = num_member(ti);
          match find_seat(&seat, tn) {
            Some(tsi) => {
              for i in tsi .. tsi + tn {
                seat[i] = 0;
              }
              que.pop_front();
              rslt[ti] = tm - 5 * ti;

              let pt: i32 = -1 * ((tm + meal_time(ti)) as i32);
              bh.push((pt, ti, tsi));
              
              if ti == 99 { ext = true; }
            },
            None => { break; }
          }
        },
        None => { break; }
      }
    }
    if ext { break; }
  }

  loop {
    let mut buf = String::new();
    
    if let Ok(c) = std::io::stdin().read_line(&mut buf) {
      if c == 0 { break; }
    }

    let n: usize = buf.trim().parse().unwrap();
    println!("{}", rslt[n]);
  }
}

fn num_member(i: usize) -> usize {
  if i % 5 == 1 { 5 } else { 2 }
}

fn meal_time(i: usize) -> usize {
  17 * (i % 2) + 3 * (i % 3) + 19
}

fn find_seat(st: &Vec<usize>, t: usize) -> Option<usize> {
  for i in 0 .. 17 {
    if st[i] >= t {
      return Some(i)
    }
  }
  None
}

