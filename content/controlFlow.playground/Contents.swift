
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names{
    print("您好:\(name)")
}

let numberOfLegs = ["spider":8, "ant":6, "cat":4]
for(animalName, legCount) in numberOfLegs{
    print("\(animalName)有\(legCount)腳")
}

for index in 1...5{
    print(index);
}

let base = 3
let power = 10
var answer = 1;
for _ in 1...power{
    answer *= base;
}
print(answer)

let minutes = 60
let minuteInterval = 5
for tickMark in stride(from: 0, through: minutes, by: minuteInterval){
    print(tickMark)
}

let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

var index = 0
var total = 0
repeat{
    total += nums[index]
    index += 1;
}while(total <= 51)

print("值是多少:\(nums[index-1])跳出迴圈")


var number = 0
while(number != 8){
    number = Int.random(in: 1...10)
    print("不是8,是\(number)")
}

var temperatureInFahrenheit = 40

if temperatureInFahrenheit <= 32{
    print("非常冷")
}else{
    print("沒有非常冷")
}

temperatureInFahrenheit = 90

if temperatureInFahrenheit <= 32{
    print("非常冷")
}else if temperatureInFahrenheit >= 86{
    print("非常熱")
}else{
    print("天氣不錯")
}

let someCharacter:Character = "d"
switch someCharacter {
case "a":
    print("是a")
case "b","d","e","f":
    print("是b,d,e,f其中一個")

default:
    print("是f以後的字元")
}



