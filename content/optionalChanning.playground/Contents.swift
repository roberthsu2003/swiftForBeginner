class Person{
    var residence:Residence?
}

class Residence{
    var numberOfRooms = 1
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms{
    print("成功")
    print(roomCount)
}else{
    print("失敗")
}
