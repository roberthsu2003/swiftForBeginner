class SomeClass{
    required init(a:Int){
        
    }
}

class SomeSubClass:SomeClass{
    required init(a: Int) {
        super.init(a: a)
    }
}

var subInstance = SomeSubClass(a:50)

class SomeClass1{
    let someProperty:Int = {
        //不要使用其它的store property
        //不要使用其它的method
        //xxxxx
        return 10
    }()
}

let someInstance = SomeClass1()
print(someInstance.someProperty)


