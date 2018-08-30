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
