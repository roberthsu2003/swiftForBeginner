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
