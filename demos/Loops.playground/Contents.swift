//: Playground - noun: a place where people can play

import Cocoa

var myFirstInt:Int = 1
for i in 1...5{
myFirstInt += i
print(myFirstInt)
}
for i in 1...100 where i%3==0{
    print(i)
}
var str:String = "hello"
var startIndex = str.startIndex
var end = str.index(startIndex, offsetBy: 4)
print(str[end])
