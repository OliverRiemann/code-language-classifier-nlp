use std::io::{stdin, BufRead, BufReader};

fn main() {
    let mut w: u32 = 0;
    for i in 0..2 {
        let mut buf = String::new();
        stdin().read_line(&mut buf).unwrap();
        match i {
            0 => w = buf.trim().parse().unwrap(),
            _ => break,
        }
    }
    let reader = BufReader::new(stdin());
    let mut hlines = vec![];
    for line in reader.lines() {
        let l: Vec<u32> = line.unwrap()
            .trim()
            .split(',')
            .filter_map(|x| x.parse::<u32>().ok())
            .collect();
        hlines.push((l[0], l[1]));
    }

    let mut answer = Vec::with_capacity((w + 1) as usize);
    for i in 1..w + 2 {
        answer.push(i);
    }
    for i in 1..w + 1 {
        let mut current = i;
        for hline in &hlines {
            if hline.0 == current {
                current = hline.1;
            } else if hline.1 == current {
                current = hline.0;
            }
        }
        answer[(current - 1) as usize] = i;
    }
    for i in 0..w {
        println!("{}", answer[i as usize]);
    }
}

