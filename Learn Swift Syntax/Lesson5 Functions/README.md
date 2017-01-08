# Functions

- Global Functions
- Nested Functions
- Method

Netsted Funcions은 나중에 다룬다..

## Global Functions
 This can be called from anywhere in an app.

[detail](http://swiftdoc.org/v3.0/func/)
- abs
- assert
- assertionFailure
- debugPrint
- dump
- fatalError
- getVaList
- isKnownUniquelyReferenced
- max
- min
- numericCast
- precondition
- preconditionFailure
- print
- readLine
- repeatElement
- sequence
- stride
- swap
- transcode
- unsafeBitCast
- unsafeDowncast
- withExtendedLifetime
- withUnsafeMutablePointer
- withUnsafePointer
- withVaList
- zip

## Method
 When a function is defined in an associated with a particular class, we call that a function a **method**


## Anatomy of Functions

> 예시
> func functionName (parameterName: parameterType) -> returnType {
>         statements to execute
>         return object
>      }

```swift
// Exaple

let array = ["A", "13", "B","5","87", "t", "41"]

class Arithmetic {

    func sumOfStrings(_ aBunchOfStrings: [String]) -> Int {

        let array = aBunchOfStrings
        var sum = 0

        for string in array {
            if Int(string) != nil {
                let intToAdd = Int(string)!
                sum += intToAdd
                }
            }
    return sum
    }
}


## External and Local Parameter Names



>     func functionName (externalParameterName localParameterName: parameterType) -> returnType {
>         statements to execute
>         return object
>      }

콜론없이 parameter가 하나 더 있다!
----------
```swift

func firstCharacterOf(word word: String)-> Character {
    return word[word.startIndex]
}

firstCharacterOf(word: "Mom")
```
External Parameter Name and Local Parameter Name are same!




```swift
func placeFirstLetterLast(var myString: String) -> String {
    
    myString.append(firstCharacterOf(word: myString))
    myString.remove(at: myString.startIndex)
    return myString
}

placeFirstLetterLast("Mom")
```
~~paramater 에 `var`가 들어간 것을 주목하자. `var`를 추가하지 않으면 myString은 immutable이 되어 값을 수정할 수 없다.~~
** swift3 에서 삭제됨! **





```swift

//: Example 3 - filterByYear

class MovieArchive {

    func movieFilter(_ year : Int, movies : [String:Int]) -> [String] {

        var filteredMovies = [String]()


        for (movieName, releaseYear) in movies {

        if year == releaseYear {
            filteredMovies.append(movieName)
        }
    }


        return filteredMovies
    }
}

var aiThemedMovies = ["Metropolis":1927, "2001: A Space Odyssey":1968, "Blade Runner":1982, "War Games" : 1983, "Terminator": 1984, "The Matrix":1999, "A.I.":2001, "Her": 2013, "Ex Machina":2015]

var myArchive = MovieArchive()


myArchive.movieFilter(1927, movies: aiThemedMovies)

```


parameter앞에 _ 를 붙이면 method를 호출할 때 parameter 이름을 적지 않아도 되는 모양이다.



















