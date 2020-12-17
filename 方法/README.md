# 方法（Methods）
-----------------

- [實例方法(Instance Methods](#instance_methods)
- [型別方法(Type Methods)](#type_methods)

**方法**是與某些特定型別相關聯的函式。類別、結構、列舉都可以定義實例方法；實例方法為給定型別的實例封裝了具體的任務與功能。類別、結構、列舉也可以定義型別方法；型別方法與型別本身相關聯。型別方法與 Objective-C 中的類別方法（class methods）相似。

結構和列舉能夠定義方法是 Swift 與 C/Objective-C 的主要區別之一。在 Objective-C 中，類別是唯一能定義方法的型別。但在 Swift 中，你不僅能選擇是否要定義一個類別/結構/列舉，還能靈活的在你創建的型別（類別/結構/列舉）上定義方法。

<a name="instance_methods"></a>
## 實例方法(Instance Methods)

**實例方法**是屬於某個特定類別、結構或者列舉型別實例的方法。實例方法提供存取和修改實例屬性的方法或提供與實例目的相關的功能，並以此來支撐實例的功能。實例方法的語法與函式完全一致，詳情參見[函式](../charpter2/06_Functions.md)。

實例方法要寫在它所屬的型別的前後大括號之間。實例方法能夠隱式存取它所屬型別的所有的其他實例方法和屬性。實例方法只能被它所屬的類別的某個特定實例呼叫。實例方法不能脫離於現存的實例而被呼叫。

下面的範例，定義一個很簡單的類別`Counter`，`Counter`能被用來對一個動作發生的次數進行計數：

```swift
class Counter {
  var count = 0
  func increment() {
    count += 1
  }
  func incrementBy(amount: Int) {
    count += amount
  }
  func reset() {
    count = 0
  }
}
```

`Counter`類別定義了三個實例方法：
- `increment`讓計數器按一遞增；
- `incrementBy(amount: Int)`讓計數器按一個指定的整數值遞增；
- `reset`將計數器重置為0。

`Counter`這個類別還宣告了一個可變屬性`count`，用它來保持對當前計數器值的追蹤。

和呼叫屬性一樣，用點語法（dot syntax）呼叫實例方法：

```swift
 let counter = Counter()
 // 初始計數值是0
 counter.increment()
 // 計數值現在是1
 counter.incrementBy(5)
 // 計數值現在是6
 counter.reset()
 // 計數值現在是0
```


<a name="self_property"></a>
## `self`屬性(The self Property)

型別的每一個實例都有一個隱含屬性叫做`self`，`self`完全等同於該實例本身。你可以在一個實例的實例方法中使用這個隱含的`self`屬性來參考當前實例。

上面範例中的`increment`方法還可以這樣寫：

```swift
func increment() {
  self.count += 1
}
```

實際上，你不必在你的程式碼裡面經常寫`self`。不論何時，只要在一個方法中使用一個已知的屬性或者方法名稱，如果你沒有明確的寫`self`，Swift 假定你是指當前實例的屬性或者方法。這種假定在上面的`Counter`中已經示範了：`Counter`中的三個實例方法中都使用的是`count`（而不是`self.count`）。

使用這條規則的主要場景是實例方法的某個參數名稱與實例的某個屬性名稱相同的時候。在這種情況下，參數名稱享有優先權，並且在參考屬性時必須使用一種更嚴格的方式。這時你可以使用`self`屬性來區分參數名稱和屬性名稱。

下面的範例中，`self`消除方法參數`x`和實例屬性`x`之間的歧義：

```swift
struct Point {
  var x = 0.0, y = 0.0
  func isToTheRightOfX(x: Double) -> Bool {
    return self.x > x
  }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
  println("This point is to the right of the line where x == 1.0")
}
// 輸出 "This point is to the right of the line where x == 1.0"（這個點在x等於1.0這條線的右邊）
```

如果不使用`self`前綴，Swift 就認為兩次使用的`x`都指的是名稱為`x`的函式參數。

<a name="modifying_value_types"></a>
### 在實例方法中修改值型別(Modifying Value Types from Within Instance Methods)

結構和列舉是**值型別**。一般情況下，值型別的屬性不能在它的實例方法中被修改。

但是，如果你確實需要在某個具體的方法中修改結構或者列舉的屬性，你可以選擇`變異(mutating)`這個方法，然後方法就可以從方法內部改變它的屬性；並且它做的任何改變在方法結束時還會保留在原始結構中。方法還可以給它隱含的`self`屬性賦值一個全新的實例，這個新實例在方法結束後將替換原來的實例。

要使用`變異`方法， 將關鍵字`mutating` 放到方法的`func`關鍵字之前就可以了：

```swift
struct Point {
  var x = 0.0, y = 0.0
  mutating func moveByX(deltaX: Double, y deltaY: Double) {
    x += deltaX
    y += deltaY
  }
}
var somePoint = Point(x: 1.0, y: 1.0)
somePoint.moveByX(2.0, y: 3.0)
println("The point is now at (\(somePoint.x), \(somePoint.y))")
// 輸出 "The point is now at (3.0, 4.0)"
```

上面的`Point`結構定義了一個變異方法（mutating method）`moveByX`，`moveByX`用來移動點。`moveByX`方法在被呼叫時修改了這個點，而不是回傳一個新的點。方法定義時加上`mutating`關鍵字,這才讓方法可以修改值型別的屬性。

注意：不能在結構型別常數上呼叫變異方法，因為常數的屬性不能被改變，即使想改變的是常數的變數屬性也不行

```swift
let fixedPoint = Point(x: 3.0, y: 3.0)
fixedPoint.moveByX(2.0, y: 3.0)
// this will report an error
```

<a name="mutating_method_self"></a>
### 在變異方法中給self賦值(Assigning to self Within a Mutating Method)

變異方法能夠賦給隱含屬性`self`一個全新的實例。上面`Point`的範例可以用下面的方式改寫：

```swift
struct Point {
  var x = 0.0, y = 0.0
  mutating func moveByX(deltaX: Double, y deltaY: Double) {
    self = Point(x: x + deltaX, y: y + deltaY)
  }
}
```

新版的變異方法`moveByX`創建了一個新的結構（它的 x 和 y 的值都被設定為目標值）。呼叫這個版本的方法和呼叫上個版本的最終結果是一樣的。

列舉的變異方法可以把`self`設置為相同的列舉型別中不同的成員：

```swift
enum TriStateSwitch {
  case off, low, high
  mutating func next() {
    switch self {
    case .off:
      self = .low
    case .low:
      self = .high
    case .high:
      self = .off
    }
  }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
// ovenLight 現在等於 .high
ovenLight.next()
// ovenLight 現在等於 .off
```

上面的範例中定義了一個三態開關的列舉。每次呼叫`next`方法時，開關在不同的電源狀態（`off`，`low`，`high`）之前迴圈切換。

<a name="type_methods"></a>
## 型別方法(Type Methods)

實例方法是被型別的某個實例呼叫的方法。你也可以定義型別本身呼叫的方法，這種方法就叫做**型別方法**。宣告類別的型別方法，在方法的`func`關鍵字之前加上關鍵字`class`；宣告結構和列舉的型別方法，在方法的`func`關鍵字之前加上關鍵字`static`。

> 注意：  
> 在 Objective-C 裡面，你只能為 Objective-C 的類別定義型別方法（type-level methods）。在 Swift 中，你可以為所有的類別、結構和列舉定義型別方法：每一個型別方法都被它所支援的型別顯式包含。  

型別方法和實例方法一樣用點語法呼叫。但是，你是在型別層面上呼叫這個方法，而不是在實例層面上呼叫。下面是如何在`SomeClass`類別上呼叫型別方法的範例：

```swift
class SomeClass {
  class func someTypeMethod() {
    // type method implementation goes here
  }
}
SomeClass.someTypeMethod()
```

在型別方法的方法體（body）中，`self`指向這個型別本身，而不是型別的某個實例。對於結構和列舉來說，這意味著你可以用`self`來消除靜態屬性和靜態方法參數之間的歧義（類似於我們在前面處理實例屬性和實例方法參數時做的那樣）。

一般來說，任何未限定的方法和屬性名稱，將會來自於本類別中另外的型別級別的方法和屬性。一個型別方法可以呼叫本類別中另一個型別方法的名稱，而無需在方法名稱前面加上型別名稱的前綴。同樣，結構和列舉的型別方法也能夠直接通過靜態屬性的名稱存取靜態屬性，而不需要型別名稱前綴。

下面的範例定義了一個名為`LevelTracker`結構。它監測玩家的遊戲發展情況（遊戲的不同層次或階段）。這是一個單人遊戲，但也可以儲存多個玩家在同一設備上的遊戲資訊。

遊戲初始時，所有的遊戲等級（除了等級 1）都被鎖定。每次有玩家完成一個等級，這個等級就對這個設備上的所有玩家解鎖。`LevelTracker`結構用靜態屬性和方法監測遊戲的哪個等級已經被解鎖。它還監測每個玩家的當前等級。

```swift
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
```

`LevelTracker`監測玩家的已解鎖的最高等級。這個值被儲存在靜態屬性`highestUnlockedLevel`中。

`LevelTracker`還定義了兩個型別方法與`highestUnlockedLevel`配合工作。第一個型別方法是`unlockLevel`：一旦新等級被解鎖，它會更新`highestUnlockedLevel`的值。第二個型別方法是`levelIsUnlocked`：如果某個給定的等級已經被解鎖，它將回傳`true`。（注意：儘管我們沒有使用類似`LevelTracker.highestUnlockedLevel`的寫法，這個型別方法還是能夠存取靜態屬性`highestUnlockedLevel`）

除了靜態屬性和型別方法，`LevelTracker`還監測每個玩家的進度。它用實例屬性`currentLevel`來監測玩家當前的等級。

為了便於管理`currentLevel`屬性，`LevelTracker`定義了實例方法`advanceToLevel`。這個方法會在更新`currentLevel`之前檢查所請求的新等級是否已經解鎖。`advanceToLevel`方法回傳布林值以指示是否能夠設置`currentLevel`。

下面，`Player`類別使用`LevelTracker`來監測和更新每個玩家的發展進度：

```swift
class Player {
  var tracker = LevelTracker()
  let playerName: String
  func completedLevel(level: Int) {
    LevelTracker.unlockLevel(level + 1)
    tracker.advanceToLevel(level + 1)
  }
  init(name: String) {
    playerName = name
  }
}
```

`Player`類別創建一個新的`LevelTracker`實例來監測這個使用者的發展進度。它提供了`completedLevel`方法：一旦玩家完成某個指定等級就呼叫它。這個方法為所有玩家解鎖下一等級，並且將當前玩家的進度更新為下一等級。（我們忽略了`advanceToLevel`回傳的布林值，因為之前呼叫`LevelTracker.unlockLevel`時就知道了這個等級已經被解鎖了）。

你還可以為一個新的玩家創建一個`Player`的實例，然後看這個玩家完成等級一時發生了什麼：

```swift
var player = Player(name: "Argyrios")
player.completedLevel(1)
println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// 輸出 "highest unlocked level is now 2"（最高等級現在是2）
```

如果你創建了第二個玩家，並嘗試讓它開始一個沒有被任何玩家解鎖的等級，那麼這次設置玩家當前等級的嘗試將會失敗：

```swift
player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
  println("player is now on level 6")
} else {
  println("level 6 has not yet been unlocked")
}
// 輸出 "level 6 has not yet been unlocked"（等級6還沒被解鎖）
```
