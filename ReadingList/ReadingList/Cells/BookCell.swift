// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct BookCell: View {
    let book: Book
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("\(book.title)")
                HStack {
                    Text("\(book.year)")
                    Text("\(book.author.fullName)")
                }
            }
            .layoutPriority(1)
            NavigationLink("") {
                EditBookView(book: book)
                    .navigationTitle("Book Detail")
            }
        }
    }
}

