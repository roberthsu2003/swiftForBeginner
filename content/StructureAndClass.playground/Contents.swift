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
