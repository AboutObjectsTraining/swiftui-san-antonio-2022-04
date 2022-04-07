// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest
@testable import ReadingListModel

let encoder: JSONEncoder = {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    return encoder
}()

class ModelTests: XCTestCase {
    
    func testAuthor() throws {
        let author = Author(firstName: "Fred", lastName: "Smith")
        let data = try encoder.encode(author)
        let json = String(data: data, encoding: .utf8)
        print(json!)
    }
    
    func testBook() throws {
        let author = Author(firstName: "Fred", lastName: "Smith")
        let book = Book(title: "Life is Sweet", year: "1999", author: author)
        let data = try encoder.encode(book)
        print(String(data: data, encoding: .utf8)!)
    }
}
