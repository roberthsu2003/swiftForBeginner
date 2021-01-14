import UIKit

//建立一個可被丟出錯誤的列舉

enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

struct Item{
    var price:Int
    var count:Int
}


class VendingMachine{
    var inventory = [
        "Candy Bar":Item(price: 12, count: 3),
        "Chips":Item(price: 10, count: 4),
        "Pretzels":Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name:String) throws{
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else{
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else{
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item;
        newItem.count -= 1;
        inventory[name] = newItem
        
        print("Dispensing \(name)")
        
        
    }
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 12
do{
    try vendingMachine.vend(itemNamed: "Candy Bar")
    print("成功購買")
}catch VendingMachineError.invalidSelection{
    print("沒有這個商品")
}catch VendingMachineError.outOfStock{
    print("賣完了")
}catch VendingMachineError.insufficientFunds(let coinsNeeded){
    print("不足\(coinsNeeded)")
}

vendingMachine.coinsDeposited = 12
if ( try? vendingMachine.vend(itemNamed: "Candy Bar")) == nil {
    print("購買失敗")
}else{
    print("購買成功")
}

try! vendingMachine.vend(itemNamed: "Candy Bar")


