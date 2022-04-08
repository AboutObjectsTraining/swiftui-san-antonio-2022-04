// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

final class ReadingListViewModel: ObservableObject {
    let store: DataStore
    
    @Published var readingList: ReadingList
    
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
    }
    
    func move(from indexSet: IndexSet, to index: Int) {
        readingList.books.move(fromOffsets: indexSet, toOffset: index)
    }
}
