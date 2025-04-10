fn main(){
  let nq: Vec<usize> = read_vec();
  let q = nq[1];

  let cv: Vec<usize> = read_vec();
  let mut sc: Vec<bool> = vec![false; 300001];

  for i in 0 .. cv.len() {
    sc[cv[i]] = true;
  }

  let mut nxt: Vec<usize> = vec![0; 300001];
  let mut tv: usize = 0;
  
  for i in 0 .. sc.len() {
    nxt[i] = tv;
    if sc[i] { tv = i; }
  }
  
  for _ in 0 .. q {
    let qi: usize = read();
    let mut i: usize = tv;
    let mut ans: usize = 0;

    while i > 0 {
      let r = i % qi;
      if ans < r { ans = r; }
      i = nxt[i-r];
    }

    println!("{}", ans);
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

