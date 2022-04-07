// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

struct ReadingList: Identifiable, Codable {
    var id = UUID()
    var title: String
    var books: [Book]
}
