/*
All the players, welcome to PC Koshien. The main election of PC Koshien will be held at Aizu University, and one team will be assigned to one desk in the hall. As PC Koshien has one team and two people, it requires a team number × 2 chairs. In the university, there are other opportunities to set up desks and chairs at various event venues, but the number of desks and chairs needed also varies. So, given the number of desks to prepare for an event and the number of chairs needed per desk, create a program to calculate the total number of chairs needed.
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
    let v: Vec<i32> = input_vec!();
    println!("{}", v[0] * v[1]);
}

