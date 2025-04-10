fn main(){
  loop {
    let nm: Vec<usize> = read_vec();
    let n = nm[0];
    let m = nm[1];

    if n == 0 && m == 0 { break; }

    let mut st: Vec<char> = vec!['#';n];
    
    for _ in 0 .. m {
      let a: String = read();
      
      if a == "A".to_string() { countrya(n, &mut st); }
      else if a == "B".to_string() { countryb(n, &mut st); }
      else if a == "C".to_string() { countryc(n, &mut st); }
      else { countryd(n, &mut st); }
    }
      
    println! ("{}", st.iter().collect::<String>());
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

fn countrya(n: usize, st: &mut Vec<char>){
  for i in 0 .. n {
    if st[i] == '#' {
      st[i] = 'A';
      break;
    }
  }
}

fn countryb(n: usize, st: &mut Vec<char>){
  if n == 1 { st[0] = 'B'; }
  else {
    let mut f: bool = true;
  
    for i in (0 .. n).rev() {
      if i == n - 1 {
        if st[i] == '#' && st[i-1] != 'A' {st[i] = 'B'; f = false; break;}
      }
      else if i == 0 {
        if st[i] == '#' && st[i+1] != 'A' {st[i] = 'B'; f = false; break;}
      }
      else {
        if st[i] == '#' && st[i+1] != 'A' && st[i-1] != 'A' {st[i] = 'B'; f = false; break;}
      }
    }
    if f {
      for i in 0 .. n {
        if st[i] == '#' {
          st[i] = 'B';
          break;
        }
      }
    }
  }
}

fn countryc(n: usize, st: &mut Vec<char>){
  if n == 1 { st[0] = 'C'; }
  else {
    let mut f: bool = true;
    
    for i in 0 .. n {
      if st[i] != '#' {
        if i < n - 1 && st[i+1] == '#' {st[i+1] = 'C'; f = false; break;}
        if i > 0 && st[i-1] == '#' {st[i-1] = 'C'; f = false; break;}
      }
    }
    if f {
      st[n/2] = 'C';
    }
  }
}

fn countryd(n: usize, st: &mut Vec<char>){
  let mut d: Vec<usize> = vec![1000;n];

  for i in 0 .. n {
    if st[i] != '#' {
      d[i] = 0;
      let mut j: usize = 1;
      while i >= j && st[i-j] == '#' && d[i-j] > j {
        d[i-j] = j;
        j += 1;
      }
      j = 1;
      while i+j < n && st[i+j] == '#' {
        d[i+j] = j;
        j += 1;
      }
    }
  }
  
  let mut md: usize = 0;
  let mut mi: usize = 0;

  for i in 0 .. n {
    if d[i] > md {
      md = d[i];
      mi = i;
    }
  }

  st[mi] = 'D';
}

