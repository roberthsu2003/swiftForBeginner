import UIKit

class Vehicle{
    //base class
    var currentSpeed = 0.0 //store property
    var description:String{ //computed property
        return "目前的速度是\(currentSpeed)"
    }
    
    func makeNoise(){
        print("目前的速度是\(currentSpeed)")
    }
}

let someVehicle = Vehicle()
someVehicle.makeNoise()

//建立一個subClass
class Bicycle:Vehicle{
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("bicycle \(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem:\(tandem.description)")
