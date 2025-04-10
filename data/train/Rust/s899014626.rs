use std::io::{stdin, Read, StdinLock};
use std::str::FromStr;
use std::cmp;

struct Scanner<'a> {
    cin : StdinLock<'a>,
}

impl<'a> Scanner<'a> {
    fn new(cin : StdinLock<'a>) -> Scanner<'a> {
        Scanner { cin: cin }
    }

    fn read1<T: FromStr>(&mut self) -> Option<T> {
        let token = self.cin.by_ref().bytes().map(|c| c.unwrap() as char)
            .skip_while(|c| c.is_whitespace())
            .take_while(|c| !c.is_whitespace())
            .collect::<String>();
        token.parse::<T>().ok()
    }

    fn read<T: FromStr>(&mut self) -> T {
        self.read1().unwrap()
    }
}

#[derive(Clone)]
struct Query {
    a: usize,
    b: usize,
    c: usize,
    res: bool
}

fn main(){
	let cin = stdin();
	let cin = cin.lock();
	let mut sc = Scanner::new(cin);
        loop {
            let (a, b, c): (usize, usize, usize) = (sc.read(), sc.read(), sc.read());
            if a == 0 { break; }
            let mut tab: Vec<Option<bool>> = vec![None; a+b+c];
            let mut query: Vec<Query> = Vec::new();
            let n : usize = sc.read();
            for _ in 0..n {
                query.push(Query{a: sc.read::<usize>()-1, b: sc.read::<usize>()-1, c: sc.read::<usize>()-1, res: if sc.read::<usize>() == 1 { true } else { false }});
            }
            for j in 0..n {
                if query[j].res {
                    tab[query[j].a] = Some(true);
                    tab[query[j].b] = Some(true);
                    tab[query[j].c] = Some(true);
                } else {
                    if let Some(aa) = tab[query[j].a] {
                        if let Some(bb) = tab[query[j].b] {
                            if aa && bb {
                                tab[query[j].c] = Some(false);
                            }
                        }
                        if let Some(cc) = tab[query[j].c] {
                            if aa && cc {
                                tab[query[j].b] = Some(false);
                            }
                        }
                    }
                    if let Some(bb) = tab[query[j].b] {
                        if let Some(cc) = tab[query[j].c] {
                            if bb && cc {
                                tab[query[j].a] = Some(false);
                            }
                        }
                    }
                }
            }
            for j in 0..n {
                if query[j].res {
                    tab[query[j].a] = Some(true);
                    tab[query[j].b] = Some(true);
                    tab[query[j].c] = Some(true);
                } else {
                    if let Some(aa) = tab[query[j].a] {
                        if let Some(bb) = tab[query[j].b] {
                            if aa && bb {
                                tab[query[j].c] = Some(false);
                            }
                        }
                        if let Some(cc) = tab[query[j].c] {
                            if aa && cc {
                                tab[query[j].b] = Some(false);
                            }
                        }
                    }
                    if let Some(bb) = tab[query[j].b] {
                        if let Some(cc) = tab[query[j].c] {
                            if bb && cc {
                                tab[query[j].a] = Some(false);
                            }
                        }
                    }
                }
            }
            for i in &tab {
                println!("{}", if let Some(sta) = *i {
                    if sta { 1 }
                    else { 0 }
                } else { 2 } 
                );
            }
        }
}


