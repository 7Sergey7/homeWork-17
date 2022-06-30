//
//  main.swift
//  homeWork 17
//
//  Created by Seroj on 29.06.22.
//

import Foundation


//homeWork 17.1
/*
 Ստեղծել Class View անունով (հետևյալ փրոփրտիներով frame: Rect, backgroundColor: Color, tag: Int)
որը պետք է ունենա հետևյալ init-ները`
- init(frame: Rect, backgroundColor: Color, tag: Int)
- init(frame: Rect, backgroundColor: Color)
- init(frame: Rect)
- init()
 */

class Point {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
let myPoint = Point(x: 1, y: 1)
//print(myPoint.x)


class Rect {
    var origin: Point
    var width: Double
    var height: Double

    init(origin: Point, width: Double, height: Double) {
        self.origin = origin
        self.width = width
        self.height = height
    }

    convenience init() {
        self.init(origin: Point(x: 1, y: 4), width: 2, height: 34)
    }
}
let myRect = Rect(origin: Point(x: 2, y: 2), width: 10, height: 10)
//print(myRect.origin.x)


class Color {
    var red: Double
    var green: Double
    var blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
}
let myColor = Color(red: 1, green: 1, blue: 1)
//print(myColor.blue)


class View {
    var frame: Rect
    var backgroundColor: Color
    var tag: Int

    init(frame: Rect, backgroundColor: Color, tag: Int) {
        self.frame = frame
        self.backgroundColor = backgroundColor
        self.tag = tag
    }

    convenience init(frame: Rect, backgroundColor: Color) {
        self.init(frame: frame, backgroundColor: backgroundColor, tag: 0)
    }

    convenience init(frame: Rect) {
        self.init(frame: frame, backgroundColor: Color.init(red: 0, green: 0, blue: 0))
    }

    convenience init() {
        self.init(frame: Rect(origin: Point(x: 0, y: 0), width: 0, height: 0))
    }
}
var viewObj = View()
print(viewObj.backgroundColor.green)


//homeWork 17.2
/*
 Ստեղծել Class GITCViewController անունով (հետևյալ փրոփրտիներով view: View, navigationTitle: String)
 որը պետք է ունենա հետևյալ init-ները`
 - init()
 - init(navigationTitle: String)
 - init(frame: Rect)
 */

class GITCViewController {
    var view: View
    var navigationTitles: String
    
    init() {
        view = View()
        navigationTitles = "title"
    }
    
    init(navigationTitle: String) {
        self.navigationTitles = navigationTitle
        view = View()
    }
    
    init(frame: Rect) {
        let viewFrame = Rect(origin: Point(x: 1, y: 1), width: 10, height: 15)
        view = View(frame: viewFrame)
        navigationTitles = "title"
    }
}

let myExemp = GITCViewController(frame: Rect())
print(myExemp.view.frame.height)


//homeWork 17.3
/*
 Ստեղծել struct PhoneNumber անունով (հետևյալ փրոփրտիներով code: String number: String)
 որը պետք է ունենա հետևյալ init-ները`
 - init?(code: String, number: String) code և number չեն կարող լինել դատարկ
 -init?(number: String)  number  չեն կարող լինել դատարկ code = “+374”
 */

struct PhoneNumber {
    var code: String
    var number: String
    
    init?(code: String, number: String) {
        if code.isEmpty || number.isEmpty {
            return nil
        }
        self.code = code
        self.number = number
    }
    
    init?(number: String) {
        if number.isEmpty {
            return nil
        }
        self.init(code: "+374", number: number)
    }
}

let numberObj = PhoneNumber(number: "77937266")

if let numbers = numberObj {
    print("User \(numbers)")
}


//homeWork 17.4
/*
 Ստեղծել Class CallManager անունով (հետևյալ փրոփրտիներով callFrom: PhoneNumber, callTo: PhoneNumber)
 որը պետք է ունենա հետևյալ init-ները`
 - init?(callFrom: PhoneNumber?, callTo: PhoneNumber?) callFrom և callTo չեն կարող լինել nil
 - Init?(callFrom: String, callTo: String) code- ի երկարությունը 4 է,  callFrom և callTo չեն կարող լինել դատարկ
 */

class CallManager {
    var callFrom: PhoneNumber
    var callTo: PhoneNumber

    init?(callFrom: PhoneNumber?, callTo: PhoneNumber?) {
        
        if callFrom == nil && callTo == nil {
            return nil
        }
        self.callFrom = callFrom!
        self.callTo = callTo!
    }
    
    convenience init?(callFrom: String, callTo: String) {
        self.init(callFrom: PhoneNumber(number: "777777"), callTo: PhoneNumber(number: "112358"))
        if callFrom.hasPrefix("+") && callFrom.count == 4 {
            self.callFrom.code = callFrom
        }
    
        if callTo.hasPrefix("+") && callTo.count == 4 {
           self.callTo.code = callTo
        }
    }
}

let exempl = CallManager(callFrom: PhoneNumber(code: "37", number: "344433"), callTo: PhoneNumber(code: "7", number: "990023"))
if let y = exempl {
    print(y.callFrom)
}

let exempl2 = CallManager(callFrom: "+374", callTo: "+3994")

if let x = exempl2 {
    print(x.callFrom)
    print(x.callTo)
}


//homeWork 17.5
/*
 Ստեղծել Enum RequestMethod անունով հետևյալ հավանական արժեքներով post, get, delete
 */
enum RequestMethod {
    case post
    case get
    case delete
}

//homeWork 17.6
/*
 Ստեղծել Class LoadDataFromServer անունով  (հետևյալ փրոփրտիներով requestUrl: String, requestMethod: RequestMethod)
 որը պետք է ունենա հետևյալ init-ները`
 init?(requestUrl: String, requestMethod: RequestMethod)
 */

class LoadDataFromServer {
    var requestUrl: String
    var requestMethod: RequestMethod
    
    init?(requestUrl: String, requestMethod: RequestMethod) {
        self.requestUrl = requestUrl
        self.requestMethod = requestMethod
    }
}

let a = LoadDataFromServer(requestUrl: "ID", requestMethod: RequestMethod.delete)

switch a?.requestMethod {
case .get:
    print("get")
case .delete:
    print("delete")
case .post:
    print("post")
default:
    print("nil")
}
