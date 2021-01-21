//extension 擴充computed property
extension Double{
    var km:Double{
        return self * 1_000.0
    }
    
    var m:Double{
        return self
    }
    
    var cm:Double{
        return self / 100.0
    }
    
    var mm:Double{
        return self / 1_000.0
    }
    
    var ft:Double{
        return self / 3.28084
    }
}

let oneInch = 25.4.mm
print("one inch is \(oneInch) meters")

let threeFeet = 3.0.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.0.km + 195.0.m
print(aMarathon)


