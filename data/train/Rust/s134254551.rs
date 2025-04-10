use std::collections::HashSet;

fn main(){
  loop {
    let n: usize = read();

    if n == 0 { break; }

    let mut adj: Vec<Vec<usize>> = vec![vec![0;26];26];
    let mut set: HashSet<usize> = HashSet::new();
    let mut uf: UnionFind = UnionFind::new(26);
    
    for _ in 0 .. n {
      let s:String = read();
      let h = s.chars().next().unwrap() as usize - 97;
      let t = s.chars().last().unwrap() as usize - 97;
      adj[h][t] += 1;
      set.insert(h);
      set.insert(t);
      uf.unite(h, t);
    }

    let mut link = true;
    let sl = set.len();
    
    for i in set.iter() {
      if sl != uf.size(*i) {
        link = false;
        break;
      }
    }

    let mut eg = true;

    for i in 0 .. 26 {
      let mut sr = 0;
      for j in 0 .. 26 {
        sr += adj[i][j];
      }
      let mut sc = 0;
      for j in 0 .. 26 {
        sc += adj[j][i];
      }
      if sr != sc {
        eg = false;
        break;
      }
    }
    
    println!("{}", if link && eg { "OK" } else { "NG" });

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

#[derive(Debug)]
struct UnionFind {
  p: Vec<isize>
}

#[allow(dead_code)]
impl UnionFind {
  fn new(n: usize) -> UnionFind {
    UnionFind {
      p: vec![-1;n]
    }
  }

  fn root(&mut self, a: usize) -> usize {
    let u = self.p[a];
    if u < 0 { a }
    else {
      let rt = self.root( u as usize);
      self.p[a] = rt as isize;
      rt
    }
  }

  fn unite(&mut self, a: usize, b: usize){
    let ra = self.root(a);
    let rb = self.root(b);

    if ra != rb {
      if self.p[ra] < self.p[rb] {
        self.p[ra] = self.p[ra] + self.p[rb];
        self.p[rb] = ra as isize;
      } else {
        self.p[rb] = self.p[ra] + self.p[rb];
        self.p[ra] = rb as isize;
      }
    }
  }

  fn same(&mut self, a: usize, b:usize) -> bool {
    self.root(a) == self.root(b)
  }

  fn size(&mut self, a: usize) -> usize {
    let ra = self.root(a);
    (-1 * self.p[ra]) as usize
  }
}

