use std::io::BufRead;

pub struct StdinReader<R: BufRead> {
    pub reader: R,
    pub buf: String,
}

impl<R: BufRead> StdinReader<R> {
    pub fn new(reader: R) -> Self {
        Self {
            reader,
            buf: String::new(),
        }
    }
}

macro_rules! get {
    ($r:expr, $t:ty) => {
        {
            let mut line = &mut $r.buf;
            line.clear();
            $r.reader.read_line(&mut line).unwrap();
            line.trim().parse::<$t>().unwrap()
        }
    };
    ($r:expr, $($t:ty),*) => {
        {
            let mut line = &mut $r.buf;
            line.clear();
            $r.reader.read_line(&mut line).unwrap();
            let mut iter = line.split_whitespace();
            (
                $(iter.next().unwrap().parse::<$t>().unwrap(),)*
            )
        }
    };
    ($r:expr, $t:ty; $n:expr) => {
        (0..$n).map(|_|
            get!($r, $t)
        ).collect::<Vec<_>>()
    };
    ($r:expr, $($t:ty),*; $n:expr) => {
        (0..$n).map(|_|
            get!($r, $($t),*)
        ).collect::<Vec<_>>()
    };
    ($r:expr, $t:ty ;;) => {
        {
            let mut line = &mut $r.buf;
            line.clear();
            $r.reader.read_line(&mut line).unwrap();
            line.split_whitespace()
                .map(|t| t.parse::<$t>().unwrap())
                .collect::<Vec<_>>()
        }
    };
    ($r:expr, $t:ty ;; $n:expr) => {
        (0..$n).map(|_| get!($r, $t ;;)).collect::<Vec<_>>()
    };
}

fn main() {

    let stdin = std::io::stdin();
    let mut r = StdinReader::new(stdin.lock());
    let mut hs: Vec<u32> = vec![];

    for _i in 0..10 {
        let a = get!(r, u32);
        hs.push(a);
    }
    hs.sort_by(|a, b| b.cmp(a));
    for i in 0..3 {
        println!("{}", hs[i]);
    }
}

