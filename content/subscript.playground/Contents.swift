import UIKit

struct TimesTable{
    let multiplier:Int
    subscript(index:Int) -> Int{
        
            return index * multiplier
        
    }
}

//subscript由實體來執行
//subscript[]

let threeTimesTable = TimesTable(multiplier: 3)
print(threeTimesTable[25])
