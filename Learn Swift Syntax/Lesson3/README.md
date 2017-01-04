# Collections

- Set : unordered list of distinct values
- Array : ordered list of items
- Dictionary : collection of key-value pairs

## Arrays Initialization

Array를 선언하는 세가지 방법

```swift
// The verbose way
var numbers = Array<Double>()       // Array<Double>.init()과 같다. init은 생략가능

// More often you will see ...
var moreNumbers = [Double]()
moreNumbers = [85.0, 90.0, 95.0]

// Array literal syntax
let differentNumbers = [97.5, 98.5, 99.0]
```




Array concatenation
```swift
moreNumbers = moreNumbers + differentNumbers
```

### Array operations : append, insert, remoce, count, retriece

```swift
var roadTripMusic = ["Neil Young","Kendrick Lamar","Flo Rida", "Nirvana"]
roadTripMusic.append("Rae Sremmurd")
roadTripMusic.insert("Dej Loaf", at: 2)
roadTripMusic.remove(at: 3)
roadTripMusic.insert("Keith Urban", at: 3)
roadTripMusic.count

let musician = roadTripMusic[2]
```


## Dictionary Initialization

```swift
// Initializer syntax
var groupsDict = [String:String]()

// Dictionary literal
var animalGroupsDict = ["whales":"pod", "geese":"flock", "lions": "pride"]

// Another example
var averageLifeSpanDict = [String:CountableRange<Int>]()
var lifeSpanDict = ["African Grey Parrot": 50...70, "Tiger Salamander": 12...15, "Bottlenose Dolphin": 20...30]
```
`...`은 range를 나타냄. ex) 20...30 이면 20이상 30 이하


### Dictionary operations : insert, remove, count, update, retrieve

```swift
// Adding items to a dictionary
animalGroupsDict["crows"] = "murder"
animalGroupsDict["monkeys"] = "troop"

// The count method is available to all collections.
animalGroupsDict.count

// Removing items from a dictionary
animalGroupsDict["crows"] = nil

// Updating a value
animalGroupsDict["monkeys"] = "barrel"
var group = animalGroupsDict.updateValue("gaggle", forKey: "geese")
type(of: group) // 결과 : Optional<String>.Type
// group에는 지워진 결과인 "flock"이 저장된다.

animalGroupsDict.updateValue("crash", forKey:"rhinoceroses")

//Retrieving the value for a particular key
let groupOfWhales = animalGroupsDict["whales"]
```

#### Dictionary return value as optional

 따라서 dictionary에서 value를 가져오면 unwrapping 한 뒤 사용해야한다.



## Set

 set은 중복을 허용하지 않는다.

### initialization
```swift
//: Literal syntax
var cutlery: Set = ["fork", "knife", "spoon"]
var flowers:Set<Character> = ["🌷","🌹","🌸"]

//: Initializer syntax
var utensils = Set<String>()
var trees = Set<Character>()
```


### Set operations: Insert, Remove, Count
```swift
trees.insert("🌲")
trees.insert("🌳")
trees.insert("🌵")

trees.remove("🌵")
trees.count
```




[More on Sets](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID484) from Apple's, The Swift Programming Language.


























