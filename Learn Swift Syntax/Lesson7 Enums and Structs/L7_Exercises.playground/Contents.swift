//: ## Lesson 7 Exercises - Enums & Structs

//: __Problem 1__
//:
//: At the end of the code snippet below, what is the value of macchiato.steamedMilk when EspressoDrink is implemented as a struct? What about when EspressoDrink is implemented as a class?
enum Amount {
    case none
    case splash
    case some
    case alot
}

struct EspressoDrink {
    let numberOfShots: Int
    var steamedMilk: Amount
    let foam: Bool
    
    init(numberOfShots: Int, steamedMilk: Amount, foam: Bool) {
        self.numberOfShots = numberOfShots
        self.steamedMilk = steamedMilk
        self.foam = foam
    }
}

var macchiato = EspressoDrink(numberOfShots: 2, steamedMilk: .none, foam: true)
var espressoForGabrielle = macchiato
espressoForGabrielle.steamedMilk = .splash
macchiato.steamedMilk

//my solution 
// macchiato.steamedMilk is none. But if EspressoDrink is implemented as a class, macchiato.steamMilk. will be Amount.splash


//: __Problem 2__
//:
//: __2a.__
//: Write an enum to represent the five fingers on a human hand.
//:
//: __2b.__
//: Associate an Int value with each finger.

// my solution
enum Fingers : Int{
    case thumb = 1, index, middle, ring, pinky
}

//: __Problem 3__
//:
//: Enum, class, or struct?
//:
//: Uncomment the code below and choose whether each type should be an enum, class, or struct.
//class Window {
//    let height: Double
//    let width: Double
//    var open: Bool
//}

//enum WritingImplement {
//    case pen
//    case pencil
//    case marker
//    case crayon
//    case chalk
//}

//struct Material {
//    let name: String
//    let density: Double
//    let stiffness: Double
//}


//struct Bicycle {
//    let frame: Material
//    let weight: Double
//    let category: String
//
//    static var bikeCategories: [String] = ["Road", "Touring", "Mountain", "Commuter", "BMX"]
//
//    func lookCool() {
//        print("Check out my gear-shifters!")
//    }
//}

//struct Cyclist {
//    var speed: Double
//    let agility: Double
//    let bike: Bicycle
//
//    var maneuverability: Double {
//        get {
//            return agility - speed/5
//        }
//    }
//
//    init(speed: Double, agility: Double, bike: Bicycle) {
//        self.speed = speed
//        self.agility = agility
//        self.bike = bike
//    }
//
//    func brake() {
//        speed -= 1
//    }
//
//    func pedalFaster(factor: Double) {
//        speed * factor
//    }
//}

//enum Size: String {
//    case small = "8 ounces"
//    case medium = "12 ounces"
//    case large = "16 ounces"
//}

//: __Problem 4__
//:
//: Write a cookie struct.
//:
//: __4a.__
//: Include 2 stored properties. Examples might include a string representing flavor, or an int representing minutesSinceRemovalFromOven.

//:__4b.__
//: Add a computed property, "delicious", a bool whose value depends upon the values of the stored properties.

//:__4c.__
//:Include a method. For example, the method tempt() might return or print out an indication of a person being tempted to eat the cookie.

//: __4d.__
//: Create an instance of your Cookie struct and call its method.
struct Cookie{
    let flavor : String
    let minutesSinceRemovalFromOven : Int
    
    var delicious : Bool{
        get {
            return minutesSinceRemovalFromOven < 7 ? true : false
        }
    }
    
    func tempt(){
        print("I'm trying to eat cookie.")
    }
    
}

var cho = Cookie(flavor: "good", minutesSinceRemovalFromOven: 4)
cho.tempt()

//: __Problem 5__
//:
//: Write a class to represent a listing for a Bed and Breakfast.
//:
//: __5a.__
//: Include 3 stored properties. Examples might include a category representing the type of housing i.e. apartment or house, or a bool representing availability.

//: __5b.__
//: Consider writing a helper enum and incorporating it as one of your properties.

//: __5c.__
//: Include at least one method. For example, the method book() might toggle the availability bool or return a reservation confirmation.

//: __5d.__
//: Create an instance of your BnBListing class and call one of its methods.
enum Rate {
    case good
    case soso
    case bad
}


class Hotel{
    
    let availability : Bool
    let numberOfBed : Int
    let offerOfBreakfast : Bool
    let rate : Rate
    
    init(availavility : Bool, numberOfBed : Int, offerOfBreakfast : Bool, rate : Rate) {
        self.availability = availavility
        self.numberOfBed = numberOfBed
        self.offerOfBreakfast = offerOfBreakfast
        self.rate = rate
    }
    
    func book() -> Bool {
        return availability
    }
    
    
}


var theMoon = Hotel(availavility: true, numberOfBed: 88, offerOfBreakfast: true, rate: .good )
theMoon.book()

