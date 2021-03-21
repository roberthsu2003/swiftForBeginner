//定義結構
struct Student_stu{
    var name:String!
    var chinese:Int!
    var english:Int!
    var math:Int!
}

//定義類別
class Student_class{
    var name:String!
    var chinese:Int!
    var english:Int!
    var math:Int!
}

//建立結構實體
let oneS = Student_stu(name: "robert", chinese: 78, english: 67, math: 85)

//建立類別實體
let twoS = Student_class()

twoS.name = "susan"
twoS.chinese = 76
twoS.english = 85
twoS.math = 89

oneS.name
oneS.chinese
oneS.english
oneS.math


twoS.name
twoS.chinese
twoS.english
twoS.math


struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var iterlanced = false
    var frameRate = 0.0
    var name:String?
}

let someVideoMode = VideoMode()
someVideoMode.iterlanced
someVideoMode.frameRate
someVideoMode.name
someVideoMode.resolution.width
someVideoMode.resolution.height

//結構是value type
let vga = Resolution(width: 640, height: 480)
vga.width
vga.height

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd


cinema.width = 2048

//class是reference type
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.iterlanced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty.frameRate
