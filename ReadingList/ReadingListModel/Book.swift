// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

public struct Book: Identifiable, Codable {
    public var id = UUID()
    public var title: String
    public var year: String
    public var author: Author
    
    public init(title: String = "", year: String = "", author: Author = Author()) {
        self.title = title
        self.year = year
        self.author = author
    }
}
