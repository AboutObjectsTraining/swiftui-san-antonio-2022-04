// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct ReadingListView: View {
    @EnvironmentObject var viewModel: ReadingListViewModel
    
    private var emptyView: some View {
        Text("This reading list doesn't have any books yet.")
            .padding(.horizontal, 40)
            .font(.title2.italic())
            .multilineTextAlignment(.center)
    }
    
    private var listOfBooks: some View {
        List {
            ForEach(viewModel.readingList.books) { book in
                BookCell(book: book)
            }
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.readingList.books.isEmpty {
                emptyView
            } else {
                listOfBooks
            }
        }
        .onAppear {
            viewModel.loadIfEmpty()
        }
    }
}

struct BookCell: View {
    let book: Book
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(book.title)")
            HStack {
                Text("\(book.year)")
                Text("\(book.author.fullName)")
            }
        }
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
            .environmentObject(ReadingListViewModel())
    }
}
