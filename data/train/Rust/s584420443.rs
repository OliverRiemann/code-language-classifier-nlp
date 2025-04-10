use std::io::prelude::*;
use std::io;

#[derive(PartialEq)]
enum Direction {
  TOP,
  BOTTOM,
  NORTH,
  EAST,
  SOUTH,
  WEST,
}

struct Dice {
  one_d: Direction,
  two_d: Direction,
  three_d: Direction,
}

use Direction::*;
impl Dice {

  fn new() -> Dice {
    Dice { one_d: TOP, two_d: SOUTH, three_d: EAST }
  }
  
  fn top(&self) -> u32 {
    if self.one_d == TOP {
      1
    } else if self.one_d == BOTTOM {
      6
    } else if self.two_d == TOP {
      2
    } else if self.two_d == BOTTOM {
      5
    } else if self.three_d == TOP {
      3
    } else if self.three_d == BOTTOM {
      4
    } else {
      unreachable!()
    }
  }

  fn north(&mut self) {
    self.one_d = Dice::north_roll(&self.one_d);
    self.two_d = Dice::north_roll(&self.two_d);
    self.three_d = Dice::north_roll(&self.three_d);
  }
  
  fn north_roll(d: &Direction) -> Direction {
    match *d {
      TOP => NORTH,
      BOTTOM => SOUTH,
      NORTH => BOTTOM,
      EAST => EAST,
      SOUTH => TOP,
      WEST => WEST,
    }
  }
  
  fn east(&mut self) {
    self.one_d = Dice::east_roll(&self.one_d);
    self.two_d = Dice::east_roll(&self.two_d); 
    self.three_d = Dice::east_roll(&self.three_d);
  }
  
  fn east_roll(d: &Direction) -> Direction {
    match *d {
      TOP => EAST,
      BOTTOM => WEST,
      NORTH => NORTH,
      EAST => BOTTOM,
      SOUTH => SOUTH,
      WEST => TOP,
    }
  }

  fn south(&mut self) {
    self.one_d = Dice::south_roll(&self.one_d);
    self.two_d = Dice::south_roll(&self.two_d);
    self.three_d = Dice::south_roll(&self.three_d);
  }
  
  fn south_roll(d: &Direction) -> Direction {
    match *d {
      TOP => SOUTH,
      BOTTOM => NORTH,
      NORTH => TOP,
      EAST => EAST,
      SOUTH => BOTTOM,
      WEST => WEST,
    }
  }
  
  fn west(&mut self) {
    self.one_d = Dice::west_roll(&self.one_d);
    self.two_d = Dice::west_roll(&self.two_d);
    self.three_d = Dice::west_roll(&self.three_d);
  }
  
  fn west_roll(d: &Direction) -> Direction {
    match *d {
      TOP => WEST,
      BOTTOM => EAST,
      NORTH => NORTH,
      EAST => TOP,
      SOUTH => SOUTH,
      WEST => BOTTOM,
    }
  }

  fn right(&mut self) {
      self.one_d = Dice::right_roll(&self.one_d);
      self.two_d = Dice::right_roll(&self.two_d);
      self.three_d = Dice::right_roll(&self.three_d);
  }

  fn right_roll(d: &Direction) -> Direction {
    match *d {
      TOP => TOP,
      BOTTOM => BOTTOM,
      NORTH => EAST,
      EAST => SOUTH,
      SOUTH => WEST,
      WEST => NORTH,
    }
  }

  fn left(&mut self) {
      self.one_d = Dice::left_roll(&self.one_d);
      self.two_d = Dice::left_roll(&self.two_d);
      self.three_d = Dice::left_roll(&self.three_d);
  }

  fn left_roll(d: &Direction) -> Direction {
    match *d {
      TOP => TOP,
      BOTTOM => BOTTOM,
      NORTH => WEST,
      EAST => NORTH,
      SOUTH => EAST,
      WEST => SOUTH,
    }
  }
}

fn sum_dice_roll(handle: &mut std::io::StdinLock, times: u32) -> u32 {
  let mut sum: u32 = 0;
  let mut dice = Dice::new();
  sum += dice.top();
  let mut buffer = String::new();

  for _ in 0..times {
    buffer.clear();
    handle.read_line(&mut buffer).unwrap();
    let input = buffer.trim();

    match input {
      "North" => dice.north(),
      "East" => dice.east(),
      "South" => dice.south(),
      "West" => dice.west(),
      "Right" => dice.right(),
      "Left" => dice.left(),
      _ => unreachable!(),
    }

    sum += dice.top();
  }

  sum
}

fn main() {
  let stdin = io::stdin();
  let mut handle = stdin.lock();
  
  loop {
    let mut buffer = String::new();
    handle.read_line(&mut buffer).unwrap();
    let n = buffer.trim().parse::<u32>().unwrap();
    if n == 0 {
      break;
    } else {
      let result = sum_dice_roll(&mut handle, n);
      println!("{}", result);
    }
  }
}