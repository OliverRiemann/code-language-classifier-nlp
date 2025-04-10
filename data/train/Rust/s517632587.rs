use std::io::stdin;
use std::collections::HashMap;

fn main() {
    let mut s = String::new();
    stdin().read_line(&mut s).unwrap();
    let lines: i32 = s.trim().parse().unwrap();
    for _ in 0..lines {
        let mut s = String::new();
        stdin().read_line(&mut s).unwrap();
        let line = s.trim();
        println!("{:?}", calc(line));
    }
}

fn calc(line: &str) -> i32 {
    exec_rpn(sort_to_rpn(tokenize(line)))
}

// Split the line by operators.
fn tokenize(line: &str) -> Vec<String> {
    let ops = ['+', '-', '*', '/', '(', ')', '='];
    let mut tokens: Vec<String> = Vec::new();
    let mut after_ops = true;
    for c in line.chars() {
        let is_op = ops.contains(&c);
        if after_ops {
            tokens.push(String::new());
        }
        if !after_ops && is_op {
            tokens.push(String::new());
        }
        let last = tokens.len() - 1;
        tokens[last].push(c);
        after_ops = is_op;
    }
    tokens
}

// Create the vector of Reverse Polish Notation (RPN).
fn sort_to_rpn(tokens: Vec<String>) -> Vec<String> {
    let mut rpn: Vec<String> = Vec::new();
    let mut buf: Vec<String> = Vec::new();
    let op_priority: HashMap<String, i32> =
        [("+", 1), ("-", 1), ("*", 2), ("/", 2)].iter().map(
            |tuple| { (tuple.0.to_string(), tuple.1) }
        ).collect();
    for token in tokens {
        match op_priority.get(&token) {
            Some(priority) => {
                // Pop from the buffer while operator priority is low.
                loop {
                    match buf.clone().last() {
                        Some(last_token) => {
                            match op_priority.get(last_token) {
                                Some(last_priority) => {
                                    if priority <= last_priority {
                                        rpn.push(buf.pop().unwrap());
                                    } else {
                                        break
                                    }
                                }
                                // case of "("
                                None => { break }
                            }
                        },
                        None => { break }
                    }
                }
                buf.push(token);
            },
            None => {
                // Handle operators without priority.
                match &*token {
                    "=" => {
                        loop {
                            match buf.pop() {
                                Some(v) => rpn.push(v),
                                None => break
                            }
                        }
                    },
                    "(" => buf.push(token),
                    ")" => {
                        loop {
                            let v = buf.pop().unwrap();
                            if &*v == "(" {
                                break
                            }
                            rpn.push(v);
                        }
                    },
                    // Push the numbers.
                    _ => rpn.push(token)
                }
            }
        }
    }
    rpn
}

// Calc result from the RPM vector.
fn exec_rpn(rpn: Vec<String>) -> i32 {
    let mut buf: Vec<i32> = Vec::new();
    for token in rpn {
        match &*token {
            "+" => {
                let v = buf.pop().unwrap() + buf.pop().unwrap();
                buf.push(v)
            },
            "-" => {
                let v1 = buf.pop().unwrap();
                let v2 = buf.pop().unwrap();
                buf.push(v2 - v1)
            },
            "*" => {
                let v = buf.pop().unwrap() * buf.pop().unwrap();
                buf.push(v)
            },
            "/" => {
                let v1 = buf.pop().unwrap();
                let v2 = buf.pop().unwrap();
                buf.push(v2 / v1)
            },
            _ => buf.push(token.parse().unwrap())
        }
    }
    buf.pop().unwrap()
}

