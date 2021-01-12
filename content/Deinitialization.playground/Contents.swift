class Bank{
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int{
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins:Int){
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse:Int
    init(coins:Int){
        coinsInPurse = Bank.distribute(coins: coins)
    }
    
    func win(coins:Int){
        coinsInPurse += Bank.distribute(coins: coins)
    }
    
    deinit {
        print("我要初消除")
        Bank.receive(coins: coinsInPurse)
    }
}

var playerOne:Player? = Player(coins: 100)
playerOne!.coinsInPurse
Bank.coinsInBank
playerOne = nil
playerOne?.coinsInPurse
Bank.coinsInBank
