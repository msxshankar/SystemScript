// Connects bluetooth devices in rust!

mod bluetooth;

use std::io;
use std::io::Write;
use std::env;
use std::process;

const SUCCESS: i32 = 0;
const FAILURE: i32 = 1;

fn main() {
    
    // Collect command line arguments into vector and parse
    let args: Vec<String> = env::args().collect();
    if args.len() != 1 {
        let arg1 = parse_arguments(&args);

        // Check for command line options
        command_line_options(arg1);
    }

    // Displays menu
    println!("Connect your bluetooth devices");
    println!("1. Pair existing device");
    println!("2. Pair new device");
    println!("3. Exit");
    print!("Please enter your selection [1-3] > ");
    io::stdout().flush().unwrap();

    // Takes input
    let mut input = String::new();

    io::stdin()
        .read_line(&mut input)
        .expect("Failed to read input");

    // Convert to int
    let input_int: usize = input
        .trim()
        .parse()
        .expect("Unable to convert string to int");

    // Check result
    let mut result = menu_input(input_int);
    while result != 1 {
        result = menu_input(input_int);
    }
}

/// Parse command line arguments
fn parse_arguments(args: &[String]) -> &str {

    if args.len() != 1 {
        println!("Incorrect number of arguments!");
        println!("Usage: bluetooth [-h] [-v]");
    }

    let arg1 = &args[0];

    arg1
}

/// Handles command line options
fn command_line_options(args: &str) {

    if args.eq("-h") || args.eq("--help") {
        println!("Usage: bluetooth-rs [-h] [-v]");
    }
    else if args.eq("-v") || args.eq("--version") {
        println!("bluetooth-rs version 0.1");
    }
    else {
        process::exit(FAILURE);
    }
}

/// Handles menu input
fn menu_input(input: usize) -> usize{

    if input == 1 {
        bluetooth::pair_existing();
    }

    //else if input ==2 {}

    if input == 3 {
        process::exit(SUCCESS);
    }

    else {
        println!("Invalid option - please try again > ");
        return 1;
    }
}
