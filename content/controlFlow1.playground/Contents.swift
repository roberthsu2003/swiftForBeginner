let somePoint = (3, 1)
switch somePoint {
    case (0, 0):
        print("x=0,y=0")
    case (_, 0):
        print("y為0")
    case (0, _):
        print("x為0")
    case (-2...2, -2...2):
        print("在範圍內")
    default:
        print("超出範圍")
    
}

let anotherPoint = (0,2)
switch anotherPoint {
    case (let x, 0):
        print("在x軸上,x=\(x)")
    case (0, let y):
        print("在y軸上,y=\(y)")
    case let(x, y):
        print("x=\(x),y=\(y)")
}

//switch where
//第一次match
