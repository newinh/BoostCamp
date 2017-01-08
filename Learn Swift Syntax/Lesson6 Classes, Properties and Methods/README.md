# Classes, Properties, and Methods

 Class is a unit that we use to package together related data and functionality. A class is made up of **properteis** and **methods**


```swift

class MovieArchive {
    var movies:[Movie]         //property

    func filterByYear(_ year:Int) -> [Movie] {      //method
        var filteredArray = [Movie]()

        for movie in self.movies {

            if movie.releaseYear == year {
                filteredArray.append(movie)
            }
        }
        return filteredArray
    }


    init(movies:[Movie]) {      // init method
        self.movies = movies
    }
}

```


## Access Control
 default값은 internal ( java에서 protected와 비슷)
    
|   Level  | Class | App/Framework | World |
|:--------:|:-----:|:-------------:|:-----:|
|  Public  |   Y   |       Y       |   Y   |
| internal |   Y   |       Y       |   N   |
|  private |   Y   |       N       |   N   |

## Properties
 Class 내에서 선언된 Constants or Variables.

 - stored properties (instance properties)
 - type properties (class properties)
 - computed properties

### Stored Properties

### Type Properties
 A type property has the same value for evert instance of a class.  
`static`을 앞에 붙여서 표현한다.


method의 경우에도 *type method (class method) * 가 존재한다.  
method 의 경우 `class`를 붙이거나 `static`을 붙여준다.  
**`class`를 붙인경우 subclass들이 override할 수 있는 method가 된다.**



### Computed Properties
 a property that's computed based on existing data in class.
Computed properties have **custom getters** and **optionally custom setters**.



===========
```swift

class KidsMovie {
    let title: String
    let director: String
    let releaseYear: Int
    var mpaaRating: String                          //  Stored property
    static let permittedRatings = ["G", "PG"]       //  Type property
    let reviewScores:[Double]

    var metaScore: Double {                         //  Coumputed property
        get {
            let value = reviewScores.reduce(0) { $0 + $1 } / Double(reviewScores.count)
            return value
        }

        set{
            // do something
        }
    }

    init(title: String, director: String, releaseYear: Int, mpaaRating:String, reviewScores: [Double]) {
        self.mpaaRating = mpaaRating
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
        self.reviewScores = reviewScores
    }
}

```















