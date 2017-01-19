# Closure

- Overview
    - 클로저란?
    - 클로저와 함수의 관계
    - 클로저만의 기능
- Expression
- Auto Closure
- Capture
- Escape



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
    실행 코드
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

#### 타입 유추
*sorted 메서드*는 `(String, String) -> Bool`을 원하므로  
컴파일러는 이미 모든것을 알고있다...`String`이 들어오고 `Bool`형이 나갈것임을!

```swift
reversedNames = names.sorted(by: { (s1, s2) in return s1 > s2 } )
```

#### 단축 인자 이름
데이터 타입이 없어지니 `s1`, `s2`같은 매개변수 이름도 필요가 없다. 그래서 한다 제공, 스위프트는 단축인자이름을!😝   
단축 인자이름은 첫 번째 전달인자부터 `$0`, `$1`, `$2`,... 순서이다.

```swift
// 이건 에러 
reversedNames = names.sorted(by: { () in return $0 > $1 } )

reversedNames = names.sorted(by: { return $0 > $1 } )
```

#### 암시적 반환표현
 클로저 실행문이 **단 한줄**이면 암시적으로 그 실행문이 반환값으로 사용될 수 있다.
```swift
reversedNames = names.sorted(by: { $0 > $1 } )
```

#### 연산자 함수

연산자도 함수의 일종이었는데 우리가 지금까지 *sorted(by: ) 메서드*에 전달한 클로저와 같은 타입이다.  
그래서!

```swift
reversedNames = names.sorted(by: > )

// Declare
public func ><T : Comparable>(lhs: T, rhs: T) -> Bool
```


#### 후행 클로저 
마지막 전달인자로 위치하는 함수의 소괄호`( )`를 닫고 클로저를 작성해도 된다. 게다가 **단 하나**의 클로저만 전달인자로 사용하는 경우에는 **소괄호도 생략할 수 있다.** WoW

```swift
reversedNames = names.sorted{ $0 > $1 }
```












