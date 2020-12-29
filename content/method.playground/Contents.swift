import UIKit

class Counter{
    var count = 0
    
    func increment(){
        count += 1
    }
    
    func increment(by amount:Int){
        count += amount
    }
    
    func reset(){
        count = 0
    }
}

let counter = Counter()

counter.increment()
counter.increment(by: 5)
counter.reset()

//為何使用self
struct Point{
    var x = 0.0, y = 0.0
    func isToTheRightOf(x:Double) -> Bool{
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0){
    print("這個參數x小於實體屬性x")
}

//如果是結構或列舉,method()會改變實體內的實體屬性，method必需要用 mutating

struct Point1{
    var x=0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY:Double){
        x += deltaX
        y += deltaY
    }
}

