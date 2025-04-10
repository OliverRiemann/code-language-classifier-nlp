fn main(){
  let nmq: Vec<usize> = read_vec();
  let n = nmq[0];
  let m = nmq[1];
  let q = nmq[2];

  let av: Vec<usize> = read_vec();
  let qv: Vec<usize> = read_vec();

  let mut ll: Vec<usize> = vec![0;n];
  let mut rl: Vec<usize> = vec![0;n];

  rl[0] = n - 1;
  ll[n-1] = 0;

  for i in 1 .. n {
    rl[i] = i - 1;
  }

  for i in 0 .. n-1 {
    ll[i] = i + 1;
  }

  let mut cbt = 0;
  
  for i in 0 .. m {
    cbt = pass(&mut ll, &mut rl, av[i], cbt);
  }

  for i in 0 .. q {
    println!("{}", if ll[qv[i]] == 200000 { 0 } else { 1 });
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

fn pass(ll: &mut Vec<usize>, rl: &mut Vec<usize>, a: usize, bt: usize) -> usize {
  let mut t = bt;
  
  if a % 2 == 0 {
    for _ in 0 .. a {
      t = ll[t];
    }
  } else {
    for _ in 0 .. a {
      t = rl[t];
    }
  }
  
  let tl = ll[t];
  let tr = rl[t];
  rl[tl] = tr;
  ll[tr] = tl;
  rl[t] = 200000;
  ll[t] = 200000;
  tl
}

