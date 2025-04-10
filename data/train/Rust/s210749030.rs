use std::collections::VecDeque;
use std::collections::HashSet;

fn main(){
  let n: usize = read();

  for _ in 0 .. n {
    let pv: Vec<usize> = read_vec();

    let mut que: VecDeque<(usize, Vec<usize>)> = VecDeque::new();
    let mut hs: HashSet<Vec<usize>> = HashSet::new();

    que.push_back((0, pv.clone()));
    hs.insert(pv.clone());

    loop {
      match que.pop_front() {
        Some((c, v)) => {
          if is_complete(&v) {
            println!("{}", c);
            break;
          }
          
          let nvf = rotf(&v);
          if !hs.contains(&nvf) {
            que.push_back((c+1, nvf.clone()));
            hs.insert(nvf.clone());
          }
          let nvr = rotr(&v);
          if !hs.contains(&nvr) {
            que.push_back((c+1, nvr.clone()));
            hs.insert(nvr.clone());
          }
          let nvl = rotl(&v);
          if !hs.contains(&nvl) {
            que.push_back((c+1, nvl.clone()));
            hs.insert(nvl.clone());
          }
          let nvb = rotb(&v);
          if !hs.contains(&nvb) {
            que.push_back((c+1, nvb.clone()));
            hs.insert(nvb.clone());
          }
        },
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

fn rotf(v: &Vec<usize>) -> Vec<usize> {
  let mut nv: Vec<usize> = v.iter().map(|x| x.clone()).collect();

  nv[6] = v[21]; nv[21] = v[6];
  nv[7] = v[22]; nv[22] = v[7];
  nv[8] = v[23]; nv[23] = v[8];
  
  nv[9] = v[11]; nv[11] = v[9];
  
  nv[17] = v[12]; nv[12] = v[17];
  
  nv
}

fn rotr(v: &Vec<usize>) -> Vec<usize> {
  let mut nv: Vec<usize> = v.iter().map(|x| x.clone()).collect();

  nv[2] = v[21]; nv[21] = v[2];
  nv[5] = v[24]; nv[24] = v[5];
  nv[8] = v[27]; nv[27] = v[8];
  
  nv[12] = v[14]; nv[14] = v[12];
  
  nv[11] = v[18]; nv[18] = v[11];
  
  nv
}

fn rotl(v: &Vec<usize>) -> Vec<usize> {
  let mut nv: Vec<usize> = v.iter().map(|x| x.clone()).collect();

  nv[0] = v[23]; nv[23] = v[0];
  nv[3] = v[26]; nv[26] = v[3];
  nv[6] = v[29]; nv[29] = v[6];
  
  nv[15] = v[17]; nv[17] = v[15];
  
  nv[9] = v[20]; nv[20] = v[9];
  
  nv
}

fn rotb(v: &Vec<usize>) -> Vec<usize> {
  let mut nv: Vec<usize> = v.iter().map(|x| x.clone()).collect();

  nv[0] = v[27]; nv[27] = v[0];
  nv[1] = v[28]; nv[28] = v[1];
  nv[2] = v[29]; nv[29] = v[2];
  
  nv[18] = v[20]; nv[20] = v[18];
  
  nv[14] = v[15]; nv[15] = v[14];
  
  nv
}

fn is_complete(v: &Vec<usize>) -> bool {
   v[4] == v[0] &&
   v[4] == v[1] &&
   v[4] == v[2] &&
   v[4] == v[3] &&
   v[4] == v[5] &&
   v[4] == v[6] &&
   v[4] == v[7] &&
   v[4] == v[8] &&
   v[10] == v[9] &&
   v[10] == v[11] &&
   v[13] == v[12] &&
   v[13] == v[14] &&
   v[16] == v[15] &&
   v[16] == v[17] &&
   v[19] == v[18] &&
   v[19] == v[20] &&
   v[25] == v[21] &&
   v[25] == v[22] &&
   v[25] == v[23] &&
   v[25] == v[24] &&
   v[25] == v[26] &&
   v[25] == v[27] &&
   v[25] == v[28] &&
   v[25] == v[29]
}

