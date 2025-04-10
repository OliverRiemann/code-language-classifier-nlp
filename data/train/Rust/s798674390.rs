use std::cmp::Ordering;
use std::io::{stdin, BufRead, BufReader};

struct Vector {
    x: f32,
    y: f32,
}

fn main() {
    let input = BufReader::new(stdin());
    for line in input.lines() {
        let values: Vec<f32> = line.unwrap()
            .split_whitespace()
            .filter_map(|x| x.parse::<f32>().ok())
            .collect();
        let (tri_vectors, target) = get_vectors(values);
        if is_inside(tri_vectors, target) {
            println!("YES");
        } else {
            println!("NO");
        }
    }
}

fn is_inside(tri_vectors: Vec<Vector>, target: Vector) -> bool {
    let idx_pair = [(1, 0), (2, 1), (0, 2)];
    let mut cross_product = vec![];
    for pair in &idx_pair {
        let v1 = sub_vector(&tri_vectors[pair.0], &tri_vectors[pair.1]);
        let v2 = sub_vector(&target, &tri_vectors[pair.0]);
        let c = v1.x * v2.y - v1.y * v2.x;
        cross_product.push(c);
    }
    let plus: Vec<&f32> = cross_product.iter().filter(|x| x > &&0.0).collect();
    let minus: Vec<&f32> = cross_product.iter().filter(|x| x < &&0.0).collect();
    return plus.len() == 3 || minus.len() == 3;
}

fn sub_vector(v1: &Vector, v2: &Vector) -> Vector {
    return Vector {
        x: v1.x - v2.x,
        y: v1.y - v2.y,
    };
}

fn get_vectors(points: Vec<f32>) -> (Vec<Vector>, Vector) {
    let mut vectors = Vec::with_capacity(3);
    let mut i = 0;
    while i < points.len() - 2 {
        vectors.push(Vector {
            x: points[i],
            y: points[i + 1],
        });
        i += 2;
    }
    vectors.sort_by(|a, b| match a.x.partial_cmp(&b.x).unwrap() {
        Ordering::Equal => a.y.partial_cmp(&b.y).unwrap(),
        other => other,
    });
    return (
        vectors,
        Vector {
            x: points[i],
            y: points[i + 1],
        },
    );
}

