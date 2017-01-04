# Control Flow

## for & for-in

```swift
for var index = 99; index > 0; --index{
    print("\(99-index) bottles of beer on the wall. \(99-index) bottles of beer. Take one down, pass it around ...")
}


for index in 0..<99 {
print("\(99-index) bottles of beer on the wall. \(99-index) bottles of beer. Take one down, pass it around ...")
}
```


> for item in Collection {
>    statements to execute on each item
> }

> for (key, value) in Dictionary {
>     statement to execute on each key or value
> }


## while * repeat-while


```swift
var timer = 10

while timer > 0 {
    timer -= 1
}

///////////////////
var beerVolume = 12.0
var sip = 0.3

while beerVolume > 0 {
    print ("Cheers!")
    beerVolume -= sip
}
```


repeat-while문은 내가 알던 do-while문 
```swift
repeat {
    --timer
} while timer > 0

repeat {
    print("Cheers")
    beerVolume -= sip
} while beerVolume > 0

```


## if-else statement
 pass

## switch statement


```swift
switch birthYear {

    case 1992, 1980, 1968:
    print("You were born in the year of the monkey.")

    case 1991,1979,1967:
    print("You were born in the year of the goat.")

    default:
    print("You were born in the year of some other animal.")
}
```

C의 switch-case 와 다른 점은 *fall through* 현상이 없다는것.   
**break; 가 없으니 만족하는 조건을 만나면 switch문이 종료된다!**  
아래의 경우 temperature가 55이므로 조건문 2개를 만족하지만 첫번째 조건문안에 내용만 실행하고 switch문을 빠져나간다.

```swift
let temperature = 55
switch temperature {

    case 10...55:
    print("Brrr")

    case 55...78:
    print("Comfortable")

    case 78...95:
    print("Sweaty")

    default:
    print("Very uncomfortable")
}
```







