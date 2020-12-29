import UIKit

struct SomeStructure{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 1
    }
}

print(SomeStructure.storedTypeProperty)
print(SomeStructure.computedTypeProperty)

enum SomeEnumeration{
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty:Int{
        return 6
    }
}
print(SomeEnumeration.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)

class SomeClass{
    static var storedTypeProperty = "some value."
    static var computedTypeProperty:Int{
        return 27
    }
    
    //使用class的關鍵字代表可以被覆寫
    class var overrideableComputedTypeProperty:Int{
        return 107
    }
}

print(SomeClass.storedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)
