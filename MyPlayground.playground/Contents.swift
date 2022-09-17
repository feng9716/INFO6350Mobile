import UIKit
import Darwin

// Single line comment starts with: //
/**
    Multi-line comment starts with /** , end with */
 */

var greeting = "Hello, playground"
let name : String = "Feng Zhening"
// ways of creating variables
// 1. let => declard as a constant, have to assign an initial value to it
let helloWorld = "Hello World!"

// 2. var => normal variable
var address = "101 St N, Seattle"

// variableName : Type = Value
var intValue : Int = 5

// create multiple values
var i, j, k : Int

// '=' must have same whitespace on both sides
//var happy : String= "Happy" -> Gives error
var happy : String = "Happy"

// String Interpolation \(variable)
print("Name is : \(name). Address is : \(address)")

// Data types
// Integer : Int

let uIntValue: UInt // UInt: Unsigned Integer
let intMaxValue: Int = Int.max
let intMinValue: Int = Int.min

// Float and Double
// 64bit and 32bit

let doubleValue : Double = 0.5
let floatValue : Float = 1.0

//binary
let binaryValue = 0b1101 // starts with '0b'
let octal = 0o1435 // starts with '0o'
let hexa = 0x2323AF // starts with '0x'

//boolean
let booleanVal : Bool = false // or true

// Tuples
let tupleValue  = (404 , "Not Found", "Error")
let key = tupleValue.0
// Another way to initialize a tuple
let (intKey, StringValue) = (404 , "Not Found")
print("\(intKey) \(StringValue)" )


// Optionals Add ? when defining type
//
var studentID : Int?
var employeeID : Int?
var myName : String?

var id = (studentID ?? 1) + 20 // studentID is nil -> id = defaultValue = 1

// studentId not assigned YET, will not go in if
if let someId = studentID { // studentID does not exist
    let a = someId + 10 // a = 1 + 20
    print(a)
}


// Now we assign those variables
studentID = 1
employeeID = 2
myName = "JoJo"
if let studentID = studentID, let employeeID = employeeID, let myName = myName {
    print ("studentID: \(studentID) , employeeID: \(employeeID), name: \(myName) ")
}


//Functions

func functionWithNoArgumentsAndNoReturns(){
    print("This is a function with no Arguments and Returns")
}

functionWithNoArgumentsAndNoReturns()

// _ means we dont need to explicitly assign an variable
func functionWithArgumentsAndNoReturns(_ a : Int,b : Int){
    print(a+b)
}

functionWithArgumentsAndNoReturns(5, b : 13)

func functionWithArgumentsAndReturn(firstName : String , lastName : String) -> String {
    return "\(firstName) \(lastName)"
}

print(functionWithArgumentsAndReturn(firstName: "Zhening", lastName: "Feng"))


// Catch an exception handling
func funcWithException(a : Int, b : Int) throws -> Int {
    return a / b
}

do{
    let res = try funcWithException(a: 10, b: 0)
    print(res)
}
catch {
    print("Unexpected Error: \(error)")
}
