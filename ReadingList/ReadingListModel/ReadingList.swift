// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

public struct ReadingList: Identifiable, Codable {
    public var id = UUID()
    public var title: String
    public var books: [Book]
    
    public init(title: String, books: [Book]) {
        self.title = title
        self.books = books
    }
}
