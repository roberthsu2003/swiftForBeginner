# 字串和字元
---
- [字串表示法](#string_literals)
- [初始化空字串](#initializing_an_empty_string)
- [字串可變性](#string_mutability)
- [字串是實值型別](#strings_are_value_types)
- [使用字元](#working_with_characters)
- [連接字串和字元](#concatenating_strings_and_characters)
- [字串插值](#string_interpolation)
- [計算字元數量](#counting_characters)

`String`是例如 "hello, world"、"albatross" 這樣的有序的`Character`（字元）型別的值的集合，透過`String`型別來表示。

Swift 的`String`和`Character`型別提供了一個快速的、相容 Unicode 的方式來處理程式碼中的文字訊息。
創建和操作字串的語法與 C 語言中字串操作相似，輕量並且易讀。
字串連接操作只需要簡單地透過`+`號將兩個字串相連即可。
與 Swift 中其他值一樣，能否更改字串的值，取決於其被定義為常數還是變數。

儘管語法簡單，但`String`型別是一種快速、現代化的字串實作。
每一個字串都是由獨立編碼的 Unicode 字元組成，並支援以不同 Unicode 表示（representations）來存取這些字元。

Swift 可以在常數、變數、字面量和表達式中進行字串插值操作，可以輕鬆創建用於顯示、儲存和列印的自定義字串。

> 注意：
Swift 的`String`型別與 Foundation `NSString`類別進行了無縫接軌。如果你利用 Cocoa 或 Cocoa Touch 中的 Foundation Framework 進行工作，所有`NSString` API 都可以呼叫你創建的任意`String`型別的值。除此之外，還可以使用本章介紹的`String`特性。你也可以在任意要求傳入`NSString`實體作為參數的 API 中使用`String`型別的值來替代。


<a name="string_literals"></a>
## 字串表示法（String Literals）

你可以在你的程式碼中包含一段預先定義的字串值作為字串字面量。
字串字面量是由雙引號 ("") 包著的具有固定順序的文字字元集。

字串字面量可以用於為常數和變數提供初始值。

```swift
let someString = "Some string literal value"
```

> 注意：
`someString`變數透過字串字面量進行初始化，Swift 因此推斷該變數為`String`型別。


<a name="initializing_an_empty_string"></a>
## 初始化空字串 (Initializing an Empty String)

為了建構一個很長的字串，可以創建一個空字串作為初始值。
可以將空的字串字面量指派給變數，也可以初始化一個新的`String`實體：

```swift
var emptyString = ""               // 空字串字面量
var anotherEmptyString = String()  // 初始化 String 實體
// 兩個字串均為空字串
```

你可以透過檢查其`Boolean`型別的`isEmpty`屬性來判斷該字串是否為空：

```swift
if emptyString.isEmpty {
    print("Nothing to see here")
}
// prints "Nothing to see here"
```

<a name="string_mutability"></a>
## 字串可變性 (String Mutability)

你可以透過將一個特定字串分配給一個變數來對其進行修改，或者分配給一個常數來保證其不會被修改：

```swift
var variableString = "Horse"
variableString += " and carriage"
// variableString 現在為 "Horse and carriage"
let constantString = "Highlander"
constantString += " and another Highlander"
// 這會回報一個編譯錯誤 (compile-time error) - 常數不可以被修改。
```

> 注意：
在 Objective-C 和 Cocoa 中，你透過選擇兩個不同的類別(`NSString`和`NSMutableString`)來指定該字串是否可以被修改，Swift 中的字串是否可以修改僅透過定義的是變數還是常數來決定。

<a name="strings_are_value_types"></a>

## 字串是實值型別（Strings Are Value Types）
Swift 的`String`型別是實值型別。
如果你創建了一個新的字串，那麼當其進行常數、變數指派操作或傳遞給函式/方法時，字串值是被`複製`一份過去的。

> 注意：
與 Cocoa 中的`NSString`不同，當你在 Cocoa 中創建了一個`NSString`實體，並將其傳遞給一個函式/方法，或者指派給一個變數，你傳遞或指派的是該`NSString`實體的參考，除非你特別要求，否則字串不會生成新的副本來進行指派操作。

Swift 預設字串複製的方式保證了在函式/方法中傳遞的是字串的值。
很明顯無論該值來自於哪裡，都是你獨自擁有的。
你傳遞的字串本身不會被更改，除非你主動更改它。

在實際編譯時，Swift 編譯器會最佳化字串的使用，使實際的複製只發生在絕對必要的情況下，這意味著你將字串作為實值型別的同時可以獲得極高的效能。

<a name="working_with_characters"></a>
## 使用字元（Working with Characters）

Swift 的`String`型別表示特定序列的`Character`（字元） 型別的值的集合。
每一個字元值代表一個 Unicode 字元。
你可利用`for-in`迴圈來遍歷字串中的每一個字元：

```swift
for character in "Dog!🐶" {
    println(character)
}
// D
// o
// g
// !
// 🐶
```

for-in 迴圈在 [For 迴圈](05_Control_Flow.html#for_loops) 中進行了詳細介紹。

另外，透過標明一個`Character`型別註解並透過字元字面量進行指派，可以建立一個獨立的字元常數或變數：

```swift
let yenSign: Character = "$"
```

字串可以透過傳遞一個元素型別為`Character`的陣列作為建構子參數：

```swift
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// 印出："Cat!🐱"
```

<a name="concatenating_strings_and_characters"></a>
## 連接字串和字元 (Concatenating Strings and Characters)

字串和字元的值可以透過加法運算子（`+`）相加在一起並創建一個新的字串：

```swift
let string1 = "hello"
let string2 = " there"
let welcon = string1 + string2
// welcome 現在是 "hello there"
```

你也可以透過加法指派運算子 (`+=`) 將一個字串或者字元添加到一個已經存在字串變數上：

```swift
var instruction = "look over"
instruction += string2
// instruction 現在等於 "look over there"
```

你可以使用`append()`方法將一個字元加到一個字串的尾端：

```swift
let exclamationMark: Character = "!"
welcome.append(exclamationMark)
// welcome 現在等於 "hello there!"
```

> 注意：
你不能將一個字串或者字元添加到一個已經存在的字元變數上，因為字元變數只能包含一個字元。

<a name="string_interpolation"></a>
## 字串插值 (String Interpolation)

字串插值是一種構建新字串的方式，可以在其中包含常數、變數、字面量和表達式。
你插入的字串字面量的每一項都被包裹在以反斜線為前綴的圓括號中：

```swift
let multiplier = 3
let message = "\(multiplier) 乘以 2.5 是 \(Double(multiplier) * 2.5)"
// message 是 "3 乘以 2.5 是 7.5"
```

在上面的範例中，`multiplier`作為`\(multiplier)`被插入到一個字串字面量中。
當創建字串執行插值計算時此占位符（placeholder）會被替換為`multiplier`實際的值。

`multiplier`的值也作為字串中後面表達式的一部分。
該表達式計算`Double(multiplier) * 2.5`的值並將結果 (7.5) 插入到字串中。
在這個範例中，表達式寫為`\(Double(multiplier) * 2.5)`並包含在字串字面量中。

> 注意：
插值字串中寫在括號中的表達式不能包含非跳脫雙引號 (`"`) 和反斜線 (`\`)，並且不能包含回車 (`\r`)或換行 (`\n`) 符號。

<a name="unicode"></a>
## Unicode

Unicode 是一個國際標準，用於文字的編碼和表示。
它使你可以用標準格式表示來自任意語言幾乎所有的字元，並能夠對文字文件或網頁這樣的外部資源中的字元進行讀寫。

Swift 的字串和字元型別是完全相容 Unicode 標準的，它支援如下所述的一系列不同的 Unicode 編碼。

<a name="unicode_scalars"></a>

### 字串字面量與特殊字元

字串字面量可以包含以下特殊字元：

* 跳脫字元`\0`(空字元)、`\\`(反斜線)、`\t`(水平 tab)、`\n`(換行)、`\r`(回車)、`\"`(雙引號)、`\'`(單引號)。
* 單位元組 Unicode 純量，寫成`\xnn`，其中`nn`為兩位十六進制數。
* 雙位元組 Unicode 純量，寫成`\unnnn`，其中`nnnn`為四位十六進制數。
* 四位元組 Unicode 純量，寫成`\Unnnnnnnn`，其中`nnnnnnnn`為八位十六進制數。

下面的程式碼為各種特殊字元的使用範例。
`wiseWords`常數包含了兩個跳脫字元 (雙括號)；
`dollarSign`、`blackHeart`和`sparklingHeart`常數展示了三種不同格式的 Unicode 純量：

```swift
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein
// "\"Imagination is more important than knowledge\" - Einstein
let dollarSign = "\x24"             // $,  Unicode 純量 U+0024
let blackHeart = "\u2665"           // ♥,  Unicode 純量 U+2665
let sparklingHeart = "\U0001F496"  // 💖, Unicode 純量 U+1F496
```

<a name="extended_grapheme_clusters"></a>
### 擴展字形群集 (Extended Grapheme Clusters)

每一個 Swift 的`Character`代表一個擴展字形群。一個擴展字形群是一個或多個可生成人類可讀的字元 Unicode scalar 的序列。舉例來說，字母 `é` 可以用單一的 Unicode scalar `é` (`LATIN SMALL LETTER E WITH ACUTE`, 或者`U+00E9`)來表示。然而一個標準字母`e` (`LATIN SMALL LETTER E`或者`U+0065`) 加上急促重音 (`COMBINING ACTUE ACCENT`) 的 scalar (`U+0301`) 也表示同樣的字母 `é`，這個急促重音的 scalar 將 `e` 轉換成了 `é`。

在這兩種情況下，字母 `é` 代表一個單一的 Swift `Character`，同時代表一個擴展字形群。在第一種情況，這個字形群包含一個單一 scalar；在第二種情況，它是包含兩個 scalar 的字形群。

```swift
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e 後面加上  ́
// eAcute 是 é, combinedEAcute 是 é
```

擴展字形群是一個靈活的方法，放許多複雜的腳本字元表示一個單一個`Character`。例如韓文字可以表示成韓文字母的有序排列，在 Swift 中都會表示為同一個`Character`：

```swift
let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed 是 한, decomposed 是 한
```

擴展字形群可以使用包圍記號（例如`COMBINING ENCLOSING CIRCLE`或者`U+20DD`）來包圍其他 Unicode scalar 作為一個 `Character`：

```swift
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute 是 é⃝
```

局部的指示符號 scalar 可以組合成單一的`Character`，例如`REGIONAL INDICATOR SYMBOL LETTER U` (`U+1F1FA`) 和`REGIONAL INDICATOR SYMBOL LETTER S` (`U+1F1F8`)：

```swift
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS 是 🇺🇸
```

<a name="counting_characters"></a>
## 計算字元數量 (Counting Characters)

想要獲得一個字串中`Character`字元數量，可以使用字串中`characters`屬性的`count`屬性：

```swift
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// prints "unusualMenagerie has 40 characters"
```

注意到在 Swift 中，使用擴展字形群作為`Character`來連接或改變字串時，不一定會改變字串的字元數量。

例如，如果用四個字元的單字`cafe`初始化一個字串，然後加上一個`COMBINING ACTUE ACCENT` (`U+0301`) 作為字串結尾，這個字串的字元數量仍然是`4`，因為第四個字元是`é`而不是`e`：

```swift
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// 印出 "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// 印出 "the number of characters in café is 4"
```

> 注意：
> 擴展字形群可以組成一個或多個 Unicode scalar，意味著不同的 Unicode 字元以及相同 Unicode 字元的不同表示方式可能需要不同數量的記憶體空間來儲存。所以 Swift 中的字元在一個字串中並不一定占用相同的記憶體空間。因此在還沒有獲得字串的擴展字形群的範圍的時候，不能夠計算出字串的字元數量。如果你正在處理一個長字串，需要注意`caracters`屬性必須遍歷字串中的 Unicode scalar 以精準計算字串的長度。

> 另外需要注意的是透過`characters`屬性回傳回傳的字元數量並不總是與包含相同字元的`NSString`的`length`屬性相同。`NSString`的`length`屬性是基於利用 UTF-16 表示的十六位代碼單元數字，而不是基於 Unicode 擴展字形群。為了解決這個問題，`NSString`的`length`屬性在被 Swift 的`String`存取時會成為`utf16count`。


