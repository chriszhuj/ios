//: Playground - noun: a place where people can play

//声明可空类型,类型后加上？号

import Cocoa

var errorCodeString:String?
errorCodeString = "404"
if errorCodeString != nil{
    let theError = errorCodeString!
    print(theError)
}
print(errorCodeString)

if let error = errorCodeString, let errorCode = Int(error){
    print(error)
}
var error = "The request failed:"
func appendErrorCode(_ code: Int, toErrorString errorString: inout String){
    if code == 404{
        errorString += " bad request."
    }
}
appendErrorCode(404, toErrorString: &error)
error
func sortedEvenOddNumbers(_ numbers:[Int])->(evens:[Int], odds:[Int]){
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers{
        if number % 2 == 0{
            evens.append(number)
        } else{
            odds.append(number)
        }
    }
    return (evens, odds)
}
let numbers = [10,2,3,9,80]
print(sortedEvenOddNumbers(numbers))

