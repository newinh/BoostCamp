# Struct & Class

- Overview
- 공통점
- 차이점I
    - 값 vs 참조
    - 상속여부
    - 초기화
- 구조체와 클래스 선택하기!

~~한글판 책을 샀으니 오늘은 한글로 달려보자~~

## Overview

 Struct와 Class는 데이터를 적절히 묶어 만드는, 하나의 새로운 데이터 타입이다. 많은 공통점이 있지만 둘 사이를 가로짓는 가장 큰 차이점은 **Class는 Reference Type**이고 **Struct는 Value Type**이다.  

## 공통점

> - 값을 저장하기위해 프로퍼티를 정의 할 수 있다.
- 기능 수행을 위해 메서드를 정의할 수 있다.
- 서브스크립트 문법을 통해 구조체 또는 클래스가 가지는 값(프로퍼티)에 접근하도록 서브스크립트를 정의할 수 있다.
- 초기화될때의 상태를 지정하기 위해 이니셜라이저를 정의할 수 있다.
- 초기구현과 더불어 새로운 기능 추가를 위해 익스텐션을 통해 확장할 수 있다.
- 특정 기능을 수행하기 위해 특정 프로토콜을 준수할 수 있다.

정의, 생성, 초기화 등 너무나 많은 부분이 닮아있다.   
그래서 지금부터는 *차이점을 찾기위한 여정!*

## 차이점

### Value vs Reference
앞서 강조했던 내용이다. 이 부분은 설명이 잘된 곳이 많다 :)   
그래서 여기선 아직 어렵게 느껴지지만 이 이부분과 관련됬다고 생각되는 내용을 적어본다.

- [Swift - let(상수선언)에 대해 파고들기](http://seorenn.blogspot.kr/2014/07/swift-let.html)   
구조체를 상수`let`로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없다. 구조체도 `var` 프로퍼티도 `var`형으로 선언 되어있을 경우, 메소드를 이용해서 프로퍼티를 변경하려면 메소드에 `mutating`키워드가 필요하다. 반면, 클래스의 인스턴스는 상수 `let`로 선언해도 내부 프로퍼티 값을 변경할 수 있다!

다음에 더 자세히 공부해보기로 하고 넘어가자. ~~`mutating`으로부터  ㅌㅌㅌㅌ~~

- Swift에는 클래스의 인스턴스 끼리 참조가같은지 확인하라 수 있는 식별 연산자(Identity Operator)가 존재한다.
```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
```
[Equivalence Operators](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-ID45)에 대해서도 알아두자.

> Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):
    - “Identical to” means that two constants or variables of class type refer to exactly the same class instance.
    - “Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.

- **스위프트의 기본 데이터 타입은 모두 구조체!!**
기본 데이터 타입은 값 타입이라, 전달인자를 통해 데이터를 전달하면 모두 값이 복사되어 전달될뿐.

- function의 매개변수와도 연관이 있다.

### 상속여부

 - **구조체는 상속할 수 없습니다.** -> 상속이 필요한 경우 Class를 사용하자.
 - 타입캐스팅은 클래스의 인스턴스에만 허용된다. -> 상속도 안되는데 당연한 소릴..
 - 참조횟수계산(Reference Counting)은 클래스의 인스턴스에만 적용된다. -> 저번주에 배운 ARC

### 초기화

 클래스와 구조체의 초기화를 보다보니 스위프트는 초기화에 매우 엄격하다는 것을 알게되었다.

 - 구조체는 Initializer를 사용하지 않아도 기본적인 memberWize Initializer가 제공된다. (왜 얘만?)
 - 클래는에게는 Deinitializer 가 존재한다. (deinit 메소드)
(구조체는 메모리 해제가 안되는걸까?) 


## 구조체와 클래스 선택하기!

비슷해보이지만 우리는 대부분 class를 쓰게 될거라고 그러넹ㅋ,ㅋ

아래는 Apple에서 구조체를 권하는 경우.
> - 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
 - 캡슐화된 값이 참조되는 것보다 복사되는 것이 합당할 때
 - 구조체에 저장된 프로퍼티가 값 타입이며, 참조되는 것 보다는 복사되는 것이 합당할 때
 - 다른 타입으로부터 상속받거나 자신이 상속이 필요할 때

구조체 사용 예
> - The size of a geometric shape, perhaps encapsulating a width property and a height property, both of type Double.
- A way to refer to ranges within a series, perhaps encapsulating a start property and a length property, both of type Int.
- A point in a 3D coordinate system, perhaps encapsulating x, y and z properties, each of type Double.

 [Swift - 언제 class 대신 struct 를 사용하는가](http://seorenn.blogspot.kr/2016/04/swift-class-struct.html)
위 링크에서 정리해준 struct를 쓰면 유리해 지는 예

> - 불변성(Immutable)이 필요한 데이터 타입
- 적은 데이터, 즉 멤버 프로퍼티의 갯수나 차지하는 메모리 용량이 적은 타입
- 대입 보다는 생성되는 경우가 많은 타입
- 공유될 필요가 없는 타입
- 클래스 타입 등 레퍼런스에 기반한 자료형을 저장용 프로퍼티로 쓰지 않는 경우




























