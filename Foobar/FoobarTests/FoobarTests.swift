// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
@testable import Foobar

extension String: Error {
    
}

extension Double {
    func divided(by denominator: Double) throws -> Double { if denominator == 0.0 {
        throw "Oops!"
    }
        return self / denominator
    }
}

class Dog {
    var name = "Rover"
}

class FoobarTests: XCTestCase {
    func testDivideByZero() {
        do {
            let result = try 12.divided(by: 0)
            print(result)
        }
        catch {
            print(error)
        }
    }
    
    func testDivideByZeroAgain() {
        guard let result = try? 12.divided(by: 0) else { return }
        print(result)
    }
    
    func testLifetimeQualifiers() {
        let dog = Dog()
        print(dog.name)
    }
}
