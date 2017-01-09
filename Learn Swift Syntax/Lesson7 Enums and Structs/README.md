# Enums and Structs

 *Enumerations* define a set of related values.       
 _Struct_ is a convenient way to bundle properties together.

In Swift, _enumerations_ and _structs_ are more powerful than in other languages, because the can have their own methods and are able to conform to protocols. In other words, in Swift, it's easy to give an _enum_ or a _struct_ its own suite of functionalities.


## Enumerations

 열거형은 주로 변수가 한정되어 있는 경우 사용한다.   

```swift
enum PrimaryColor {
    case red
    case blue
    case yellow
}

enum Aunties {
    case aime, billie, diane, gail, janie, pam
}

enum AmericanLeagueWest: String {
    case athletics = "Oakland"
    case astros = "Houston"
    case angels = "Los Angeles"
    case mariners = "Seattle"
    case rangers = "Arlington"
}

var message = "I hope the A's stay in \(AmericanLeagueWest.athletics.rawValue)"
```

In Swift, enum members can take on a value of any **primitive type**  
그리고 *built-in property* 인 `rawValue`를 이용해서 사용할 수 있다.

Enum 과 switch statement 는 찰떡궁합.


### Enumerations - Associated Values

> You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if needed.


![barcode1](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Art/barcode_UPC_2x.png) ![barcode2](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Art/barcode_QR_2x.png)

스위프트에서 두개의 바코드 방식을 나타내는 enumeration 은 아래와 같이 표현할 수 있다. 
```swift
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
```

> Define an enumeration type called Barcode, which can take either a value of upc with an associated value of type (Int, Int, Int, Int), or a value of qrCode with an associated value of type String.     

이 정의는 실제 값이 아닌 `Barcode`가 가질 수 있는 type을 뜻한다.   
New barcodes can then be created using either type :

```swift
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
```

or

```swift
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")
```

> At this point, the original Barcode.upc and its integer values are replaced by the new Barcode.qrCode and its string value. Constants and variables of type Barcode can store either a .upc or a .qrCode (together with their associated values), but they can only store one of them at any given time.


Extraction example

```swift
switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
}
```

```swift
switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
    case let .qrCode(productCode):
        print("QR code: \(productCode).")
}
```



## Enumerations - Implicitly Assigned Raw Values

```swift
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
```
 눈치껏, 나머지 case들도 Int형 rawValue가 붙는다.

아래의 경우는 String형 rawValue가 case이름으로 붙는다! 똑똑하다!😛
```swift
enum CompassPoint: String {
    case north, south, east, west
}
```

## Enumerations - Initializing from a Raw Value
 [failable initializers](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID224) 와 함께 살펴보자


## Enumerations - Recursive Enumerations

enum 안에 enum ~~이놈 안에 이놈~~

> A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.

```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

///////////////////////////

indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
```


수식 표현하기!

```swift
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))


func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
// Prints "18"

```


## Struct with Properties and Methods

 스위프트에서 Struct는 다른 언어에서보다 훨씬 강력한데, 그들의 capability는 클래스에 버금간다고 한다!  
*property* 뿐 아니라 *method*도 가질 수 있고 **extention** 과 **protocol**을 통해 기능적으로 확장이 가능하다.......허헣 

```swift
struct Beer {
    var style = "Pale Ale"
    var percentAlcohol = 5.0
    static var cheersDict = ["English": "Cheers!","German": "Prost!", "Japanese": "乾杯", "Mandarin": "干杯!","Russian":"На здоровье!", "Spanish":"Salud!", "Italian": "Cin cin!"]
    var suggestedVolumePerServing:String {
        get {
        let volume: Int = Int(12.0/(percentAlcohol/5.0))
        return "\(volume) ounces"
        }
    }

    static func cheers(_ language: String) {
        if let cheers = cheersDict[language] {
            print("\(cheers)")
        }
    }
}

var happyHourBeer = Beer(style:"Lager", percentAlcohol: 6.0)
happyHourBeer.suggestedVolumePerServing
Beer.cheers("Japanese")
```

위와 같이 Struct에서도 Class에서 처럼 Type Method, Computed Property 까지도 가질 수 있다!   



## Struct and Enums are Value Types

 Struct와 Enum은  **Value Type**이다. 이와 대조적으로 Class는 **Reference Type**이다. Struct와 Class, 비슷해 보일 수 있지만 **근본적인 차이**가 있는 것이다.

아래 예제를 살펴보면 이해할 수 있을거야😛

``` swift

struct PictureFrame {
    var width = 5
    var height = 7
    var thickness: Double = 1.5

    var area: Int {
        get {
            return (width * height)/2
        }
    }
}

var frame = PictureFrame(width: 3, height: 5, thickness: 0.5)
var frameForMom = frame         // This line is killing point
frameForMom.width = 5
frameForMom.height = 7

/*
frame 과 frameForMom 은 다른 공간!
*/

class ClassyPictureFrame {
    var width = 5
    var height = 7
    var thickness: Double = 1.5

    var area: Int {
        get {
            return (width * height)/2
        }
    }

    init(width: Int, height: Int, thickness: Double) {
        self.width = width
        self.height = height
        self.thickness = thickness
    }

}

var classyFrame = ClassyPictureFrame(width: 3, height: 5, thickness: 0.5)
var classyFrameForMom = classyFrame  // ****
classyFrameForMom.width = 5
classyFrameForMom.height = 7

/*
 classyFramge 과 classyFramgeForMom 은 같은 reference
*/

```

중요한 점 : **Class 에서만 상속이 가능하다!** 

















