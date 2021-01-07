import UIKit

class Vehicle{
    var numberOfWheels = 0
    var description:String{
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle:\(vehicle.description)")

class Bicycle:Vehicle{
    override init(){
        super.init()
        numberOfWheels = 2
        
    }
}

let bicycle = Bicycle()
print("Bicycle:\(bicycle.description)")

class Hoverboard:Vehicle{
    var color:String
    init(color:String){
        self.color = color
        super.init()
    }
    
    override var description: String{
        return "\(super.description) in a beautiful \(color)"
    }
    
}
