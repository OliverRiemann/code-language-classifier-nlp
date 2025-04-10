use std::io::*;

fn fizzbuzz_eq(n: usize, s: &str) -> bool {
  if      n % 15 == 0 { s == "FizzBuzz" }
  else if n %  3 == 0 { s == "Fizz" }
  else if n %  5 == 0 { s == "Buzz" }
  else { n == s.parse().unwrap() }
}

fn main() {
  let stdin = stdin();
  let mut lines = stdin.lock().lines().map(|l| l.unwrap());

  loop {
    let (m, n) = {
      let line = lines.next().unwrap();
      let mut iter = line.split_whitespace().map(|s| s.parse::<usize>().unwrap());

      (iter.next().unwrap(), iter.next().unwrap())
    };
    if m == 0 { return; }

    let mut players_alive = vec![true; m];
    let mut cur = 0;

    for i in 1..(n + 1) {
      let ans = lines.next().unwrap();
      let is_correct = fizzbuzz_eq(i, &ans);

      if !is_correct { players_alive[cur] = false; }

      if i < n {
        let mut iter = ((cur + 1)..(cur + m)).map(|p| p % m);
        cur = iter.find(|&p| players_alive[p]).unwrap();

        if !is_correct && !iter.any(|p| players_alive[p]) {
          lines.nth(n - i - 1);
          break
        }
      }
    }

    let mut iter = players_alive.into_iter().enumerate()
      .filter(|&(_, a)| a).map(|(n, _)| n + 1);
    let mut result = iter.next().unwrap().to_string();
    for n in iter {
      result.push_str(&format!(" {}", n));
    }
    println!("{}", result);
  }
}

