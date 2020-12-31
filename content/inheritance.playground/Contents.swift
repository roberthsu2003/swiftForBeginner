import UIKit

class Vehicle{
    //base class
    var currentSpeed = 0.0 //store property
    var description:String{ //computed property
        return "目前的速度是\(currentSpeed)"
    }
    
    func makeNoise(){
       
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

//override method
class Train:Vehicle{
    override func makeNoise(){
       print("choo choo")
    }
}

let train = Train()
train.makeNoise()

//overriding Property
class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + "在\(gear)檔時"
    }
}

let car = Car()

//override storeproperty 成為 property observer
class AutomaticCar:Car{
    override var currentSpeed: Double{
        didSet{
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")
