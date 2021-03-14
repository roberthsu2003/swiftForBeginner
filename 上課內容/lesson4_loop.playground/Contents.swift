//明確知道執行次數
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names{
    print("Hello! \(name)!")
}

let numberOfLegs = ["spider": 8, "ant":6, "cat":4]

for (animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs")
}


for index in 1...5 {
    print("\(index) times 5 is \(index*5)")
}



let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}

print("\(base)的\(power)次方是\(answer)")

let minutes = 60
for tickMark in 0..<minutes{
    print(tickMark)
}

let minuteInterval = 5
for tickMark in stride(from: 0, to: minutes, by: minuteInterval){
    print(tickMark)
}

for tickMark in stride(from: 0, through: minutes, by: minuteInterval){
    print(tickMark)
}

var deposit = 0
let price = 61357
var month = 0

while deposit < price{
    month += 1
    deposit += Int.random(in: 3000...5000)
}

print("存款了\(month)個月，目前已經存\(deposit),可以購買機車了")

deposit = 0
month = 0
while true{
    month += 1
    deposit += Int.random(in: 3000...5000)
    if deposit >= price{
        break
    }
}
print("存款了\(month)個月，目前已經存\(deposit),可以購買機車了")

deposit = 0
month = 0
repeat{
    month += 1
    deposit += Int.random(in: 3000...5000)
}while deposit < price
print("repeat-while存款了\(month)個月，目前已經存\(deposit),可以購買機車了")

deposit = 0
month = 0
repeat{
    month += 1
    deposit += Int.random(in: 3000...5000)
    if deposit >= price{
        break
    }
}while true
print("repeat break存款了\(month)個月，目前已經存\(deposit),可以購買機車了")
