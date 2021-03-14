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

//value binding and where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let(x,y) where x == y:
    print("x,y是相同值")
case let(x,y) where x == -y:
    print("x == -y")
case let (x,y):
    print("x=\(x), y=\(y)")

}
var x=0
func someFunction(){
    guard x>0 else {
        print("x不等於0")
        return
    }
    print("x>0,繼續執行")
}
someFunction()



//guard  else,配合optional binding
var optionValue:Int? = 3

func someFunction1(){
    guard let value = optionValue else{
        print("optionalValue是nil")
        return
    }
    print("value是\(value)")
    
}

someFunction1()


func someFunction3(){
    var x1:Int? = 3
    var x2:Int? = 4
    var x3:Int? = 5
    if let x1 = x1{
        if let x2 = x2{
            if let x3 = x3{
                print("x1,x2,x3都不是nil,x1=\(x1), x2=\(x2),x3=\(x3)")
                
            }else{
                print("有1個nil")
                return
            }
        }else{
            print("有1個nil")
            return
        }
    }else{
        print("有一個nil")
        return
    }
}
someFunction3()

func someFunction4(){
    var x1:Int? = 3
    var x2:Int? = 4
    var x3:Int? = 5
    guard let y1 = x1 else{
        print("有一個是nil")
        return
    }
    
    guard let y2 = x2 else{
        print("有一個是nil")
        return
    }
    
    guard let y3 = x3 else{
        print("有一個是nil")
        return
    }
    
    print("x1,x2,x3都不是nil,x1=\(y1), x2=\(y2),x3=\(y3)")
    
    
}
someFunction4()

func someFunction5(){
    var x1:Int? = 3
    var x2:Int? = 4
    var x3:Int? = 5
    if let x1 = x1, let x2 = x2, let x3 = x3{
        print("x1,x2,x3都不是nil,x1=\(x1), x2=\(x2),x3=\(x3)")
    }else{
        print("有一個是nil")
        return
    }
       
}
someFunction5()


func someFunction6(){
    var x1:Int? = 3
    var x2:Int? = 4
    var x3:Int? = 5
    guard let y1 = x1, let y2 = x2, let y3 = x3 else{
        print("有一個是nil")
        return
    }
    
    print("x1,x2,x3都不是nil,x1=\(y1), x2=\(y2),x3=\(y3)")
    
    
}
someFunction6()

if #available(iOS 10,macOS 10.12, *){
    print("執行ios10以上的程式")
}else{
    print("執行ios10以下的程式(比較舊的)")
}
