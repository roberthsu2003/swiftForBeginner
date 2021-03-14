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
