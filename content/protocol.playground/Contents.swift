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
    //property requirement
    var fullName:String{get}
}

struct Person:FullyNamed{
    
    var fullName:String
}

let john = Person(fullName: "John Appleseed")

class Starship:FullyNamed{
    var prefix:String?
    var name:String
    init(name:String, prefix:String?=nil){
        self.name = name
        self.prefix = prefix
    }
    var fullName: String{
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName

