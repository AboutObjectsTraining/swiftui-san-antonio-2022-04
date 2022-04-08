// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct AddBookView: View {
    @EnvironmentObject var viewModel: ReadingListViewModel
    @State private var book = Book()
    
    private var form: some View {
        Form {
            Section {
                TextFieldCell(text: $book.title,
                              title: "Title",
                              placeholder: "The Tempest",
                              isEditing: true)
                TextFieldCell(text: $book.year,
                              title: "Year",
                              placeholder: "1999",
                              isEditing: true)
                TextFieldCell(text: $book.author.firstName,
                              title: "First Name",
                              placeholder: "William",
                              isEditing: true)
                TextFieldCell(text: $book.author.lastName,
                              title: "Last Name",
                              placeholder: "Shakespeare",
                              isEditing: true)
                .padding(.bottom, 12)
                
            }
            .listRowSeparator(.hidden)
        }
    }
    
    var body: some View {
        NavigationView {
            form
                .navigationTitle("Add Book")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: cancel, label: { Text("Cancel" )})
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: done, label: { Text("Done") })
                    }
                }
        }
    }
}

extension AddBookView {
    
    func cancel() {
        viewModel.toggleAddingBook()
    }
    
    func done() {
        viewModel.addBook(book)
        viewModel.toggleAddingBook()
    }
}


struct AddBookView_Previews: PreviewProvider {
    
    static let viewModel = ReadingListViewModel()
    
    static var previews: some View {
        AddBookView()
            .environmentObject(viewModel)
    }
}

