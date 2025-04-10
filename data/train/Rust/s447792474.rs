use std::env;
use std::io::*;
use std::str::FromStr;
use std::char;
use std::error::Error;
use std::io::prelude::*;

fn read<T: FromStr>() -> T {
    let stdin = stdin();
    let stdin = stdin.lock();
    let token: String = stdin
        .bytes()
        .map(|c| c.expect("failed to read char") as char) 
        .skip_while(|c| c.is_whitespace())
        .take_while(|c| !c.is_whitespace())
        .collect();
    token.parse().ok().expect("failed to parse token")
}
fn main() {
    
    let n: u32 = read();
    
    let mut cnt:u32 = 0;
    while n != cnt {
        let query: String = read();
        let v: Vec<char> = query.chars().collect();
            
            //println!("{:?}", v);
            let mut i = 0_i32;
            println!("{}", expr(&v, &mut i));

            //println!("{}", number(&v, &mut i));
        
        cnt+=1;
    }
}


fn expr(s: &Vec<char>, i: &mut i32) -> i32 {
    let mut val = term(s, i);

    let mut idx = *i as usize;
    
    while idx < s.len() && (s[idx] == '+' || s[idx] == '-') {
        let op = s[idx];
        *i += 1;
        let val2 = term(s, i);
        val = if op == '+' {
            val + val2
        }else {
            val - val2
        };
        idx = *i as usize;
    }
    
    val
}

fn term(s: &Vec<char>, i: &mut i32) -> i32 {
    let mut val = factor(s, i);
    
    let mut idx = *i as usize;

    while idx < s.len() && (s[idx] == '*' || s[idx] == '/') {
        let op = s[idx];
        *i += 1;
        let val2 = factor(s, i);

        val =  if op == '*' {
            val * val2
        } else {
            val / val2
        };
        idx = *i as usize;
    }

    val
}

fn factor(s: &Vec<char>, i: &mut i32) -> i32 {
    let idx = *i as usize;
    if idx < s.len() && s[idx].is_digit(10){
         return number(s, i);
    }

    *i += 1;
    let res = expr(s, i);
    *i += 1;

    res
}

fn number(s: &Vec<char>, i: &mut i32) -> i32 {
    let mut idx = *i as usize;
    
    let mut n: u32 = s[idx].to_digit(10).unwrap();
    
    *i += 1;
    idx = *i as usize;
    while idx < s.len() && s[idx].is_digit(10) {
        
        let m: u32 = s[idx].to_digit(10).unwrap();
        n = n * 10 + m;
        *i += 1;
        idx = *i as usize;
    }

    n as i32
}


/* 参考 
 - http://dai1741.github.io/maximum-algo-2012/docs/parsing/

 <expr>   ::= <term> [ ('+'|'-') <term> ]*
 <term>   ::= <factor> [ ('*'|'/') <factor> ]*
 <factor> ::= <number> | '(' <expr> ')'
 <number> :== 1つ以上の数字
*/

/* &str型
・文字列を固定する（メモリサイズ）
・スライスで参照できる
・文字列長は不変

   String型
・文字列長は可変
・サイズが可変であるため参照ができない
*/

