//extension 擴充computed property
extension Double{
    var km:Double{
        return self * 1_000.0
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100.0
    }
    
    var mm:Double{
        return self / 1_000.0
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
print("one inch is \(oneInch) meters")

let threeFeet = 3.0.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.0.km + 195.0.m
print(aMarathon)


//擴充Initializer

struct Size{
    var width=0.0, height=0.0
}

struct Point{
    var x=0.0, y = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2, y: 2), size: Size(width: 5.0, height: 5.0))

extension Rect{
    init(center:Point, size:Size){
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

//Method

extension Int{
    func repetitions(task:() -> Void){
        for _ in 0..<self{
            task()
        }
    }
}

3.repetitions(task: {
    () -> Void in
    print("Hello!")
})

extension Int{
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()
someInt

//subscript

extension Int{
    subscript(digitIndex:Int) -> Int{
       var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}

74568934[0]
74568934[1]
74568934[2]
74568934[3]

//Nested Types
extension Int{
    enum Kind{
        case negative, zero, positive
    }
    
    var kind:Kind{
        switch self{
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

let k = -50
k.kind
