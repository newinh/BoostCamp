# Optional

다른언어에는 없는 **optional** 이라는 data type을 가지고있다.


## Overview

optional이란 `nil`값을 가질 **수**도 있는 변수를 말한다. 즉 optional이 선언된 변수는 `nil`일수도 있고 value를 가지고 있을수도 있는 녀석~*(간잽이)*~이다.

#### Why Optional?
swift에서는 기본 타입에  `nil` 값을 넣을 수 없기 때문!  
음..아무래도 Swift가 지향하는 *type-safety language*와 연관된 것 같다.  

뭐 어쨌든  nil 값을 참조한다는 등의 에러따위는 컴파일과정에서 걸러진다.

```swift
var x: Int
// x = nil  -> Compile complains!


var c: AnyObject
// c = nil -> Compile complains!

```


## Using Optionals

두가지 방법이 존재한다.   
 - `?` (Question mark)
 - `!` (Exclamation mark)   
`!`를 이용하는 경우 이 강의에서는 *implicitly unwrapping* 이라고 표현했고 다른 곳에서는 *forced unwrapping*이라고 표현했다.  

```swift
var zee: Int?
let a: String = "123"

zee = Int(a)

```
변수이름뒤에 `?`를 넣어 주었다!  
Int(String)은 optional int 형을 반환하기 때문에 `?`가 붙지 않았다면 Compile Error를 일으켰을것이다.


-------
여기서 한가지 문제가 있다.  
optional 타입의 변수 그 변수를 unwrap하기 전에는 변수를 사용할수 없다.*optional data type*안에는 무엇이 들어 있을지 모르기때문.
![unwrap] (https://github.com/newinh/Udacity/blob/master/Learn%20Swift%20Syntax/Lesson2/optional_unwrapping.png)


## Unwrapping Optionals with if let

optional 타입을 벗겨내는 안전한 방법. (if var도 가능하다고 한다.)

```swift
var zee: Int?

let strings = ["ABC","123"]
let randomIndex = Int(arc4random() % 2)
let anotherString = strings[randomIndex]

zee = Int(anotherString)

if let intValue = zee {
    intValue * 2
} else {
    "No value"
}
```


아래는 `if let`의 style guide
#### Preferred
```swift
var subview: UIView?
var volume: Double?

// later on...
if let subview = subview, let volume = volume {
    // do something with unwrapped subview and volume
}
```
#### Not Preferred
```swift
var optionalSubview: UIView?
var volume: Double?

if let unwrappedSubview = optionalSubview {
if let realVolume = volume {
    // do something with unwrappedSubview and realVolume
}
}
```

## Implicitly Unwrapped Optionals
 `!` 를 사용했을 경우에는 좀 더 편하게 변수를 사용할 수 있다.  
__그러나 optioanl 변수가 `nil`값을 가지고 있을 경우 error를 일으킨다!__

```swift
let w =  Int("123")!
w * 2

//////////////////////////////
class BetterViewController: UIViewController {
var myButton: UIButton!
}
```


## Optional Chaining

 말로 설명을 잘 못하겠다...예제를 통해 확인하자
```swift
// Example 1
var anotherImageView = UIImageView()
anotherImageView.image = UIImage(named:"puppy_in_box")

var size = anotherImageView.image?.size

if let imageSize = anotherImageView.image?.size {
print("Here's the image size: \(imageSize)")
} else {
print("This image hasn't been set.")
}


// Example 2

var animal = Animal(name: "Lenny", species: "lemur", tailLength: 12)

animal = Animal(name: "Gilbert", species: "Gorilla", tailLength: nil )

if let tailLength = animal.tail?.length {
print("\(animal.name)'s tail is \(tailLength) long")
} else {
print("\(animal.name) doesn't have a tail.")
}```

`?`를 주목하자!


## Downcasting with as? and as!






