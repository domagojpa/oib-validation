fn oib_ok(oib: &str) -> bool {
    if oib.len() != 11 {
        return false;
    }

    let mut sum = 10u8;

    for c in oib[0..10].chars() {
        if c < '0' || c > '9' {
            return false;
        }

        sum = (sum + c as u8 - '0' as u8) % 10;

        if sum == 0 {
            sum = 10;
        }

        sum = (sum * 2) % 11;
    }

    (11 - sum) % 10 == oib.chars().nth(10).unwrap() as u8 - '0' as u8
}

fn main() {
    let oib = "12345678903";

    println!("oib {} is ok? {}", oib, oib_ok(&oib));

    let oib = "12345678900";

    println!("oib {} is ok? {}", oib, oib_ok(&oib));

}

