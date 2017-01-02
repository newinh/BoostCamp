# Swift Basic!

- Types
- Operators
- Strings
- Constants & Variables (let vs var)
- Exercise


## Types & Operator

#### 변수 선언 방법
```swift
var x : Int = 43
```

변수타입을 나중에 적는다!

;(세미콜론) 이 필요없다!

```swift
var x = 12
var y = "Hi"
var z = 3.141592
```

심지어 변수타입을 입력할 필요도 없다! Compiler가 변수타입을 추론하여 x, y, z 는 각각 Int, String, Double형이 된다.(실수 기본형은 Double)

Character형도 ""로 표시

### if문
```swift
var flag = true

if flag {
    print("flag is true.")
}
```

### ternary condition operator

```swift
question? A1 : A2
```


-----

## String

### Emoji
 `ctrl` + `cmd` + `space bar`로 emoji 입력가능ㅋ,ㅋ😗


### String Interpolation
```swift
var dogName = "Ferris"
doggyDiet = "\(dogName) eats 25lbs of dog food per month"
```

> 출력결과 : Ferris eats 25lbs of dog food per month

```swift
    \(변수명)
```


### for-in 문 & Sting.characters
```swift
var password = "Meet me in St. Louis"
for character in password.characters {

    if character == "e" {
        print("found an e!")
    } else {
    }
}
```


### A String can be treated as an NSString
```swift
let newPassword = password.replacingOccurrences(of: "e", with: "3")
```

NSSring library를 쓸수있다.


## Constants and Variables

 두가지 변수 선언 방법이 있다.

```swift
let birthYear = 2008
var currentYear = 2015
```

let 은 상수형으로 한번 선언하면 바꿀수 없다. 

 > let vs var 을 잘 구별하자





