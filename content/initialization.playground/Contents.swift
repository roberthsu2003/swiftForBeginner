struct Fahrenheit{
    var temperature:Double
    //自訂的初始化
    init(){
        temperature = 32
    }
}

var f = Fahrenheit()

//標準寫法
//因為temperature一開始就有固定值
//所以使用default value的寫法
struct Fahrenheit1{
    var temperature = 32.0
}

var f1 = Fahrenheit1()
print(f1.temperature)

struct Celsius{
    var temperatureInCelsius:Double
    init(fromFahrenheit fahrenheit:Double){
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin:Double){
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius:Double){
        temperatureInCelsius = celsius
    }
}

var c = Celsius(fromFahrenheit: 60)
print(c.temperatureInCelsius)
var c1 = Celsius(fromKelvin: 300)
print(c1.temperatureInCelsius)

var c2 = Celsius(27)
print(c2.temperatureInCelsius)

class SurveyQuestion{
    var text:String
    //optional type default value is nil
    var response:String?
    init(text:String){
        self.text = text;
    }
    
    func ask(){
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask();





