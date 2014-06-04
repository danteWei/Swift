// Playground - noun: a place where people can play

import UIKit

                                                                /* Variables */

//var for variable, let for constant
var myVariable = 42

let MAXLEN: Double = 80

let floatValue: Float = 4

//When convert a value to a different type
//explicitly make an instance of the desired type
let label = "The width is "
let width = 94
//let widthL = label + width will return an error
let widthLabel = label + String(width)

//Or an easier way to include values in strings: \(value)
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//define a dictionary/array using []
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Realtions"

//declare an empty array/dictionary
let emptyArray = String[]()
let emptyDictionary = Dictionary<String, Float>()

//If type can be inferred
shoppingList = [] //empty array
var emptyDict = [:] //empty dictionary

                                                                /* Control Flow */

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    }
    else {
        teamScore += 1
    }
}

teamScore

//if & let together to work with values that might be missing
//These values are represented as optionals, they either contain values or nil to indicate the value is missing
//write a "?" ater the type to mark the value as optional
var optionalString: String? = "Hello"
optionalString == nil //return false

var optionalName: String? = "John Appliseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
}
else {
    greeting = "Name is missing"
}


//switches
let vagetable = "red pepper"
switch vagetable {
    case "celery":
        let vegetableComment = "Add some raisins and make ants on a log"
    case "cucumber", "watercress":
        let vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
        let vegetableComment = "Is it a spicy \(x)?"
default: //must have a default case
    let vegetableComment = "Everything tastes good in soup."
}

//for-in statements
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var numberKind: String = ""

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            numberKind = kind
        }
    }
}

numberKind
largest


//while loops
var n = 2
while n < 100 {
    n = n * 2
}

n

var m = 2
do {
m = m * 2
} while m < 100 //this ensures that the while loop is run at least once

m

//for loops with indexes
var forLoop = 0
for i in 0..3 {
    forLoop += i
}

forLoop

forLoop = 0
for var i = 0; i < 3; ++i {
    forLoop += i
}

forLoop

                                                        /* Functions and Closures */

//use func to declare a function
//use -> to separate the parameter names and tyes from the fucntion's return type
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}

greet("Bob", "Tuesday")

//Use a tuple to return multiple values from a function
func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}

getGasPrices()

//passing variable number of arguments, the arguments are collected as an array
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf()

sumOf(42, 597, 12)

//Nested functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    
    add()
    
    return y
}

returnFifteen()

//functions are first-calss type, which means that a function can return another function as its value
func makeIncrement() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrement() //assign the returned function to a variable
increment(7)

//passing a function as argument
func hasAnyMatches(list: Int[], condition: Int->Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]

hasAnyMatches(numbers, lessThanTen)

//Functions are actually a special case of closures. You can write a closure w/o a name
//by surrounding code w/ braces ({}). Use "in" to separate the arguments and return type from the body
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

//You have several options for writing closures more concisely.
//When a closure’s type is already known, such as the callback for a delegate, 
//you can omit the type of its parameters, its return type, or both. 
//Single statement closures implicitly return the value of their only statement.
numbers.map({ number in 3 * number })

//refer to parameters by number instead of by name
//this is useful in very short closures
//A closure passed as the last argument to a function can appear immediately after the parentheses
sort([1, 5, 3, 12, 2]) {$0 > $1}

                                                            /* Objects & Classes */

//This version of the Shape class is missing something important: an initializer
//use init to create one
class Shape {
    let type = "shape"
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    func setSides (s: Int) {
        numberOfSides = s
    }
}


var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//This class has an initializer
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    //initializer
    init(name: String) {
        self.name = name //"self" is the same as "this" in Java
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

//use deinit to create a deinitializer if some cleanup is needed before the object is deallocated.
//Subclasses include their superclass name after their class name, separate by a colon.
//override methods of the a superclass's method is marked with "override"
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        //calling superclass's init function
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    //overriding a function
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Double
    let pi: Double = 3.14
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() -> Double {
        return radius * radius * pi
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of \(radius)."
    }
}

var testCircle = Circle(radius: 2.5, name: "a cirlce")
testCircle.area()
testCircle.simpleDescription()


//in addition to simple properties that are stored, 
//properties can have a getter and a setter.
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        //getter and setter for perimeter
        get {
            return 3.0 * sideLength
        }
        set {
            //the new value has the implicit name "newValue".
            //you can provide an explicit name like this: set(valueName) {...}
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")

triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

//if there is no need to compute the property but still need to provide
//code that is run before and after setting a new value, use "willSet"
//and "didSet", for example, the class below ensures that the side length
//of its triangle is always the same as the side length of its square
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
    willSet {
        square.sideLength = newValue.sideLength
    }
    }
    
    var square: Square {
    willSet {
        triangle.sideLength = newValue.sideLength
    }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

//Methods on classes have one important difference from functions.
//Parameter names in functionis are used only within the function,
//but parameters in methods are also used when you call the method,
//except for the first parameter. By default, a method has the same
//name for its parameters when you call it and within the method itself.
//You can specify a second name, which is used inside the method
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) { //"times" is another name for numberOfTimes
        count += amount * times
    }
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7) //the name of the first parameter is omitted

//optional values of methods, properties & subscripting are the same as before
//if the value before the ? is nil, everything after the "?" is ignored
//and the value of the whole expression is nil
//otherwise, the optional value is unwarpped
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



                                                        /* Enumerations and Structures */
