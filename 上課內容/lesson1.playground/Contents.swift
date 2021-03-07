var str = "Hello! swift"
print(str)

//建立一個常數
let maximumNumberOfLoginAttempts = 10

//建立一個變數
var currentLoginAttempt = 0

print(maximumNumberOfLoginAttempts)
print(currentLoginAttempt)

//一次定義多個變數
var x = 0.0, y = 0.0, z = 0.0

//一次定義多個常數
let x1 = 0.0, y1 = 0.0, z1 = 0.0

//明確宣告資料型別
var welcomeMessage:String
//給值
welcomeMessage = "Hello"
print(welcomeMessage)

//明確告知資料型別的宣告
var languageName:String = "Swift"

//不明確告知資料型別的宣告
var languageName1 = "Swift"
languageName1 = "Swfit++"
print(languageName1)

var languageName2 = "java"

//字串插補
let name = "robert"
let age = 35
let weight = 76.5
print("我的姓名\(name),幾歲:\(age),體重:\(weight)")

//建立Tuple
let httpMessage = (404, "Not Found")

//拆解tuple,取出裏面的值
let (statusCode, statusMessage) = httpMessage
print("狀態碼:\(statusCode)")
print("狀態訊息:\(statusMessage)")

//使用index方法
print("狀態碼:\(httpMessage.0)")
print("狀態訊息:\(httpMessage.1)")

//建立有key的tuple
let http200Status = (statusCode:200,description:"ok")

//透過key取出值
print("狀態碼:\(http200Status.statusCode)")
print("狀態訊息:\(http200Status.description)")
