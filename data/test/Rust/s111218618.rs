/*input
ABAABBBAABABAAABBAA
AABBBABBABBAAABABABAAB
BABAABAABABABBAAAB
AABABAAABBAABBBABAA
AAAAAAAAAAA
ABBBBBBBBBB
0
*/

macro_rules! input_vec {
    () => {
        input!()
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect()
    };
    ($delimiter:expr) => {
        input!()
            .split($delimiter)
            .map(|x| x.parse().unwrap())
            .collect()
    };
}

macro_rules! input {
    () => {{
        let mut return_ = String::new();
        std::io::stdin().read_line(&mut return_).ok();
        return_.pop();
        return_
    }};
}

fn main() {
    let (mut inp, mut a, mut b);
    loop {
        a = 0;
        b = 0;
        inp = input!();
        if &inp[..] == "0" {
            break;
        }
        for i in inp.chars().skip(1) {
            match i {
                'A' => {
                    a += 1;
                }
                'B' => {
                    b += 1;
                }
                _ => {}
            }
        }
        if a > b {
            a += 1;
        } else {
            b += 1;
        }
        println!("{} {}", a, b);
    }
}

