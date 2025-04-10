use std::io::stdin;

fn main() {
    loop {
        let mut s = String::new();
        stdin().read_line(&mut s).unwrap();
        let end: i32 = match s.trim().parse() {
            Ok(end) => end,
            Err(_) => return
        };
        if end < 2 {
            println!("{}", 0);
            continue;
        }
        // Create vector for prime number flags which manages only the odd number.
        // Num n is calculated from index. n = i * 2 + 1
        let mut flags = vec![true; ((end + 1) / 2) as usize];
        let flags_len = flags.len();
        flags[0] = false;
        for i in 1..flags_len {
            if !flags[i] {
                continue
            }
            let n = i * 2 + 1;
            let mut j = 3;
            let mut comp_index = (n * j - 1) / 2;
            while comp_index < flags_len {
                flags[comp_index] = false;
                j += 2;
                comp_index = (n * j - 1) / 2;
            }
        }
        // Count flags and add one for skip of two;
        println!("{}", flags.iter().filter(|x| **x).count() + 1);
    }
}

