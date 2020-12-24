import UIKit

//readOnle Computed property
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume:Double{
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("這個的four體積是\(fourByFiveByTwo.volume)")

let fiveByEightByNine = Cuboid(width: 5.0, height: 8.0, depth: 9.0)
print("這個的five體積是\(fiveByEightByNine.volume)")
