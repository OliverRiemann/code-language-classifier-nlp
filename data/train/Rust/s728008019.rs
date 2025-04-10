/*input
12
100
200
300
0
*/
fn read_line() -> String {
    let mut return_ = format!("");
    std::io::stdin().read_line(&mut return_).ok();
    return_.pop();
    return_
}

//Sieve of Eratosthenes
fn sieve_of_eratosthenes(n: usize) -> Vec<bool> {
    let mut vec: Vec<bool> = vec![true; n];
    vec[0] = false;
    vec[1] = false;
    let mut j: usize;
    for i in 2..n {
        if vec[i] {
            j = i * i;
            while j < n {
                vec[j] = false;
                j = j + i;
            }
        }
    }
    vec
    /*let mut vec2: Vec<usize> = vec![];
    for i in 0..vec.len() {
        if vec[i] {
            vec2.push(i);
        }
    }
    vec2*/
}

fn main() {
    let soe = sieve_of_eratosthenes(10001);
    let mut input: i32;
    let mut index: i32;
    let mut prime: [i32; 2];
    let mut prime_fill_1: bool;
    loop {
        input = read_line().parse().unwrap();
        //println!(">{:?}", input);
        if input == 0 {
            break;
        }
        index = input;
        prime = [0; 2];
        prime_fill_1 = true;
        loop {
            if soe[index as usize] {
                if prime_fill_1 {
                    prime[1] = prime[0];
                    prime[0] = index;
                    prime_fill_1 = false;
                } else {
                    prime[1] = prime[0];
                    prime[0] = index;
                    prime_fill_1 = true;
                }
            }
            //println!("{:?} -> {:?} {:?}", index, prime[1], prime[0]);
            if (prime[1] - prime[0]).abs() == 2 {
                println!("{} {}", prime[0], prime[1]);
                break;
            }
            index = index - 1;
        }
    }
}

