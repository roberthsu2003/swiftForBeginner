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
