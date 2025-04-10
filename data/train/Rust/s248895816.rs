fn main(){
  loop {
    let n: usize = read();
    if n == 0 { break; }

    let mut fd: Vec<(String, usize, usize)> = Vec::new();

    for _ in 0 .. n {
      let buf: Vec<String> = read_vec();
      fd.push((buf[0].parse().unwrap(), buf[1].parse().unwrap(), buf[2].parse().unwrap()));
    }

    let mut iv: Vec<usize> = (0..n).collect();

    let mut miv: Vec<usize> = vec![0;n];
    let mut mcg: usize = 100000;

    if let Some(cg) = calc_cg(&fd, &iv) {
      if mcg > cg {
        mcg = cg;
        miv = iv.clone();
      }
    }
    
    while next_permutation(&mut iv) {
      if let Some(cg) = calc_cg(&fd, &iv) {
        if mcg > cg {
          mcg = cg;
          miv = iv.clone();
        }
      }
    }

    for i in miv {
      println!("{}", fd[i].0);
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

fn next_permutation(v: &mut Vec<usize>) -> bool {
  let ln = v.len();
  let mut u: usize = ln;
  for i in (0 .. ln-1).rev() {
    if v[i] < v[i+1] { u = i; break;}
  }
  if u == ln { false }
  else {
    let mut w: usize = u + 1;
    for i in (u+1 .. ln).rev() {
      if v[i] > v[u] { w = i; break; }
    }
    v.swap(u, w);
    u += 1;
    w = ln - 1;
    while u < w {
      v.swap(u, w);
      u += 1;
      w -= 1;
    }
    true
  }
}

fn calc_cg(fd: &Vec<(String, usize, usize)>, iv: &Vec<usize>) -> Option<usize> {
  let mut cg: Option<usize> = Some(0);
  let mut aw: usize = 0;
  
  for (i, &j) in iv.iter().enumerate().rev() {
    if fd[j].2 >= aw {
      aw += fd[j].1;
      cg = Some (cg.unwrap() + (i + 1) * fd[j].1);
    } else {
      cg = None;
      break;
    }
  }
  
  cg
}

