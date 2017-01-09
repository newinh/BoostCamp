# Struct & Class

- Overview
- 공통점
- 차이점I
- 차이점II

~~오늘은 한글사랑~~

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

[Swift - let(상수선언)에 대해 파고들기](http://seorenn.blogspot.kr/2014/07/swift-let.html)   
구조체를 상수`let`로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없다. 구조체도 `var` 프로퍼티도 `var`형으로 선언 되어있을 경우, 메소드를 이용해서 프로퍼티를 변경하려면 메소드에 `mutating`키워드가 필요하다. 반면, 클래스의 인스턴스는 상수 `let`로 선언해도 내부 프로퍼티 값을 변경할 수 있다!

다음에 더 자세히 공부해보기로 하고 넘어가자. ~~`mutating`으로부터  ㅌㅌㅌㅌ~~

Swift에는 클래스의 인스턴스 끼리 참조가 같은지 확인하라 수 있는 식별 연산자(Identity Operator)가 존재한다.
```swift
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
```

> Note that “identical to” (represented by three equals signs, or ===) does not mean the same thing as “equal to” (represented by two equals signs, or ==):

 - “Identical to” means that two constants or variables of class type refer to exactly the same class instance.
 - “Equal to” means that two instances are considered “equal” or “equivalent” in value, for some appropriate meaning of “equal”, as defined by the type’s designer.

### 상속여부

 - **구조체는 상속할 수 없습니다.** -> 상속이 필요한 경우 Class를 사용하자.
 - 타입


## 차이점II


































