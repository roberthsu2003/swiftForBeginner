func greet(person:String) -> String{
    let greeting = "Hello! \(person)!"
    return greeting
}

print(greet(person: "David"))
print(greet(person: "Robert"))

func greetAgain(person:String) -> String{
    return "Hello again, \(person)!"
}

print(greetAgain(person: "Anna"))

//沒有參數
func sayHelloWorld() -> String{
    return "Hello! World"
}

print(sayHelloWorld());

//多個參數
func greet(person:String, alreadyGreeted:Bool) -> String{
    if alreadyGreeted{
        return greetAgain(person: person)
    }else{
        return greet(person: person)
    }
}

print(greet(person: "Tim", alreadyGreeted: false))


