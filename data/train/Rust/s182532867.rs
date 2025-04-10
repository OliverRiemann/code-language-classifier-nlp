/*input
134
4330
34808
98792
0
*/
fn read_line() -> String {
    let mut return_ = format!("");
    std::io::stdin().read_line(&mut return_).ok();
    return_
}

fn main() {
    let mut prime_list: [bool; 1000001] = [true; 1000001];
    let mut multiple;
    prime_list[0] = false;
    for i in 2..1000001 {
        if prime_list[i] {
            multiple = i.pow(2);
            while multiple < 1000001 {
                prime_list[multiple as usize] = false;
                multiple = multiple + i;
            }
        }
    }
    /*
    Let A be an array of Boolean values, indexed by integers 2 to n, initially all set to true.

    for i = 2, 3, 4, ..., not exceeding √n:
      if A[i] is true:
        for j = i2, i2+i, i2+2i, i2+3i, ..., not exceeding n:
          A[j] := false.
    */
    let mut input: u32;
    let mut total: u32;
    loop {
        input = read_line().trim().parse().expect("");
        if input == 0 {
            break;
        }
        /*
        for i in range(num//2 + 1):
        if num % 2 != 0:
            print(num, 'not even'); break
        if i in primes and (num - i) in primes:
            print(i, '+', num - i)
        */
        total = 0;
        //println!("{:?}", input / 2 + 1);
        for i in 2..((input / 2) + 1) {
            if prime_list[i as usize] && prime_list[(input - i) as usize] {
                total = total + 1;
            }
        }
        println!("{}", total);
    }
}

