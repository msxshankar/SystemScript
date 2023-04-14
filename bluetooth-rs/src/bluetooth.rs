extern crate yaml_rust;
use yaml_rust::{YamlLoader, YamlEmitter, Yaml};

use std::fs::File;
use std::io::Read;
use std::process::Command;

const DICT: &str = "devices";

fn parse_file<'a>() -> &'a Yaml {
    let mut file = File::open("devices.yaml").expect("Unable to open file");
    let mut contents = String::new();

    file.read_to_string(&mut contents)
        .expect("Unable to read file to string");

    let docs = YamlLoader::load_from_str(&contents).unwrap();
    let doc = &docs[0];

    doc
    //println!("{:#?}", doc);
    //println!("{}", doc["devices"][0].as_str().unwrap());

}

/// Pair existing devices
pub fn pair_existing() {
    let file_contents = parse_file();

    let device1 = file_contents[DICT][3].as_str().unwrap();
    //println!("{}", file_contents[DICT][0].as_str().unwrap());

    let output = Command::new("bluetoothctl connect")
        .arg(device1)
        .output()
        .expect("Failed to pair device");
}