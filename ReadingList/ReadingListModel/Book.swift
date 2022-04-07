// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

struct Book: Identifiable, Codable {
    var id = UUID()
    var title: String
    var year: String
    var author: Author
}
