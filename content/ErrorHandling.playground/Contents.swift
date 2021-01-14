import UIKit

//建立一個可被丟出錯誤的列舉

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}
