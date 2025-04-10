use std::collections::BinaryHeap;

fn main(){
  let nrl: Vec<usize> = read_vec();
  let n = nrl[0];
  let r = nrl[1];
  let l = nrl[2];

  let mut ptm: usize = 0;
  let mut pid: usize = 1;
  let mut cpt: Vec<isize> = vec![0;n+1];
  let mut ttm: Vec<usize> = vec![0;n+1];

  let mut hp: BinaryHeap<(isize, isize)> = BinaryHeap::new();

  for i in 1 .. n+1 {
    hp.push((0, -1 * (i as isize)));
  }

  for _ in 0 .. r {
    let dtx: Vec<isize> = read_vec();
    let d = dtx[0] as usize;
    let t = dtx[1] as usize;
    let x = dtx[2];

    ttm[pid] += t - ptm;

    cpt[d] += x;
    hp.push((cpt[d], -1 * (d as isize)));

    let mut mp = *hp.peek().unwrap();

    loop {
      if cpt[(mp.1 * -1) as usize] == mp.0 { break; }
      hp.pop();
      mp = *hp.peek().unwrap();
    }
    
    ptm = t;
    pid = (mp.1 * -1) as usize;
  }

  ttm[pid] += l - ptm;

  let mut mid: usize = 1;
  let mut mt: usize = ttm[1];

  for i in 2 .. n+1 {
    if mt < ttm[i] {
      mt = ttm[i];
      mid = i;
    }
  }

  println!("{}", mid);
}

fn read_vec<T>() -> Vec<T>
  where T: std::str::FromStr,
        T::Err: std::fmt::Debug
{
  let mut buf = String::new();
  std::io::stdin().read_line(&mut buf).expect("failed to read");
  buf.split_whitespace().map(|e| e.parse().unwrap()).collect()
}

