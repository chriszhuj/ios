//: Playground - noun: a place where people can play

import Cocoa

var population:Int = 5422
var msg:String
var hasPostOffice:Bool = true

if population<10000{
    msg = "\(population) is a small town"
}else if(population>10000 && population<50000){
    msg = "\(population) is a medium town"
} else{
    msg = "\(population) is a big town"
}
print(msg)
if(!hasPostOffice){
    print("where do we buy stamp?")
}

var statusCode:Int = 506
var errorString:String = "The request failed with the error:"
switch statusCode {
case 100, 101:
    errorString += " Information,\(statusCode)."
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
    errorString += " Redirection,\(statusCode)."
case 400...417:
    errorString += " Client error,\(statusCode)."
case 500...505:
    errorString += " Server error,\(statusCode)."
case let unknownCode where (unknownCode>=200 && unknownCode<300) || unknownCode>505:
    errorString = "\(unknownCode) is not a know error code."
default:
    errorString = "Unexpected error encountered."
}
print(errorString)
let error=(code:statusCode, error:errorString)
print(error)
print(error.code)
print(error.error)
