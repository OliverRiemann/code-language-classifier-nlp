use std::cmp::{max, min};
use std::collections::{HashMap, HashSet};
use std::process::exit;

const MOD: usize = 1000000007;

pub struct IO<R, W: std::io::Write>(R, std::io::BufWriter<W>);

impl<R: std::io::Read, W: std::io::Write> IO<R, W> {
    pub fn new(r: R, w: W) -> IO<R, W> {
        IO(r, std::io::BufWriter::new(w))
    }
    pub fn write<S: std::ops::Deref<Target = str>>(&mut self, s: S) {
        use std::io::Write;
        self.1.write(s.as_bytes()).unwrap();
    }
    pub fn read<T: std::str::FromStr>(&mut self) -> T {
        use std::io::Read;
        let buf = self
            .0
            .by_ref()
            .bytes()
            .map(|b| b.unwrap())
            .skip_while(|&b| b == b' ' || b == b'\n' || b == b'\r' || b == b'\t')
            .take_while(|&b| b != b' ' && b != b'\n' && b != b'\r' && b != b'\t')
            .collect::<Vec<_>>();
        unsafe { std::str::from_utf8_unchecked(&buf) }
            .parse()
            .ok()
            .expect("Parse error.")
    }
    pub fn vec<T: std::str::FromStr>(&mut self, n: usize) -> Vec<T> {
        (0..n).map(|_| self.read()).collect()
    }
    pub fn chars(&mut self) -> Vec<char> {
        self.read::<String>().chars().collect()
    }
}
// =========
#[derive(Debug)]
struct UnionFind {
    // size= 親ならサイズ,その他は未定義. table=親を指す
    size: Vec<usize>,
    table: Vec<usize>,
}
impl UnionFind {
    fn new(n: usize) -> Self {
        let size = vec![1; n];
        let mut table = vec![0; n];
        for i in 0..n {
            table[i] = i;
        }

        UnionFind { table: table, size }
    }
}
impl UnionFind {
    fn root(&mut self, x: usize) -> usize {
        if self.table[x] == x {
            x
        } else {
            let tmp = self.table[x];
            self.table[x] = self.root(tmp);
            self.table[x]
        }
    }
    fn same(&mut self, a: usize, b: usize) -> bool {
        self.root(a) == self.root(b)
    }

    fn union(&mut self, a: usize, b: usize) -> () {
        let a_root = self.root(a);
        let b_root = self.root(b);
        if a_root == b_root {
            return ();
        }
        // ここは工夫していない思考停止でbにマージ
        self.table[a_root] = b_root;
        self.size[b_root] += self.size[a_root];
    }
    // 親のサイズを返す
    fn size(&mut self, x: usize) -> usize {
        let ri = self.root(x);
        self.size[ri]
    }
}

fn main() {
    let (r, w) = (std::io::stdin(), std::io::stdout());
    let mut sc = IO::new(r.lock(), w.lock());
    'outer: loop {
        let n: usize = sc.read();
        if n == 0 {
            break;
        }

        let mut uf = UnionFind::new(26);
        let mut deg = vec![0; 26];
        let mut alp = HashSet::<usize>::new();
        for _ in 0..n {
            let s: String = sc.read();
            let s = s.as_bytes();
            let start = (s[0] - 'a' as u8) as usize;
            let end = (s[s.len() - 1] - 'a' as u8) as usize;
            alp.insert(start);
            alp.insert(end);
            deg[start] += 1;
            deg[end] -= 1;
            uf.union(start, end);
        }
        for a in &alp {
            if deg[*a] != 0 || uf.size(*a) != alp.len() {
                println!("NG");
                continue 'outer;
            }
        }
        println!("OK");
    }
}
