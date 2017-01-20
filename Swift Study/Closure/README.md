# Closure

- Overview
    - 클로저란?
    - 클로저와 함수의 관계
    - 클로저만의 기능
- Expression
    - 기본 클로저 문법
    - 기본예제
    - 기본 표현 & 함수 이용
    - 타입 유추 (Inferring Type From Context)
    - 단축 인자 이름 (Shorthand Argument Names)
    - 암시적 반환표현 (Implicit Returns from Single-Expression Closures
    - 연산자 함수 (Operator Methods)
    - 후행 클로저 (Trailling Closures)

- 값 획득 (Capture)
- 클로저는 참조타입
- 획득목록
    - 참조타입의 획득목록
    - 클래스 인스턴스의 프로퍼티 로서의 클로저
- 탈출 클로저 (Escape)
- Auto Closure



## Overview

 스위프트에서 함수형 프로그래밍 패러다임을 접할 때 첫 걸음으로 꼭 알아햐 할 녀석이 바로 **클로저(Closure)**이다.  

함수형 프로그래밍의 중요한 특징중 하나는 함수를 [**일급 객체 (First-class Citizen)**](./https://ko.wikipedia.org/wiki/일급_객체)로 다룬다는 점이다. 일급 객체의 조건은 다음과 같다.

- 전달인자로 전달할 수 있다.
- 동적 프로퍼티 할당이 가능하다.
- 변수나 데이터 구조 안에 담을 수 있습니다.
- 반환 값으로 사용할 수 있습니다.
- 할당할 때 사용된 이름과 관계없이 고유한 객체로 구별할 수 있습니다.

함수(동작)를 전달인자로 사용할 수도 있고, 변수에 할당하거나 반환할 수 있다. 내가 일반적으로 다루는 객체처럼 다루 수 있다..! 정도로 해석할 수 있겠당ㅇㅇ. 이 점을 짚고 클로저로 넘어가보자.


#### 클로저란?
- *Closures* are self-contained blocks of functionality that can be passed around and used in your code.
- 일정기능을 하는 코드를 하나의 블록으로 모아 놓은 것.
- 중괄호 `{ }` 로 감싸진 실행가능한 코드 블럭

#### 클로저와 함수의 관계
함수는 클로저의 한 형태!   
클로저도 `() -> Void` 꼴의 타입을 갖는다.
아래는 클로저의 3가지 모양인데 함수는 그 중 하나의 모습에 속한다.

- 이름을 가지면서 어떤 값도 획득하지 않는 전역함수의 형태
- 이름을 가지면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
- 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축양 문법으로 작성된 형태

#### 클로저만의 중요한 기능.   
*클로저*는 변수나 상수가 선언된 위치에서 **참조를 획득**하고 저장할 수 있다.  
클로저는 여기서 착안한 이름이란다.(잠금!)
![prisoner-jail](./prisoner-jail.jpg)


## Expression
매우...매우매우 다양한 표현방법이 있다! 축약형이 많기 때문인듯ㅇㅇ

#### 기본 클로저 문법

```swift
{
    (매개변수들) -> 반환타입 in
극   실행 코드
}
```

반환값이 있다면, return 구문도 들어있겠지. 클로저도 함수와 마찬가지로 *입출력 매개변수*를 사용할 수 있다(`inout`키워드랑 `&`기호 붙이는거). 그러나 *매개변수 기본값*을 줄 수는 없다. 그렇다. 

#### 기본 예제
아래 예제를 이용해서 표현법을 알아볼거임
```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: (String, String) -> Bool)

// Declare
public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
```

배열의 *sorted 메서드*를 이용해서 *클로저*의 표현방법을 알아볼거임. `names`는 `String`배열이고 여기서 *sorted 메서드*는 *클로저*를 전달받게되. 
바로 `String` 2개를 받아서 `Bool`을 반환하는 *클로저*를!  
그러면 *sorted 메서드*는 정렬된 `String` 배열을 반환하지.  

#### 기본 표현 & 함수 이용



```swift
// 한줄로 써도 상관 없다.
var reversedNames = names.sorted(by: { 
    (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// String형 2개를 받아서 Bool형을 반환하는 함수
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
```

#### 타입 유추 (Inferring Type From Context)
*sorted 메서드*는 `(String, String) -> Bool`을 원하므로  
컴파일러는 이미 모든것을 알고있다...`String`이 들어오고 `Bool`형이 나갈것임을!

```swift
reversedNames = names.sorted(by: { (s1, s2) in return s1 > s2 } )
```

#### 단축 인자 이름 (Shorthand Argument Names)
데이터 타입이 없어지니 `s1`, `s2`같은 매개변수 이름도 필요가 없다. 그래서 한다 제공, 스위프트는 단축인자이름을!😝   
단축 인자이름은 첫 번째 전달인자부터 `$0`, `$1`, `$2`,... 순서이다.

```swift
// 이건 에러 
reversedNames = names.sorted(by: { () in return $0 > $1 } )

reversedNames = names.sorted(by: { return $0 > $1 } )
```

#### 암시적 반환표현 (Implicit Returns from Single-Expression Closures
 클로저 실행문이 **단 한줄**이면 암시적으로 그 실행문이 반환값으로 사용될 수 있다.
```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

#### 연산자 함수 (Operator Methods)

연산자도 함수의 일종이었는데 우리가 지금까지 *sorted(by: ) 메서드*에 전달한 클로저와 같은 타입이다.  
그래서!

```swift
reversedNames = names.sorted(by: > )

// Declare
public func ><T : Comparable>(lhs: T, rhs: T) -> Bool
```


#### 후행 클로저 (Trailling Closures)
마지막 전달인자로 위치하는 함수의 소괄호`( )`를 닫고 클로저를 작성해도 된다. 게다가 **단 하나**의 클로저만 전달인자로 사용하는 경우에는 **소괄호도 생략할 수 있다.** WoW

```swift
reversedNames = names.sorted{ $0 > $1 }
```


## 값 획득 (Capture)
 클로저에서 가장 눈에 띄는 기능이다.  

클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 **획득(Capture)**할 수 있다. 정의할때 주변에 존재하였던 변수나 상수가 더 이상 존재하지 않더라도 클로저는 그 상수나 변수의 값을 자신 내부에서 참조하거나 수정할 수 있다.  
마치 클로저가 자신의 프로퍼티로 저장해 간 것 같다. (눈에 보이지는 않지만)

> 클로저는 비동기 작업에 많이 사용된다. 클로저를 통해 비동기 콜백의 형태를 작성하는 경우, 현재 상태를 미리 획득해두지 않으면, 실질적으로 클로저의 기능을 수행하는 순간에는 주변의 상수나 변수가 이미 메모리에 존재하지 않는 경우가 발생한다.

중첩함수도 클로저의 형태이므로 자신을 포함하고 있는 지역변수나 지역상수를 획득할 수 있다. 먼저 중첩함수에서 값 획득을 느껴보자.

```swift
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var Total = 0

    func incrementer() -> Int {

        Total += amount
        return Total
    }

    return incrementer 
    
}
```

`incrementer()`함수를 주목하자. 이 녀석은 주변에 있는 `runnningTotal`과 `amount`라는 두 값을 획득한다.

이제 `incrementer()`함수를 가지고 놀아보자

```swift
// Total에 amount를 더해서 Total을 return

let incrementerByTwo: (()-> Int) = makeIncrementer(forIncrement: 2)

incrementerByTwo()  // 2
incrementerByTwo()  // 4
incrementerByTwo()  // 6

let incrementerByTen = makeIncrementer(forIncrement: 10)

incrementerByTen()  // 10
incrementerByTen()  // 20
incrementerByTen()  // 30
```

`incrementer()`함수가 정의된 곳을 벗어났어도  
클로저가 할당된 변수나 상수가 Total 값과 amount값을 기억하고 있다.  

(하지만 이 부분이 명시적으로 표현되지 않아서 아쉽다. 무슨값을 획득하고 있는지..등등)


## 클로저는 참조타입

그러하다. **제곧내**  
다른 상수나 변수에 클로저를 대입하면 같은 참조를 할당하게 된다. 위의 예제를 계속 해서 사용해보자.

```swift
let c1: (() -> Int) = makeIncrementer(forIncrement: 5)

let c2 = c1  // c2 = c1() 이렇게 쓰면 안됨

c1()    // 5
c2()    // 10
```
같은 Total에 amout를 더하고 있다.

이번엔 클래스에 클로저가 정의되어 있는 경우를 알아보자.

## 획득목록
먼저 클로저의 *획득목록*을 알아야한다.  
획득목록은 클로저 내부에서 참조타입을 획득하는 규칙을 제시해 줄 수 있는 기능.

```swift
var a = 0
var b = 0

let closure : (() -> ()) = { [a] in
    // let a = a
    b = 20
    print(a, b)
}
a = 10
b = 10

closure()   // 0 20
```
획득목록은 `[ ]`대괄호 안에 적어주고 그 다음 in 키워드를 적어준다. 저렇게 적어주면 let a = a라고 선언한 것처럼 바깥환경과 별개로 `a`변수를 이용할 수 있다.

#### 참조타입의 획득목록

이번에는 획득목록에 참조 타입을 넣어보자. 약간 다르다.
```swift
class SimpleClass{
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()

let closure = { [x] in
    print(x.value, y.value)
}
x.value = 10
y.value = 10

closure()   // 10 10
```
획득목록의 동작은 같지만 `x`는 참조타입이므로 x.value가 바뀐 것에 영향을 받는다.

#### 클래스 인스턴스의 프로퍼티로서의 클로저

```swift
class SomeClass {
    var name: String = "old"

    lazy var someClosure: () -> String = {
        () in
    self.name = "new"

        return self.name
    }

    deinit {
        print("deinit!")
    }

}

var a : SomeClass? = SomeClass()
a?.someClosure()     // Optional("new")
a = nil
```

봐야할 것이 3개 있다.  
첫 번째는 `lazy var` 키워드. 클래스 안의 프로퍼티나 메서드를 이용하려면 `lazy var`키워드를 이용해야한다. 만약 `let`키워드를 사용하면 타입 안의 다른 프로퍼티를 이용하지 못한다. 클로저가 생성되는 시점이 일반 함수나 프로퍼티와는 다른것 같다.
두 번째는 `self`키워드를 사용하지 않으면 타입 내부자원에 접근할 수 없다는 점.
세 번째는 마지막에 인스턴스를 해제했는데도 메모리가 해제 되지 않았다는 점.  
   
세번째가 바로 *강한 참조 순환*문제 때문이다. 책의 457쪽(ARC)를 참고하자.

이러한 문제를 해결하기 위해 클로저를 선언할 떄  
`[weak self]` 또는 `[unowned self]` 획득목록을 사용한다.

```swift
lazy var someClosure: () -> String = {
    [weak self] in
    self?.name = "new"
    return self!.name
}
```
`[weak self]`는 상수를 옵셔널 타입으로 받는다는 뜻이다. 따라서 그 상수(여기선 self)가 메모리에서 해제될 경우 nil을 반환한다.  
`[unowned self]`는 상수(여기선 self)가 메모리에서 해제되면 런타임에러!! 

## 탈출 클로저 (Escape)

**함수의 전달인자로 전달된 클로저가 함수 종료 후에 호출될 때** 클로저가 함수를 **탈출(escaping)**한다고 표현한다. 클로저가 함수를 탈출할수 있는 경우중 하나는 함수 외부에 정의된 변수나 상수에 저장되어 함수가 종료된 후에 사용, 저장될 경우이다.

매개변수 이름의 (:) 뒤에 `@escaping` 키워드를 붙여준다. (기본적으론 `@nonescaping`이 붙어있는 비탈출 클로저)

> 예를 들어 비동기 작업을 수행하는 함수들이 클로저를 컴플리션 핸들러(Completion handler)전달인자로 받아온다. 비동기 잡업으로 함수가 종료되고 난 후 작업이 끝나고 호출될 필요가 있는 클로저를 사용해야 할 때 탈출 클로저가 필요하다.

아참 그리고 탈출클로저는 내부에서 타입 자원에 접근할 때 `self`키워들 꼭 명시적으로 사용해야한다.

예)
```swift
var Handlers: [() -> Void] = []

func someFunction(Handler: @escaping ()-> Void) {
    Handlers.append(Handler)
}
// @escaping 이 없으면 컴파일 에러!
```


## Auto Closure

함수의 전달인자로 전달되는 표현을 자동으로 변환해주는 클로저.  
자동 클로저는 전달인자를 갖지 않는다.  
자동클로저는 호출되었을 때 자신이 감싸고 있는 코드의 결과값을 반환.  
문법접 편의 제공  

 흠... 좀 난해하다....왜 있는지 아직 잘 모르겠음ㅜㅠ 멘붕임. 다행인건 별로 쓸일 없을거래ㅋ,ㅋ


함수가 ** 전달인자가 없는 클로저** 를 전달인자로 받는다.  
그래서 아까부터 사용했던 `names.sroted(by:)` 예제를 쓸수 없다.

~~클로저를 통해 지연 연산을 해야한다..?~~
~~클로저의 기능인 값 획득은 쓸수 없을듯..?~~


```swift

var customerInLine: [String] = ["YongWha", "SangYong","SungHun", "Hami"]


func serveCustomer ( _ customerProvider:  () -> String ) {
    print("Now serving \(customerProvider())")
}
serveCustomer( { customerInLine.removeFirst() } ) // 하나 지워짐


////////////// 아래는 autoClosure 적용 /////// 

func autoClosureServeCustomer ( _ customerProvider: @autoclosure () -> String ) {
    print("Now serving \(customerProvider())")
}
autoClosureServeCustomer(  customerInLine.removeFirst()  ) // 하나 지워짐

```

책에 있는 내용
> 자동 클로저 속성을 부여한 매개변수는 클로저 대신에 customerInLine.removeFirst() 코드의 실행결과인 String 타입의 문자열을 전달인자로 받게 됩니다. String 타입의 값이 자동 클로저 매개변수에 전달되면 String 값을 매개변수가 없는 String값을 반환한는 클로저로 변환해 줍니다. String 타입의 값을 전달 받는 이유는 자동 클로저의 반환 타입이 String이기 때문입니다. 자동클로저는 전달인자를 갖지 않기 때문에 반환 타입의 값이 자동 클로저의 매개변수로 전달되면 이를 클로저로 바꿔줄수 있는 것입니다.

**자동클로저를 사용하면 기존의 사용 방법처럼 클로저를 전달인자로 넘겨주는 것은 불가능 합니다.**  
여기서 더더욱 혼란임ㅋㅋㅋㅋ 함수값 전달하듯이 쓰라는 말인데..

~~클로저를 전달하도록 구현된 함수에 함수결과값을 바로 넘겨주도록 변화해주는 기능?~~ 

다시한번 살펴보자.
```swift

var customerInLine: [String] = ["YongWha", "SangYong","SungHun", "Hami"]
 
func autoClosureServeCustomer ( _ customerProvider: @autoclosure () -> String ) {
    print("Now serving \(customerProvider())")
}

autoClosureServeCustomer(  customerInLine.removeFirst()  ) // 하나 지워짐

// 이런 모양의 클로저로 전달되어서 autoClosureServeCustomer 함수로 가는듯 하다. 
let _ : () -> String = {
    return customerInLine.removeFirst()
}
```

## Closure의 활용

클로저는 sort(), filter(), map(), reduce() 등의 메서드와 함께 많이 쓰인다.
 












