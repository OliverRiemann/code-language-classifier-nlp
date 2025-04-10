extern crate core;

use std::str::FromStr;

struct Iostream {
    line: Vec<String>,
    position: usize
}
type Parse<T: FromStr> = Result<T, T::Err>;
impl Iostream {
    fn new() -> Iostream{
        Iostream {line:vec![], position: 0}
    }
    fn read_word(&mut self) -> &String {
        if self.position == self.line.len() {
            let mut line= String::new();
            std::io::stdin().read_line(&mut line).ok();
            self.line = line.split_whitespace().map(|x|x.to_string()).collect();
            self.position = 0
        }
        let result = &self.line[self.position];
        self.position += 1;
        result
    }
    fn read<T: FromStr>(&mut self) -> Parse<T> {
        self.read_word().parse()
    }
    fn get<T: FromStr>(&mut self) -> T {self.read().ok().unwrap()}
}
struct Sweets {
    id: i32,
    protein: i32,
    fat: i32,
    carbon: i32,
}
impl Sweets {
    fn calorie(&self) -> i32 {
        self.protein * 4 + self.carbon * 4 + self.fat * 9
    }
}
fn tabulate<T, F>(count: usize, elements: &mut F) -> Vec<T> where F: FnMut(usize) -> T {
    let mut result:Vec<T> = Vec::with_capacity(count);
    for i in 0 .. count {
        result.push(elements(i))
    }
    result
}
fn fill<T, F>(count: usize, generator: F) -> Vec<T> where F: Fn() -> T {
    let mut result: Vec<T> = Vec::with_capacity(count);
    for i in 0 .. count {
        result.push(generator())
    }
    result
}
fn main() {
    let mut stdin = Iostream::new();
    let input = &mut stdin;
    loop {
        let n: usize = input.get();
        if n == 0 {
            break
        }
        let sweets = tabulate(n, &mut |_idx| {
            let s: i32 = input.get();
            let p: i32 = input.get();
            let q: i32 = input.get();
            let r: i32 = input.get();
            Sweets { id: s, protein: p, fat: q, carbon: r }
        });
        let protein :i32 = input.get();
        let fat:i32 = input.get();
        let carbon:i32 = input.get();
        let calorie:i32 = input.get();
        let filtered: Vec<_> = sweets.iter().filter(|&x| x.calorie() <= calorie && x.protein <= protein && x.fat <= fat && x.carbon <= carbon).collect();
        if filtered.len() == 0 {
            println!("NA");
        } else {
            for s in filtered {
                println!("{}", s.id)
            }
        }
    }
}
