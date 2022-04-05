// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest

func fooey() {
    print("Hey")
}

struct Point {
    var x: Double
    var y: Double
    let pointsPerPixel: Double
    
    var bar: String {
        return "Bar"
    }
    
    init(x: Double = 0.0, y: Double = 0.0, pointsPerPixel: Double = 2.0) {
        self.x = x
        self.y = y
        self.pointsPerPixel = pointsPerPixel
    }
    
    func foo() -> String {
        return "Foo"
    }
}

class UnitTests: XCTestCase {
    
    func testSomethingElse() {
        let p1 = Point(x: 1, y: 2)
//        let pi = Point(y: 3)
        
        print(p1.foo())
        print(p1.bar)
//        p1.bar = ""
    }
    
    func testStuff() {
        let x = 12
        var y = x
        y += 2
        print(x)
        print(y)
    }
    
    func testSomething() {
        print("Hello!")
        XCTAssertTrue(1 == 1)
    }
}
