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

protocol RandomNumberGenerator{
    //method requirement
    //requrie
    func random() -> Double
}

class LinearCongruentialGenerator:RandomNumberGenerator{
    
    func random() -> Double{
        return 3.656478
    }
    
}

protocol Togglabl{
    //method requirement
    mutating func toggle()
}

enum OnOffSwitch:Togglabl{
    case off, on
    mutating func toggle() {
        switch self{
            case .off:
                self = .on
            case .on:
                self = .off
        }
    }
}

var lightSwich = OnOffSwitch.off
lightSwich.toggle()

import Foundation

@objc protocol CounterDataSource{
    //optional requirement
    @objc optional func increment(forCount count:Int) -> Int
    @objc optional var fixedIncrement:Int{get}
}

class Counter:CounterDataSource{
    
}

//protocol的繼承
protocol ParentProtocol{
    
}
//protocol的繼承
protocol subProtocol:ParentProtocol{
    
}

