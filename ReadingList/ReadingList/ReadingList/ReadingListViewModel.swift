// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

final class ReadingListViewModel: ObservableObject {
    let store: DataStore
    
    @Published var readingList: ReadingList
    @Published var isEditingTitle = false
    @Published var isAddingBook = false

    init(store: DataStore = DataStore()) {
        self.store = store
        readingList = ReadingList(title: "Empty", books: [])
    }
}

// MARK: Actions
extension ReadingListViewModel {
    
    func loadIfEmpty() {
        guard readingList.books.isEmpty else { return }
        
        do {
            readingList = try store.fetch()
        } catch {
            print("Unable to fetch reading list from store \(store)")
        }
    }
    
    func delete(at indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        readingList.books.remove(at: index)
        save()
    }
    
    func move(from indexSet: IndexSet, to index: Int) {
        readingList.books.move(fromOffsets: indexSet, toOffset: index)
        save()
    }
    
    func addBook(_ book: Book) {
        readingList.books.append(book)
        save()
    }
    
    func update(book: Book) {
        guard let index = readingList.books.firstIndex(where: { $0.id == book.id }) else {
            return
        }
        readingList.books[index] = book
        save()
    }
    
    func save() {
        do {
            try store.save(readingList: readingList)
        } catch {
            print("Couldn't save reading list to store \(store)")
        }
    }
    
    func toggleEditingTitle() {
        isEditingTitle.toggle()
    }
    
    func toggleAddingBook() {
        isAddingBook.toggle()
    }
    
    
}
