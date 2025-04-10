use std::collections::VecDeque;
use std::collections::HashMap;

fn main(){
  let dv: Vec<i32> = vec![-4, 1, 4, -1];
  
  let mut que: VecDeque<(Vec<u32>, i32, u32)> = VecDeque::new();
  let mut mp: HashMap<u32, u32> = HashMap::new();

  let v0: Vec<u32> = vec![0, 1, 2, 3, 4, 5, 6, 7];
  
  mp.insert(hash(&v0), 0);
  que.push_back((v0, 0, 0));
    
  loop {
    match que.pop_front() {
      Some((v, i, c)) => {
        for d in &dv {
          let ni = i + d;
            
          if ni >= 0 && ni <= 7 &&
             (i != 3 || ni != 4) &&
             (i != 4 || ni != 3) {
            let mut nv: Vec<u32> = v.clone();
            nv[i as usize] = v[ni as usize];
            nv[ni as usize] = v[i as usize];
            let nh = hash(&nv);
            
            if !mp.contains_key(&nh) {
              mp.insert(nh, c + 1);
              que.push_back((nv, ni, c + 1));
            }
          }
        }
      },
      None => { break; }
    }
  }
  
  loop {
    let mut buf = String::new();
    
    if let Ok(c) = std::io::stdin().read_line(&mut buf) {
      if c < 15 { break; }
    }

    let v: Vec<u32> = buf.split_whitespace().map(|e| e.parse().unwrap()).collect();
    let h: u32 = hash(&v);
    println!("{}", mp.get(&h).unwrap());
  }
}

fn hash(v: &Vec<u32>) -> u32{
  v.iter().fold(0, |s, a| s * 10 + a)
}

