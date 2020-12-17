struct TwelveOrLess{
    var number:Int
    init(){self.number = 0}
    var wrappedValue:Int{
        get {return number}
        set { number = min(newValue, 12)}
    }
}
