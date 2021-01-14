class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRooms=1
    func sayHello(){
        print("Hello! World")
    }
}

let john = Person()
//john.residence = Residence()

if john.residence?.sayHello() == nil{
    print("執行錯誤")
}else{
    print("執行正確")
}
