fn main(){
  loop {
    let n: u32 = read();

    if n == 0 { break; }
  
    let mut fld: Vec<Vec<usize>> = vec![vec![0; 5]; 5000];
    let mut pa: Vec<usize> = vec![0; 5];
    
    for _ in 0 .. n {
      let tv: Vec<usize> = read_vec();
      let d = tv[0];
      let p = tv[1];
      let q = tv[2] - 1;

      put_block(&mut fld, &mut pa, d, p, q);
    }

    let cnt: usize = count_block(&fld, &pa);

    println!("{}", cnt);
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

// fn print_field(fld: &Vec<Vec<usize>>, pa: &Vec<usize>){
//   let mp: &usize = pa.iter().max().unwrap();

//   println!("----------");
//   for i in (0..*mp).rev() {
//     println!("{:04}:{}{}{}{}{}", i, fld[i][0], fld[i][1], fld[i][2], fld[i][3], fld[i][4])
//   }
//   println!("----------");
// }

fn put_block(fld: &mut Vec<Vec<usize>>, pa: &mut Vec<usize>, d: usize, p: usize, q: usize) {
  if d == 1 {
    let mx: usize = (q..q+p).map(|i| pa[i]).max().unwrap();

    for i in q .. q + p {
      fld[mx][i] = 1;
      pa[i] = mx + 1;
    }

    if fld[mx].iter().all(|i| *i == 1) {
      let tp: usize = (0..5).map(|i| pa[i]).max().unwrap();

      for i in mx .. tp {
        for j in 0 .. 5 {
          fld[i][j] = fld[i+1][j];
        }
      }
      
      for j in 0 .. 5 {
        for i in (0 .. pa[j]).rev() {
          if fld[i][j] == 1 { break; }
          else { pa[j] = i; }
        }
      }
    }
  } else {
    for i in pa[q] .. pa[q] + p {
      fld[i][q] = 1;
    }
    pa[q] = pa[q] + p;

    for i in (pa[q]-p .. pa[q]).rev() {
      if fld[i].iter().all(|i| *i == 1) {
        let tp: usize = (0..5).map(|i| pa[i]).max().unwrap();

        for j in i .. tp {
          for k in 0 .. 5 {
            fld[j][k] = fld[j+1][k];
          }
        }
      }
    }
    
    for j in 0 .. 5 {
      for i in (0 .. pa[j]).rev() {
        if fld[i][j] == 1 { break; }
        else { pa[j] = i; }
      }
    }
  }
}

fn count_block(fld: &Vec<Vec<usize>>, pa: &Vec<usize>) -> usize {
  let mut cnt: usize = 0;

  for j in 0 .. 5 {
    for i in 0 .. pa[j] {
      if fld[i][j] == 1 { cnt += 1; }
    }
  }
  cnt
}

