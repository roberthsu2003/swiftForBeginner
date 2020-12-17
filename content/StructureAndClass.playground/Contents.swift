struct Resolution{
    var width = 0
    var height = 0
}
let someResolution = Resolution()

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
}

let someVideoMode = VideoMode()

print("這個Resolution的寬是:\(someResolution.width)")
print("這個someVideoMode的寬是:\(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("這個someVideoMode的寬是:\(someVideoMode.resolution.width)")
let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("cinema內的寬是\(cinema.width)")
print("hd內的寬是\(hd.width)")

enum CompassPoint{
    case north, south, east, west
    mutating func turnNorth(){
        self = .north
    }
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection

currentDirection.turnNorth()
//rememberedDirection.turnNorth()
print("currentDirection的方向是\(currentDirection)")
print("rememberedDirection的方向是\(rememberedDirection)")
