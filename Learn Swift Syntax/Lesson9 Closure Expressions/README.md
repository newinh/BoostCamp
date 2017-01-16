# Closure

*Closure*는 사용자의 코드 안에서 전달되거나 사용할 수 있는 기능을 포함한 독립적인 블록(block)입니다. 클로저는 자신이 정의된 컨텍스트 (context) 로부터 임의의 상수 및 변수의 참조(reference) 를 획득 (capture)하고 저장할 수 있습니다.

**함수랑 다른점은 무엇일까?**


### Closures include
global functions, nested function and **closure expressions**

### What is a closure expression?
closure expression - ** an unnamed, self contained block of code**

### What are closure expressions used for?
Closure expressions are used to **specify an action to be executed some time in the future.**


## Sort

 배열의 sort()함수를 통해서 클로저의 표현식부터 알아보자  
    var bids = [48.1, 75.4, 63.7, 52.4, 68.2]
    var orderedBids = bids.sorted(by: { (bid1: Double, bid2:Double) -> Bool in
        return  bid2 > bid1
    })

중괄호사이를 잘 살펴보자. `bid1`, `bid2`로 명명된 `Double`형 인자를 적어주고 리턴 타입을 적어주었다. 그리고 `in` !  그 다음에 실행할 구문을 적는다. 여기서는 `return bid2 > bid1` 뿐이다.  
`print(orderedBids)`로 결과를 출력해보면 신기하게도 *정렬된 결과*가 나온다!



## Cloure Type

클로저 타입형식 : `(String, String) -> Bool`
이런식임ㅇㅇ

## 축약법....!
 그냥 다 생략한다. 자세한 설명도 생략한다..........


```swift
// 기본형. 눈치껏 70점 이상만 남겼음을 알 수 있다.
var examGrades = [81, 99, 54, 84, 98]
var passingGrades = examGrades.filter({(grade: Int) -> Bool in
    return grade > 70
})
passingGrades   // [81, 99, 84, 98]

```


이제 Int 를 생략(Inferring closure expression type)
```swift
var grades = [81, 99, 54, 84, 98]
var failingGrades = examGrades.filter({grade in
    return grade < 70
failingGrades   // [54]
```


Implicit return!
```swift

var moreGrades = [81, 99, 54, 84, 98]
    var morePassingGrades = examGrades.filter({grade in
    grade > 70
})
morePassingGrades   // [81, 99, 84, 98]
```


이제는 급기야 인자까지 생략한다ㅜㅠ `$0`부터 시작되는 인자들!
```swift
var myGrades = [81, 99, 54, 84, 98]
    var myFailingGrades = examGrades.filter({
    $0 < 70
})
myFailingGrades     // [54]
```
=========================
아래 예제를 연습해보자.
```swift
var soups = ["tomato", "hot and sour", "french onion", "vegetable"]
    var alphabeticalSoups = soups.sorted(by: {(soup1: String, soup2: String) -> Bool in
    return soup2 > soup1
})
alphabeticalSoups


요렇게..........과정없이 결과를 바로 적으니까 아직은 당황스럽맨
```swift
var soups = ["tomato", "hot and sour", "french onion", "vegetable"]
var alphabeticalSoups = soups.sorted(by: {
    $1>$0
})
alphabeticalSoups
```



















