var completionHandlers = [() -> Void]()

func someFunctionWithEscapingClosure(completionHandler:@escaping ()->Void){
    completionHandlers.append (completionHandler)
}

func someFunctionWithNonescapingClosure(closure:() -> Void){
    closure();
}

class SomeClass{
    var x = 10;
    func doSomething(){
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
    
    
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

print(customersInLine.count)

let customerProvider = { (a:Int,b:Int) in
    customersInLine.remove(at: 0)
}

print(customersInLine.count)

customerProvider(3, 5)

print(customersInLine.count)

