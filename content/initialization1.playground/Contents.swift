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

