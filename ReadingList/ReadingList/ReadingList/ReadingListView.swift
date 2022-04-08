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
        NavigationView {
            List {
                ForEach(viewModel.readingList.books) { book in
                    BookCell(book: book)
                }
                .onDelete { indexSet in
                    viewModel.delete(at: indexSet)
                }
                .onMove { from, to in
                    viewModel.move(from: from, to: to)
                }
            }
            .navigationTitle(viewModel.readingList.title)
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addBook, label: { Image(systemName: "plus.circle") })
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: editTitle,
                           label: { Image(systemName: "square.and.pencil") })
                    EditButton()
                }
            }
        }
        .sheet(isPresented: $viewModel.isEditingTitle, content: { EditTitleView() })
        .sheet(isPresented: $viewModel.isAddingBook, content: { AddBookView() })
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

// MARK: - Actions
extension ReadingListView {
    
    func editTitle() {
        viewModel.toggleEditingTitle()
    }
    
    func addBook() {
        viewModel.toggleAddingBook()
    }
}

struct ReadingListView_Previews: PreviewProvider {
    
    static let viewModel = ReadingListViewModel()
    
    static var previews: some View {
        ReadingListView()
            .environmentObject(viewModel)
    }
}
