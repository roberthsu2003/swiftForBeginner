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
