//: ## Lesson 6 Exercises - Classes, Properties and Methods

// hi there
import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    init(species : String, tail : Double) {
        self.species = species
        self.tail = Tail.init(lengthInCm: tail)
    }
    init(species : String) {
        self.species = species
        self.tail = Tail.init(lengthInCm: 0)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.
var york = Animal(species: "york", tail: 14.5)
york.species
york.tail.lengthInCm
//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    static var varieties = ["August Pride", "Babcock", "Baby Crawford", "Belle of Georgia"]
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen() -> String {
        
        if softness <= 5 {
            softness += 1
        }
        
        return "Peach's softness is \(softness)"
    }
}

var peach0 = Peach(variety: "Babcock", softness: 3)
peach0.ripen()
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().

//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
//var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    var cuddlability : Int {
        get{
            return 3*fluffiness - 2*droolFactor
        }
    }
    
    func chase(_ wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
let bichon = FluffyDog(name: "zzong", fluffiness: 7, droolFactor: 2)
bichon.chase("truck")

//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case small
    case medium
    case large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    static func speak(){
        print("안녕하세요 사람친구들!")
    }
    
    func bark() -> String {
        
        var barkMessage : String
        
        switch size {
        case .large:
            barkMessage = "왕왕"
        case .medium:
            barkMessage = "멍멍"
        default:
            barkMessage = "왈왈"
        }
        
        
        return "\(name) is barking. \"\(barkMessage)\" "
    }
    
    
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
var chihuahua = ChattyDog(name: "Hoon", breed: "Chihuahua", size: .small)
chihuahua.bark()
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.
//chihuahua.speak()
//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case poor, fair, good, excellent
}

enum NaturalDisaster {
    case earthquake
    case wildfire
    case hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    
    init(numberOfBedrooms : Int, location : Quality){
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
 
    func willStayStanding(_ naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .earthquake:
            return true
        case .wildfire:
            return true
        case .hurricane:
            return false
        }
    }
    
    var worthyOfAnOffer : Bool{
        get{
            
            var locationess : Int
            
            switch location {
            case .excellent :
                locationess = 4
            case .fair :
                locationess = 3
            case .good :
                locationess = 2
            default :
                locationess = 1
                
            }
            
            return (locationess + numberOfBedrooms) > 5 ? true : false
        }
        
        
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
var myHome = House(numberOfBedrooms: 3, location: Quality.fair)
myHome.willStayStanding(.earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.






