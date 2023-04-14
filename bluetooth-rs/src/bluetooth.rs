extern crate yaml_rust;
use yaml_rust::{YamlLoader, YamlEmitter};

use std::fs::File;
use std::io::Read;

fn parse_file() {
    let mut file = File::open("devices.yaml").expect("Unable to open file");
    let mut contents = String::new();

    file.read_to_string(&mut contents)
        .expect("Unable to read file to string");

    let docs = YamlLoader::load_from_str(&contents).unwrap();
    let doc = &docs[0];


    println!("{:#?}", doc);
    println!("{}", doc["devices"][0].as_str().unwrap());

}

pub fn connect_devices() {
    parse_file();
}