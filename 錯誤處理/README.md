# 錯誤處理
## 表示和拋出錯誤

```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

```swift
throw VendingMachineError.insufficientFunds(coinsNeeded: 5)
```

## 處理錯誤

```swift
do{
	try...
}catch{
	
}
```

## 使用拋出函數傳遞錯誤

```swift
func canThrowErrors() throws -> String

func cannotThrowErrors() -> String
```