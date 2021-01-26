//定義協定
protocol SomeProtocol{
    
}

//採納協定
struct SomeStructure:SomeProtocol{
    
}

//採納協定
class SomeClass:SomeProtocol{
    
}

protocol FullyNamed{
    var fullName:String{get}
}

struct Person:FullyNamed{
    var fullName:String
}

let john = Person(fullName: "John Appleseed")

