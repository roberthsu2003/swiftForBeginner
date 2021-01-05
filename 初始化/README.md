# 初始化（Initialization）
-----------------

本頁包含內容：

- [儲存型屬性的初始賦值](#setting_initial_values_for_stored_properties)
- [自訂初始化過程](#customizing_initialization)
- [預設初始器](#default_initializers)
- [值value type的初始器分派](#initializer_delegation_for_value_types)
- [類別的繼承和初始化過程](#class_inheritance_and_initialization)
- [透過closure和函式來設置屬性的預設值](#setting_a_default_property_value_with_a_closure_or_function)


建構過程是為了使用某個類別、結構或列舉型別的實例而進行的準備過程。這個過程包含了為實例中的每個屬性設置初始值和為其執行必要的準備和初始化任務。

建構過程是通過定義初始器（`Initializers`）來實作的，這些初始器可以看做是用來創建特定型別實例的特殊方法。與 Objective-C 中的初始器不同，Swift 的初始器無需回傳值，它們的主要任務是保證新實例在第一次使用前完成正確的初始化。

類別實例也可以通過定義析構器（`deinitializer`）在類別實例釋放之前執行特定的清除工作。

<a name="setting_initial_values_for_stored_properties"></a>
## store property 設定初始值

類別和結構在實例創建時，必須為所有儲存型屬性設置合適的初始值。儲存型屬性的值不能處於一個未知的狀態。

你可以在初始器中為儲存型屬性賦初值，也可以在定義屬性時為其設置預設值。以下章節將詳細介紹這兩種方法。

>注意：  
當你為儲存型屬性設置預設值或者在初始器中為其賦值時，它們的值是被直接設置的，不會觸發任何屬性觀測器（`property observers`）。

### 初始器

初始器在創建某特定型別的新實例時呼叫。它的最簡形式類似於一個不帶任何參數的實例方法，以關鍵字`init`命名。

下面範例中定義了一個用來保存華氏溫度的結構`Fahrenheit`，它擁有一個`Double`型別的儲存型屬性`temperature`：

```swift
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
```

```swift
var f = Fahrenheit()
println("The default temperature is \(f.temperature)° Fahrenheit")
// 輸出 "The default temperature is 32.0° Fahrenheit」
```

這個結構定義了一個不帶參數的初始器`init`，並在裡面將儲存型屬性`temperature`的值初始化為`32.0`（華攝氏度下水的冰點）。

### 預設屬性值

如前所述，你可以在初始器中為儲存型屬性設置初始值；同樣，你也可以在屬性宣告時為其設置預設值。

>注意：  
如果一個屬性總是使用同一個初始值，可以為其設置一個預設值。無論定義預設值還是在初始器中賦值，最終它們實作的效果是一樣的，只不過預設值跟屬性建構過程結合的更緊密。使用預設值能讓你的初始器更簡潔、更清晰，且能通過預設值自動推導出屬性的型別；同時，它也能讓你充分利用預設初始器、初始器繼承（後續章節將講到）等特性。

你可以使用更簡單的方式在定義結構`Fahrenheit`時為屬性`temperature`設置預設值：

```swift
struct Fahrenheit {
    var temperature = 32.0
}
```

<a name="customizing_initialization"></a>
## 自訂初始化過程

你可以通過輸入參數和可選屬性型別來定制建構過程，也可以在建構過程中修改常數屬性。這些都將在後面章節中提到。

### 初始參數

你可以在定義初始器時提供建構參數，為其提供定制化建構所需值的型別和名字。初始器參數的功能和語法跟函式和方法參數相同。

下面範例中定義了一個包含攝氏度溫度的結構`Celsius`。它定義了兩個不同的初始器：`init(fromFahrenheit:)`和`init(fromKelvin:)`，二者分別通過接受不同刻度表示的溫度值來創建新的實例：

```swift
struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
```

```swift
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius 是 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius 是 0.0」
```

第一個初始器擁有一個建構參數，其外部名字為`fromFahrenheit`，內部名字為`fahrenheit`；第二個初始器也擁有一個建構參數，其外部名字為`fromKelvin`，內部名字為`kelvin`。這兩個初始器都將唯一的參數值轉換成攝氏溫度值，並保存在屬性`temperatureInCelsius`中。

### 參數名稱和引數名稱

跟函式和方法參數相同，建構參數也存在一個在初始器內部使用的參數名字和一個在呼叫初始器時使用的外部參數名字。

然而，初始器並不像函式和方法那樣在括號前有一個可辨別的名字。所以在呼叫初始器時，主要通過初始器中的參數名和型別來確定需要呼叫的初始器。正因為參數如此重要，如果你在定義初始器時沒有提供參數的外部名字，Swift 會為每個初始器的參數自動生成一個跟內部名字相同的外部名，就相當於在每個建構參數之前加了一個雜湊符號。

> 注意：  
如果你不希望為初始器的某個參數提供外部名字，你可以使用底線`_`來顯示描述它的外部名，以此覆蓋上面所說的預設行為。

以下範例中定義了一個結構`Color`，它包含了三個常數：`red`、`green`和`blue`。這些屬性可以儲存0.0到1.0之間的值，用來指示顏色中紅、綠、藍成分的含量。

`Color`提供了一個初始器，其中包含三個`Double`型別的建構參數：

```swift
struct Color {
    let red = 0.0, green = 0.0, blue = 0.0
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
}
```

每當你創建一個新的`Color`實例，你都需要通過三種顏色的外部參數名來傳值，並呼叫初始器。

```swift
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
```

注意，如果不通過外部參數名字傳值，你是沒法呼叫這個初始器的。只要初始器定義了某個外部參數名，你就必須使用它，忽略它將導致編譯錯誤：

```swift
let veryGreen = Color(0.0, 1.0, 0.0)
// 報編譯時錯誤，需要外部名稱
```

### 沒有引數名稱的初始器

```swift
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsius(37.0)
// bodyTemperature.temperatureInCelsius is 37.0
```

### optioanl屬性型別

如果你定制的型別包含一個邏輯上允許取值為空的儲存型屬性--不管是因為它無法在初始化時賦值，還是因為它可以在之後某個時間點可以賦值為空--你都需要將它定義為可選型別`optional type`。可選型別的屬性將自動初始化為空`nil`，表示這個屬性是故意在初始化時設置為空的。

下面範例中定義了類別`SurveyQuestion`，它包含一個可選字串屬性`response`：

```swift
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// 輸出 "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese.
```

調查問題在問題提出之後，我們才能得到回答。所以我們將屬性回答`response`宣告為`String?`型別，或者說是可選字串型別`optional String`。當`SurveyQuestion`實例化時，它將自動賦值為空`nil`，表明暫時還不存在此字串。

### 初始過程中指定常數屬性的值

只要在建構過程結束前常數的值能確定，你可以在建構過程中的任意時間點修改常數屬性的值。

>注意：  
對某個類別實例來說，它的常數屬性只能在定義它的類別的建構過程中修改；不能在子類別中修改。

你可以修改上面的`SurveyQuestion`示例，用常數屬性替代變數屬性`text`，指明問題內容`text`在其創建之後不會再被修改。儘管`text`屬性現在是常數，我們仍然可以在其類別的初始器中修改它的值：

```swift
class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
// 輸出 "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)
```

<a name="default_initializers"></a>
## 預設初始器

Swift 將為所有屬性已提供預設值的且自身沒有定義任何初始器的結構或基類別，提供一個預設的初始器。這個預設初始器將簡單的創建一個所有屬性值都設置為預設值的實例。

下面範例中創建了一個類別`ShoppingListItem`，它封裝了購物清單中的某一項的屬性：名字（`name`）、數量（`quantity`）和購買狀態 `purchase state`。

```swift
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
```

由於`ShoppingListItem`類別中的所有屬性都有預設值，且它是沒有父類別的基類別，它將自動獲得一個可以為所有屬性設置預設值的預設初始器（儘管程式碼中沒有顯式為`name`屬性設置預設值，但由於`name`是可選字串型別，它將預設設置為`nil`）。上面範例中使用預設初始器創造了一個`ShoppingListItem`類別的實例（使用`ShoppingListItem()`形式的初始器語法），並將其賦值給變數`item`。

### 結構的智慧型初始器

除上面提到的預設初始器，如果結構對所有儲存型屬性提供了預設值且自身沒有提供定制的初始器，它們能自動獲得一個逐一成員初始器。

逐一成員初始器是用來初始化結構新實例裡成員屬性的快捷方法。我們在呼叫逐一成員初始器時，通過與成員屬性名相同的參數名進行傳值來完成對成員屬性的初始賦值。

下面範例中定義了一個結構`Size`，它包含兩個屬性`width`和`height`。Swift 可以根據這兩個屬性的初始賦值`0.0`自動推導出它們的型別`Double`。

由於這兩個儲存型屬性都有預設值，結構`Size`自動獲得了一個逐一成員初始器 `init(width:height:)`。 你可以用它來為`Size`創建新的實例：

```swift
struct Size {
    var width = 0.0, height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)
```

<a name="initializer_delegation_for_value_types"></a>
## value type的初始器分派

初始器可以通過呼叫其它初始器來完成實例的部分建構過程。這一過程稱為初始器分派，它能減少多個初始器間的程式碼重複。

初始器代理的實作規則和形式在值型別和類型別中有所不同。值型別（結構和列舉型別）不支援繼承，所以初始器代理的過程相對簡單，因為它們只能代理任務給本身提供的其它初始器。類別則不同，它可以繼承自其它類別，這意味著類別有責任保證其所有繼承的儲存型屬性在建構時也能正確的初始化。
對於值型別，你可以使用`self.init`在自定義的初始器中參考其它的屬於相同值型別的初始器。並且你只能在初始器內部呼叫`self.init`。

注意，如果你為某個值型別定義了一個定制的初始器，你將無法存取到預設初始器（如果是結構，則無法存取逐一物件初始器）。這個限制可以防止你在為值型別定義了一個更複雜的，完成了重要準備初始器之後，別人還是錯誤的使用了那個自動生成的初始器。

>注意：  
假如你想通過預設初始器、逐一物件初始器以及你自己定制的初始器為值型別創建實例，我們建議你將自己定制的初始器寫到擴展（`extension`）中，而不是跟值型別定義混在一起。

下面範例將定義一個結構`Rect`，用來展現幾何矩形。這個範例需要兩個輔助的結構`Size`和`Point`，它們各自為其所有的屬性提供了初始值`0.0`。

```swift
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
```

你可以通過以下三種方式為`Rect`創建實例--使用預設的0值來初始化`origin`和`size`屬性；使用特定的`origin`和`size`實例來初始化；使用特定的`center`和`size`來初始化。在下面`Rect`結構定義中，我們為著三種方式提供了三個自定義的初始器：

```swift
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
```

第一個`Rect`初始器`init()`，在功能上跟沒有自定義初始器時自動獲得的預設初始器是一樣的。這個初始器是一個空函式，使用一對大括號`{}`來描述，它沒有執行任何定制的建構過程。呼叫這個初始器將回傳一個`Rect`實例，它的`origin`和`size`屬性都使用定義時的預設值`Point(x: 0.0, y: 0.0)`和`Size(width: 0.0, height: 0.0)`：

```swift
let basicRect = Rect()
// basicRect 的原點是 (0.0, 0.0)，尺寸是 (0.0, 0.0)
```

第二個`Rect`初始器`init(origin:size:)`，在功能上跟結構在沒有自定義初始器時獲得的逐一成員初始器是一樣的。這個初始器只是簡單的將`origin`和`size`的參數值賦給對應的儲存型屬性：

```swift
let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0))
// originRect 的原點是 (2.0, 2.0)，尺寸是 (5.0, 5.0)
```

第三個`Rect`初始器`init(center:size:)`稍微複雜一點。它先通過`center`和`size`的值計算出`origin`的坐標。然後再呼叫（或代理給）`init(origin:size:)`初始器來將新的`origin`和`size`值賦值到對應的屬性中：

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
```swift
size: Size(width: 3.0, height: 3.0))
```
// centerRect 的原點是 (2.5, 2.5)，尺寸是 (3.0, 3.0)

初始器`init(center:size:)`可以自己將`origin`和`size`的新值賦值到對應的屬性中。然而盡量利用現有的初始器和它所提供的功能來實作`init(center:size:)`的功能，是更方便、更清晰和更直觀的方法。

>注意：  
如果你想用另外一種不需要自己定義`init()`和`init(origin:size:)`的方式來實作這個範例，請參考[擴展]。

<a name="class_inheritance_and_initialization"></a>
## 類別的繼承和初始過程

類別裡面的所有儲存型屬性--包括所有繼承自父類別的屬性--都必須在初始過程中設置初始值。

Swift 提供了兩種型別的類別初始器來確保所有類別實例中儲存型屬性都能獲得初始值，它們分別是指定初始器和便利初始器。

### Designated初始器和Convenience初始器

指定初始器是類別中最主要的初始器。一個Designated初始器將初始化類別中提供的所有屬性，並根據父類別鏈往上呼叫父類別的初始器來實作父類別的初始化。

每一個類別都必須擁有至少一個指定初始器。在某些情況下，許多類別通過繼承了父類別中的指定初始器而滿足了這個條件。

Convenience初始器是類別中比較次要的、輔助型的初始器。你可以定義Convenience初始器來呼叫同一個類別中的指定初始器，並為其參數提供預設值。你也可以定義Convenience初始器來創建一個特殊用途或特定輸入的實例。

你應當只在必要的時候為類別提供便利初始器，比方說某種情況下通過使用Convenience初始器來快捷呼叫某個Designated初始器，能夠節省更多開發時間並讓類別的建構過程更清、晰明。

### 初始器語法

Designated初始器語法

```swift
init(parameters) {
    statements
}
```

Convenience初始器

```swift
convenience init(parameters) {
    statements
}

```
<a name="initialization_chain"></a>
### 初始器工作分派

為了簡化指定初始器和便利初始器之間的呼叫關系，Swift 采用以下三條規則來限制初始器之間的分派呼叫：

#### 規則 1
Designate初始器必須呼叫其直接父類別的的Designate初始器。

#### 規則 2
Convenience初始器必須呼叫同一類別中定義的其它初始器。

#### 規則 3
Convenience初始器必須最終以呼叫一個Designate初始器結束。

一個更方便記憶的方法是：

- Designate初始器必須總是向上分派
- Convenience初始器必須總是橫向分派

這些規則可以通過下面圖例來說明：

![初始分派圖](images/pic1.png)

如圖所示，父類別中包含一個指定初始器和兩個便利初始器。其中一個便利初始器呼叫了另外一個便利初始器，而後者又呼叫了唯一的指定初始器。這滿足了上面提到的規則2和3。這個父類別沒有自己的父類別，所以規則1沒有用到。

子類別中包含兩個指定初始器和一個便利初始器。便利初始器必須呼叫兩個指定初始器中的任意一個，因為它只能呼叫同一個類別裡的其他初始器。這滿足了上面提到的規則2和3。而兩個指定初始器必須呼叫父類別中唯一的指定初始器，這滿足了規則1。

> 注意：  
這些規則不會影響使用時，如何用類別去創建實例。任何上圖中展示的初始器都可以用來完整創建對應類別的實例。這些規則只在實作類別的定義時有影響。

下面圖例中展示了一種更複雜的類別層級結構。它演示了指定初始器是如果在類別層級中充當「管道」的作用，在類別的初始器鏈上簡化了類別之間的內部關系。

![複雜初始器代理圖](./images/pic4.png)

<a name="two_phase_initialization"></a>
### 兩段式初始過程

Swift 中類別的建構過程包含兩個階段。第一個階段，每個儲存型屬性通過引入它們的類別的初始器來設置初始值。當每一個儲存型屬性值被確定後，第二階段開始，它給每個類別一次機會在新實例準備使用之前進一步定制它們的儲存型屬性。

兩段式建構過程的使用讓建構過程更安全，同時在整個類別層級結構中給予了每個類別完全的靈活性。兩段式建構過程可以防止屬性值在初始化之前被存取；也可以防止屬性被另外一個初始器意外地賦予不同的值。

> 注意：  
Swift的兩段式建構過程跟 Objective-C 中的建構過程類似。最主要的區別在於階段 1，Objective-C 給每一個屬性賦值`0`或空值（比如說`0`或`nil`）。Swift  的建構流程則更加靈活，它允許你設置定制的初始值，並自如應對某些屬性不能以`0`或`nil`作為合法預設值的情況。

Swift 編譯器將執行 4 種有效的安全檢查，以確保兩段式建構過程能順利完成：

#### 安全檢查 1

指定初始器必須保證它所在類別引入的所有屬性都必須先初始化完成，之後才能將其它建構任務向上代理給父類別中的初始器。

如上所述，一個物件的內存只有在其所有儲存型屬性確定之後才能完全初始化。為了滿足這一規則，指定初始器必須保證它所在類別引入的屬性在它往上代理之前先完成初始化。

#### 安全檢查 2

指定初始器必須先向上代理呼叫父類別初始器，然後再為繼承的屬性設置新值。如果沒這麼做，指定初始器賦予的新值將被父類別中的初始器所覆蓋。

#### 安全檢查 3

便利初始器必須先代理呼叫同一類別中的其它初始器，然後再為任意屬性賦新值。如果沒這麼做，便利初始器賦予的新值將被同一類別中其它指定初始器所覆蓋。

#### 安全檢查 4

初始器在第一階段建構完成之前，不能呼叫任何實例方法、不能讀取任何實例屬性的值，也不能參考`self`的值。

以下是兩段式建構過程中基於上述安全檢查的建構流程展示：

#### 階段 1

- 某個指定初始器或便利初始器被呼叫；
- 完成新實例內存的分配，但此時內存還沒有被初始化；
- 指定初始器確保其所在類別引入的所有儲存型屬性都已賦初值。儲存型屬性所屬的內存完成初始化；
- 指定初始器將呼叫父類別的初始器，完成父類別屬性的初始化；
- 這個呼叫父類別初始器的過程沿著初始器鏈一直往上執行，直到到達初始器鏈的最頂部；
- 當到達了初始器鏈最頂部，且已確保所有實例包含的儲存型屬性都已經賦值，這個實例的內存被認為已經完全初始化。此時階段1完成。

#### 階段 2

- 從頂部初始器鏈一直往下，每個初始器鏈中類別的指定初始器都有機會進一步定制實例。初始器此時可以存取`self`、修改它的屬性並呼叫實例方法等等。
- 最終，任意初始器鏈中的便利初始器可以有機會定制實例和使用`self`。

下圖展示了在假定的子類別和父類別之間建構的階段1：
·
![建構過程階段1](images/pic2.png)

在這個範例中，建構過程從對子類別中一個便利初始器的呼叫開始。這個便利初始器此時沒法修改任何屬性，它把建構任務代理給同一類別中的指定初始器。

如安全檢查1所示，指定初始器將確保所有子類別的屬性都有值。然後它將呼叫父類別的指定初始器，並沿著造器鏈一直往上完成父類別的構建過程。

父類別中的指定初始器確保所有父類別的屬性都有值。由於沒有更多的父類別需要構建，也就無需繼續向上做構建代理。

一旦父類別中所有屬性都有了初始值，實例的內存被認為是完全初始化，而階段1也已完成。

以下展示了相同建構過程的階段2：

![構建過程階段2](images/pic3.png)

父類別中的指定初始器現在有機會進一步來定制實例（儘管它沒有這種必要）。

一旦父類別中的指定初始器完成呼叫，子類別的構指定初始器可以執行更多的定制操作（同樣，它也沒有這種必要）。

最終，一旦子類別的指定初始器完成呼叫，最開始被呼叫的便利初始器可以執行更多的定制操作。

<a name="initializer_inheritance_and_overriding"></a>
### 初始器的繼承和覆寫

跟 Objective-C 中的子類別不同，Swift 中的子類別不會預設繼承父類別的初始器。Swift 的這種機制可以防止一個父類別的簡單初始器被一個更專業的子類別繼承，並被錯誤的用來創建子類別的實例。

假如你希望自定義的子類別中能實作一個或多個跟父類別相同的初始器--也許是為了完成一些定制的建構過程--你可以在你定制的子類別中提供和覆寫與父類別相同的初始器。

如果你覆寫的初始器是一個指定初始器，你可以在子類別裡覆寫它的實作，並在自定義版本的初始器中呼叫父類別版本的初始器。

如果你覆寫的初始器是一個便利初始器，你的覆寫過程必須通過呼叫同一類別中提供的其它指定初始器來實作。

>注意：  
與方法、屬性和subscript相同，在覆寫初始器時必需要使用關鍵字`override`。

```swift
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)

```

```swift
class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver

```

<a name="automatic_initializer_inheritance"></a>
### 自動初始器的繼承

如上所述，子類別不會預設繼承父類別的初始器。但是如果特定條件可以滿足，父類別初始器是可以被自動繼承的。在實踐中，這意味著對於許多常見場景你不必覆寫父類別的初始器，並且在盡可能安全的情況下以最小的代價來繼承父類別的初始器。
初始器
假設要為子類別中引入的任意新屬性提供預設值，請遵守以下2個規則：

#### 規則 1

如果子類別沒有定義任何指定初始器，它將自動繼承所有父類別的指定初始器。

#### 規則 2

如果子類別提供了所有父類別指定初始器的實作--不管是通過規則1繼承過來的，還是通過自定義實作的--它將自動繼承所有父類別的便利初始器。

即使你在子類別中添加了更多的便利初始器，這兩條規則仍然適用。

>注意：  
子類別可以通過部分滿足規則2的方式，使用子類別便利初始器來實作父類別的指定初始器。

### 指定初始器和便利初始器的語法

類別的指定初始器的寫法跟值型別簡單初始器一樣：

```swift
init(parameters) {
    statements
}
```

便利初始器也采用相同樣式的寫法，但需要在`init`關鍵字之前放置`convenience`關鍵字，並使用空格將它們倆分開：

```swift
convenience init(parameters) {
    statements
}
```

### 指定初始器和便利初始器實戰

接下來的範例將在實戰中展示指定初始器、便利初始器和自動初始器的繼承。它定義了包含三個類別`Food`、`RecipeIngredient`以及`ShoppingListItem`的類別層次結構，並將演示它們的初始器是如何相互作用的。

類別層次中的基類別是`Food`，它是一個簡單的用來封裝食物名字的類別。`Food`類別引入了一個叫做`name`的`String`型別屬性，並且提供了兩個初始器來創建`Food`實例：

```swift
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
```

下圖中展示了`Food`的初始器鏈：

![Food初始器鏈](./images/pic5.png)

類別沒有提供一個預設的逐一成員初始器，所以`Food`類別提供了一個接受單一參數`name`的指定初始器。這個初始器可以使用一個特定的名字來創建新的`Food`實例：

```swift
let namedMeat = Food(name: "Bacon")
// namedMeat 的名字是 "Bacon」
```

`Food`類別中的初始器`init(name: String)`被定義為一個指定初始器，因為它能確保所有新`Food`實例的中儲存型屬性都被初始化。`Food`類別沒有父類別，所以`init(name: String)`初始器不需要呼叫`super.init()`來完成建構。

`Food`類別同樣提供了一個沒有參數的便利初始器 `init()`。這個`init()`初始器為新食物提供了一個預設的占位名字，通過代理呼叫同一類別中定義的指定初始器`init(name: String)`並給參數`name`傳值`[Unnamed]`來實作：

```swift
let mysteryMeat = Food()
// mysteryMeat 的名字是 [Unnamed]
```

類別層級中的第二個類別是`Food`的子類別`RecipeIngredient`。`RecipeIngredient`類別構建了食譜中的一味調味劑。它引入了`Int`型別的數量屬性`quantity`（以及從`Food`繼承過來的`name`屬性），並且定義了兩個初始器來創建`RecipeIngredient`實例：

```swift
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
```

下圖中展示了`RecipeIngredient`類別的初始器鏈：

![RecipeIngredient初始器](./images/pic6.png)

`RecipeIngredient`類別擁有一個指定初始器`init(name: String, quantity: Int)`，它可以用來產生新`RecipeIngredient`實例的所有屬性值。這個初始器一開始先將傳入的`quantity`參數賦值給`quantity`屬性，這個屬性也是唯一在`RecipeIngredient`中新引入的屬性。隨後，初始器將任務向上代理給父類別`Food`的`init(name: String)`。這個過程滿足[兩段式建構過程](#two_phase_initialization)中的安全檢查1。

`RecipeIngredient`也定義了一個便利初始器`init(name: String)`，它只通過`name`來創建`RecipeIngredient`的實例。這個便利初始器假設任意`RecipeIngredient`實例的`quantity`為1，所以不需要顯示指明數量即可創建出實例。這個便利初始器的定義可以讓創建實例更加方便和快捷，並且避免了使用重複的程式碼來創建多個`quantity`為 1 的`RecipeIngredient`實例。這個便利初始器只是簡單的將任務代理給了同一類別裡提供的指定初始器。

注意，`RecipeIngredient`的便利初始器`init(name: String)`使用了跟`Food`中指定初始器`init(name: String)`相同的參數。儘管`RecipeIngredient`這個初始器是便利初始器，`RecipeIngredient`依然提供了對所有父類別指定初始器的實作。因此，`RecipeIngredient`也能自動繼承了所有父類別的便利初始器。

在這個範例中，`RecipeIngredient`的父類別是`Food`，它有一個便利初始器`init()`。這個初始器因此也被`RecipeIngredient`繼承。這個繼承的`init()`函式版本跟`Food`提供的版本是一樣的，除了它是將任務代理給`RecipeIngredient`版本的`init(name: String)`而不是`Food`提供的版本。

所有的這三種初始器都可以用來創建新的`RecipeIngredient`實例：

```swift
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
```

類別層級中第三個也是最後一個類別是`RecipeIngredient`的子類別，叫做`ShoppingListItem`。這個類別構建了購物單中出現的某一種調味料。

購物單中的每一項總是從`unpurchased`未購買狀態開始的。為了展現這一事實，`ShoppingListItem`引入了一個布林型別的屬性`purchased`，它的預設值是`false`。`ShoppingListItem`還添加了一個計算型屬性`description`，它提供了關於`ShoppingListItem`實例的一些文字描述：

```swift
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
```

> 注意：  
`ShoppingListItem`沒有定義初始器來為`purchased`提供初始化值，這是因為任何添加到購物單的項的初始狀態總是未購買。

由於它為自己引入的所有屬性都提供了預設值，並且自己沒有定義任何初始器，`ShoppingListItem`將自動繼承所有父類別中的指定初始器和便利初始器。

下圖種展示了所有三個類別的初始器鏈：

![三類別初始器圖](./images/pic7.png)

你可以使用全部三個繼承來的初始器來創建`ShoppingListItem`的新實例：

```swift
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}
// 1 x orange juice ✔
// 1 x bacon ✘
// 6 x eggs ✘
```

如上所述，範例中通過字面量方式創建了一個新陣列`breakfastList`，它包含了三個新的`ShoppingListItem`實例，因此陣列的型別也能自動推導為`ShoppingListItem[]`。在陣列創建完之後，陣列中第一個`ShoppingListItem`實例的名字從`[Unnamed]`修改為`Orange juice`，並標記為已購買。接下來通過遍歷陣列每個元素並列印它們的描述值，展示了所有項當前的預設狀態都已按照預期完成了賦值。

## 可能失敗的初始化

```swift
let wholeNumber: Double = 12345.0
let pi = 3.14159

if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
// Prints "12345.0 conversion to Int maintains value of 12345"

let valueChanged = Int(exactly: pi)
// valueChanged is of type Int?, not Int

if valueChanged == nil {
    print("\(pi) conversion to Int does not maintain value")
}
// Prints "3.14159 conversion to Int does not maintain value
```

```swift
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe


let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
```

## Required Initializers
要求所有子類別必需實作初始化

```swift
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

```
<a name="setting_a_default_property_value_with_a_closure_or_function"></a>
## 通過閉包和函式來設置屬性的預設值

如果某個儲存型屬性的預設值需要特別的定制或準備，你就可以使用閉包或全域函式來為其屬性提供定制的預設值。每當某個屬性所屬的新型別實例創建時，對應的閉包或函式會被呼叫，而它們的回傳值會當做預設值賦值給這個屬性。

這種型別的閉包或函式一般會創建一個跟屬性型別相同的臨時變數，然後修改它的值以滿足預期的初始狀態，最後將這個臨時變數的值作為屬性的預設值進行回傳。

下面列舉了閉包如何提供預設值的程式碼概要：

```swift
class SomeClass {
    let someProperty: SomeType = {
        // 在這個閉包中給 someProperty 創建一個預設值
        // someValue 必須和 SomeType 型別相同
        return someValue
        }()
}
```

注意閉包結尾的大括號後面接了一對空的小括號。這是用來告訴 Swift 需要立刻執行此閉包。如果你忽略了這對括號，相當於是將閉包本身作為值賦值給了屬性，而不是將閉包的回傳值賦值給屬性。

>注意：  
如果你使用閉包來初始化屬性的值，請記住在閉包執行時，實例的其它部分都還沒有初始化。這意味著你不能夠在閉包裡存取其它的屬性，就算這個屬性有預設值也不允許。同樣，你也不能使用隱式的`self`屬性，或者呼叫其它的實例方法。

下面範例中定義了一個結構`Checkerboard`，它構建了西洋跳棋遊戲的棋盤：

![西洋跳棋棋盤](./images/pic8.png)

西洋跳棋遊戲在一副黑白格交替的 10x10 的棋盤中進行。為了呈現這副遊戲棋盤，`Checkerboard`結構定義了一個屬性`boardColors`，它是一個包含 100 個布林值的陣列。陣列中的某元素布林值為`true`表示對應的是一個黑格，布林值為`false`表示對應的是一個白格。陣列中第一個元素代表棋盤上左上角的格子，最後一個元素代表棋盤上右下角的格子。

`boardColor`陣列是通過一個閉包來初始化和組裝顏色值的：

```swift
struct Checkerboard {
    let boardColors: Bool[] = {
        var temporaryBoard = Bool[]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
        }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}
```

每當一個新的`Checkerboard`實例創建時，對應的賦值閉包會執行，一系列顏色值會被計算出來作為預設值賦值給`boardColors`。上面範例中描述的閉包將計算出棋盤中每個格子合適的顏色，將這些顏色值保存到一個臨時陣列`temporaryBoard`中，並在構建完成時將此陣列作為閉包回傳值回傳。這個回傳的值將保存到`boardColors`中，並可以通`squareIsBlackAtRow`這個工具函式來查詢。

```swift
let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
// 輸出 "true"
println(board.squareIsBlackAtRow(9, column: 9))
// 輸出 "false"
```
