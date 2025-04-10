fn main(){
  let n: u32 = read();

  for _ in 0 .. n {
    let mut v: Vec<Vec<usize>> = Vec::new();
    
    v.push(vec![0; 10]);
    
    for _ in 0 .. 10 {
      v.push(read_vec());
    }

    for i in 0 .. 1024 {
      let mut cv = v.clone();
      for j in 0 .. 10 {
        if i & (1 << j) > 0 {
          cv[0][j] = 1;
        } else {
          cv[0][j] = 0;
        }
      }
      match pass(&mut cv) {
        Some(ans) => {print_vec(&ans); break;},
        None => {},
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

fn print_vec(v: &Vec<Vec<usize>>) -> (){
  let l = v[0].len();

  for x in v {
    for i in 0 .. l {
      if i == l - 1 {
        println!("{}", x[i]);
      } else {
        print!("{} ", x[i]);
      }
    }
  }
}

fn pass(v: &mut Vec<Vec<usize>>) -> Option<Vec<Vec<usize>>> {
  let mut ans: Vec<Vec<usize>> = vec![vec![0; 10]; 10];
  let dv: Vec<(isize, isize)> = vec![(0, 0), (-1, 0), (1, 0), (0, -1), (0, 1)];
  
  for i in 1 .. 11 {
    for j in 0 .. 10 {
      if v[i-1][j] == 1 {
        ans[i-1][j] = 1;
        for &(di, dj) in &dv {
          let ni = i as isize + di;
          let nj = j as isize + dj;
          if ni >= 0 && ni <= 10 && nj >= 0 && nj <= 9 {
            v[ni as usize][nj as usize] = 1 - v[ni as usize][nj as usize];
          }
        }
      }
    }
  }
  
  if v[10] == vec![0; 10] {
    Some(ans)
  } else {
    None
  }
}

