use std::cmp::Ordering;
use std::collections::BinaryHeap;

fn main(){
  let nq: Vec<usize> = read_vec();
  let n = nq[0];
  let q = nq[1];
  
  let mut cnt: Vec<i32> = vec![0;n];
  let mut bh = BinaryHeap::new();
  
  for _ in 0 .. q {
    let av: Vec<i32> = read_vec();
    let a = av[0] as usize - 1;
    let v = av[1];
    
    cnt[a] = cnt[a] + v;
    bh.push(Angler{a:a, v:cnt[a]});
    
    loop {
      let &ang = bh.peek().unwrap();

      if cnt[ang.a] == ang.v {
        println!("{} {}", ang.a + 1, ang.v);
        break;
      }
      
      bh.pop();
    }
  }
}

#[derive(Eq, PartialEq, Debug, Copy, Clone)]
struct Angler {
  a: usize,
  v: i32,
}

impl Ord for Angler {
  fn cmp(&self, other: &Angler) -> Ordering {
    if self.v == other.v {other.a.cmp(&self.a)} else {self.v.cmp(&other.v)}
  }
}

impl PartialOrd for Angler {
  fn partial_cmp(&self, other: &Angler) -> Option<Ordering> {
    Some(self.cmp(other))
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

