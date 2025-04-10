use std::io;
use std::str::FromStr;
use std::collections::HashMap;

fn read() -> i32 {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    let x: i32 = s.trim().parse().unwrap();
    x
}
fn read_char() -> String {
    let mut s = String::new();
    std::io::stdin().read_line(&mut s).unwrap();
    let x: String = s.trim().parse().unwrap();
    x
}

 fn main(){
    loop{
        let mut rules : HashMap<String,String> = HashMap::new();
    
        let n = read();
        if n == 0{
            break;
        }
        for i in 0..n{
            let mut buf = String::new();
            io::stdin().read_line(&mut buf).unwrap();
            let mut it = buf.split_whitespace().map(|n| String::from_str(n).unwrap());
            let a = it.next().unwrap();
            let b = it.next().unwrap();

            rules.insert(a,b);
        }

        let m = read();
        for i in 0..m{
            let mut a = read_char();
            match rules.get(&a){
                Some(e) =>{
                    print!("{}",e);
                },
                None => print!("{}",&a),
            }
        }
        println!();
    }
 }
 
