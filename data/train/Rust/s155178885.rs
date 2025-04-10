use std::io::Read;
use std::io::Write;

struct Dice {
    val: [usize; 6],
}

impl Dice {
    fn new() -> Self {
        let mut dice = Dice {
            val: [0; 6],
        };
        for i in 0..6 {
            dice.val[i] = i + 1;
        }
        dice
    }
    fn top(&self) -> usize {
        self.val[0]
    }
    fn rotate_by(&mut self, a: &[usize]) {
        let val = &mut self.val;
        let x = val[a[0]];
        let mut p = a[0];
        for &a in &a[1..] {
            val[p] = val[a];
            p = a;
        }
        val[p] = x;
    }
    fn north(&mut self) {
        let a = [0, 1, 5, 4];
        self.rotate_by(&a);
    }
    fn east(&mut self) {
        let a = [0, 3, 5, 2];
        self.rotate_by(&a);
    }
    fn west(&mut self) {
        let a = [0, 2, 5, 3];
        self.rotate_by(&a);
    }
    fn south(&mut self) {
        let a = [0, 4, 5, 1];
        self.rotate_by(&a);
    }
    fn right(&mut self) {
        let a = [1, 2, 4, 3];
        self.rotate_by(&a);
    }
    fn left(&mut self) {
        let a = [1, 3, 4, 2];
        self.rotate_by(&a);
    }
}

fn run() {
    let out = std::io::stdout();
    let mut out = std::io::BufWriter::new(out.lock());
    let mut s = String::new();
    std::io::stdin().read_to_string(&mut s).unwrap();
    let mut it = s.trim().split_whitespace();
    loop {
        let n: usize = it.next().unwrap().parse().unwrap();
        if n == 0 {
            break;
        }
        let dice = &mut Dice::new();
        let mut ans = 1;
        for _ in 0..n {
            let s = it.next().unwrap();
            match s {
                "North" => dice.north(),
                "East" => dice.east(),
                "South" => dice.south(),
                "West" => dice.west(),
                "Right" => dice.right(),
                "Left" => dice.left(),
                _ => unreachable!(),
            };
            ans += dice.top();
        }
        writeln!(out, "{}", ans).ok();
    }
}

fn main() {
    run();
}

