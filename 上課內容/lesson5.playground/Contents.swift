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

//沒有參數的function
func sayHelloWorld() -> String{
    return "Hello, world"
}

//呼叫沒有參數的function
print(sayHelloWorld())

func greetAgain(person:String) -> String{
    return "Hello again," + person + "!"
}

print(greetAgain(person: "robert"))


//多個參數
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: false))

//沒有傳出值的function
func greet(person1:String){
    print("Hello,\(person1)")
}

greet(person1: "susan")




