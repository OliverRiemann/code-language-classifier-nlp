use std::fmt;
use std::io::stdin;
use std::io::BufRead;
use std::str;
use std::str::FromStr;
use std::vec::Vec;
use std::collections::{VecDeque, HashSet};

fn main() {
    let stdin = stdin();
    let mut scan = InputScanner::new(stdin.lock(),256);

    let mut answer:Vec<i64> = Vec::new();

    loop {
        let n:usize = scan.next();
        let m:usize = scan.next();

        if n == 0 || m == 0 {
            break;
        }

        let abc = {
            let mut abc = Vec::new();

            for _ in 0..3 {
                let n: usize = scan.next();
                abc.push((0..n).map(|_| scan.next::<usize>()).collect::<Vec<usize>>());
            }
            abc
        };

        let mut queue = VecDeque::new();
        let mut s:HashSet<(u16,u16,u16)> = HashSet::new();

        let (ha,hb,hc) = calc_hash(&abc[0],&abc[1],&abc[2]);

        queue.push_back((ha,hb,hc));
        s.insert((ha,hb,hc));

        let mut count = 0;
        let mut found = false;

        'search: while queue.len() > 0 && count <= m {
            let mut current = queue.drain(0..).collect::<VecDeque<_>>();

            while let Some((ha,hb,hc)) = current.pop_front() {
                let abc = abc_from_hash(ha,hb,hc);

                if abc[0].len() == n || abc[2].len() == n {
                    found = true;
                    break 'search;
                }

                for &(i,d) in &[(0,1),(1,-1),(1,1),(2,-1)] {
                    let i = i as i64;

                    if abc[i as usize].len() > 0 {
                        let top = abc[i as usize][abc[i as usize].len()-1];

                        if abc[(i+d) as usize].len() == 0 || abc[(i+d) as usize][abc[(i+d) as usize].len()-1] < top {
                            let mut abc = abc.iter().map(|c| c.clone()).collect::<Vec<Vec<usize>>>();

                            abc[i as usize].pop();
                            abc[(i+d) as usize].push(top);

                            let h = calc_hash(&abc[0],&abc[1],&abc[2]);
                            if !s.contains(&h) {
                                s.insert(h);
                                queue.push_back(h);
                            }
                        }
                    }
                }
            }
            count += 1;
        }

        if found {
            answer.push(count as i64);
        } else {
            answer.push(-1);
        }
    }

    println!("{}",answer.into_iter().map(|a| format!("{}",a)).collect::<Vec<String>>().join("\n"));
}
fn calc_hash(a:&Vec<usize>,b:&Vec<usize>,c:&Vec<usize>) -> (u16,u16,u16) {
    let mut ha:u16 = 0;
    let mut hb:u16 = 0;
    let mut hc:u16 = 0;

    for n in a {
        ha |= 1 << *n;
    }

    for n in b {
        hb |= 1 << *n;
    }

    for n in c {
        hc |= 1 << *n;
    }

    (ha,hb,hc)
}
fn abc_from_hash(ha:u16,hb:u16,hc:u16) -> Vec<Vec<usize>> {
    let mut abc:Vec<Vec<usize>> = Vec::new();
    abc.push(Vec::new());

    let mut ha = ha;

    while ha > 0 {
        abc[0].push(ha.trailing_zeros() as usize);
        ha = ha & (ha - 1);
    }

    abc.push(Vec::new());

    let mut hb = hb;

    while hb > 0 {
        abc[1].push(hb.trailing_zeros() as usize);
        hb = hb & (hb - 1);
    }

    abc.push(Vec::new());

    let mut hc = hc;

    while hc > 0 {
        abc[2].push(hc.trailing_zeros() as usize);
        hc = hc & (hc - 1);
    }

    abc
}
struct InputScanner<R: BufRead> {
	reader: R,
	buf: Vec<u8>, // Should never be empty
	pos: usize,   // Should never be out of bounds as long as the input ends with '\n'
}
impl<R: BufRead> InputScanner<R> {
	fn new(reader: R, capacity: usize) -> Self {
		InputScanner {
			reader: reader,
			buf: Vec::with_capacity(capacity),
			pos: 0,
		}
	}

	#[inline]
	fn next<T: FromStr>(&mut self) -> T
	where
		T::Err: fmt::Debug,
	{
		if self.buf.is_empty() {
			self._read_next_line();
		}
		let mut start = None;
		loop {
			match (self.buf[self.pos], start.is_some()) {
				(b' ', true) | (b'\n', true) | (b'\r', true) => break,
				(_, true) | (b' ', false) => self.pos += 1,
				(b'\n', false) | (b'\r', false) => self._read_next_line(),
				(_, false) => start = Some(self.pos),
			}
		}
		let target = &self.buf[start.unwrap()..self.pos];
		unsafe { str::from_utf8_unchecked(target) }.parse().unwrap()
	}

	#[inline]
	fn _read_next_line(&mut self) {
		self.pos = 0;
		self.buf.clear();
		if self.reader.read_until(b'\n', &mut self.buf).unwrap() == 0 {
			panic!("Reached EOF");
		}
	}
}


