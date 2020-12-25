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

//property Observer

class StepCounter{
    var totalSteps:Int = 0{
        willSet(newTotalSteps){
            print("新傳進來的值是\(newTotalSteps)")
        }
        
        didSet{
            if totalSteps > oldValue{
                print("比原來的值增加了\(totalSteps-oldValue)")
            }else{
                print("totalSteps變比較小了")
            }
        }
    }
}

let stepCounter = StepCounter(); //base Class 會有default initializer
stepCounter.totalSteps = 200

class Scores{
    var chinese:Int = 0{
        willSet(newValue){
            print("新傳進來的值是\(newValue)")
        }
        
        didSet{
            if chinese < 0 {
                chinese = 0
            }else if chinese > 100{
                chinese = 100
            }
            print("現在儲存的值是\(chinese)")
        }
    }
}

var score = Scores()
score.chinese = 200
score.chinese = 50
score.chinese = -10
