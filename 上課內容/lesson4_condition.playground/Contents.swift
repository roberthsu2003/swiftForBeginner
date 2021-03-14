//單向
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32{
    print("現在很冷")
}

//雙向
temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32{
    print("現在很冷")
}else{
    print("不是很冷")
}

//多向選擇
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32{
    print("現在很冷")
}else if temperatureInFahrenheit >= 86{
    print("現在很熱")
}else{
    print("有點冷")
}

let anotherCharacter:Character = "A"
switch anotherCharacter {
case "a","A":
    print("是a或A")
case "b","B":
    print("是b或B")
default:
    print("不是a,A也不是b,B")
}

//利用範圍運算子比對一段數值範圍
let approximateCount = 120
switch approximateCount {
case 0:
    print("0")
case 1..<5:
    print("1~4")
case 5..<12:
    print("5~11")
case 12..<100:
    print("12~99")
case 100..<1000:
    print("100~999")
default:
    print("1000以上")
}

//利用tupe和範圍運算同時比對2個值
//座標比對

let somePoint = (0, 0)
switch somePoint{
case (0,0):
    print("在中心點")
case (_,0):
    print("在x軸上")
case (0,_):
    print("在y軸上")
case (-2...2, -2...2):
    print("在範圍內")
default:
    print("在其他區域")
}

//value binding

let anotherPoint = (2, 2)
switch anotherPoint{
case(0,0):
    print("在中心點")
case(let x,0):
    print("在x軸上,x座標是\(x)")
case(0, let y):
    print("在y軸上,y座標是\(y)")
case(let x, let y):
    print("x,y在範圍內,x是\(x),y是\(y)")
}


