use dep::std::hash::poseidon::bn254;
// use dep::ecrecover;


struct Person  {
    age: Field
}

global minAge : u8 = 18;

fn main(fighter: Person, password: [Field;2], passwordHash : pub Field) {
    assert(fighter.age as u8 > minAge);

    assert(passwordHash == bn254::hash_2(password));
}

#[test]
fn test_main() {
    let p = Person {age : 19};
    main(p,[1,2], 0x115cc0f5e7d690413df64c6b9662e9cf2a3617f2743245519e19607a4417189a);

    // Uncomment to make test fail
    // main(1, 1);
}

#[test(should_fail)]
fn test_fail(){
    let p = Person{age:17};
    main(p, [1,2],0x115cc0f5e7d690413df64c6b9662e9cf2a3617f2743245519e19607a4417189c);
}