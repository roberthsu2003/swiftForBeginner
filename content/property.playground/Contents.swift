//store property

struct FixedLengthRange{
    var firstValue:Int
    let length:Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length:3)
rangeOfThreeItems.firstValue = 6


let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)

//rangeOfFourItems.firstValue = 6

//lazy Store Property
//一定要用var
//延遲(初始化完後,等一下才給值)

class DataImporter{
    var filename = "data.txt"
}

class DataManager{
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
print(manager.importer)


//computed property

struct Point{
    var x=0.0, y = 0.0
}

struct Size{
    var width = 0.0, height = 0.0
}

struct Rect{
    var origin = Point()
    var size = Size()
    var center:Point{
        get{
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter){
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

print("矩形的中心x=\(initialSquareCenter.x),中心y=\(initialSquareCenter.y)")

square.center = Point(x: 15.0, y: 15.0)

print("矩形的x = \(square.origin.x),y=\(square.origin.y)")

