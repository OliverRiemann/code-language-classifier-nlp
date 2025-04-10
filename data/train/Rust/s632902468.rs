fn main(){
   let eps: f64 = 0.000000001;
   
   loop {
     let mut buf = String::new();
     if let Ok(c) = std::io::stdin().read_line(&mut buf) {
       
       if c < 2 { break; }
       
       let wr: Vec<usize> = buf.split_whitespace().map(|e| e.parse().unwrap()).collect();
       let w = wr[0] as f64;
       let l: usize = wr.len() - 1;
       let rv: Vec<f64> = (1 .. l+1).map(|i| wr[i] as f64).collect();
       
       let mut dp: Vec<Vec<f64>> = vec![vec![2000.0; l]; 1 << l];

       for i in 0 .. l {
         dp[1 << i][i] = rv[i];
       }

       for s in 1 .. (1 << l) {
         for i in 0 .. l {
           if s & (1 << i) > 0 {
             for j in 0 .. l {
               if s & (1 << j) == 0 {
                 let nw = dp[s][i] + dist(rv[i], rv[j]);
                 dp[s | (1 << j)][j] = if nw < dp[s | (1 << j)][j] { nw } else {dp[s | (1 << j)][j]};
               }
             }
           }
         }
       }
       
       for i in 0 .. l {
           dp[(1<<l)-1][i] += rv[i];
       }

       let mut mnl: f64 = dp[(1<<l)-1][0];
       
       for i in 1 .. l {
           if mnl > dp[(1<<l)-1][i] {
              mnl = dp[(1<<l)-1][i];
           }
       }
       
       println!("{}", if (w - mnl).abs() < eps || w > mnl {"OK"} else {"NA"});
     }
   }
}

fn dist(r1: f64, r2: f64) -> f64 {
   2.0 * (r1 * r2).sqrt()
}

