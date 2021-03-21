print("Hello! World!")

func greet(person:String) -> String{
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Anna"))

func operator1(a:Int,b:Int) -> (Int,Int){
    let add = a + b
    let mul = a * b
    return (add, mul)
}

let (add,mul) = operator1(a:10,b:5)
print(add)
print(mul)
