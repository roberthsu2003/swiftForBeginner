import UIKit

enum CompassPoint{
    case north
    case south
    case east
    case west
}

enum Planet{
    case mercury, venus, earth, mars, jupiter, saturn, uranus, nepturn;
}

var directionToHead = CompassPoint.east
directionToHead = .south

switch directionToHead{
    case .north:
        print("north")
    case .south:
        print("south")
    case .east:
        print("east")
    case .west:
        print("west")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("人類住的地方")
default:
    print("非人類住的地方")
}


enum Beverage:CaseIterable{
    case coffe, tea, juice
}

for item in Beverage.allCases{
    print(item)
}


