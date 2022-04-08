// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI
import ReadingListModel

struct EditBookView: View {
    @EnvironmentObject var viewModel: ReadingListViewModel
    @State var book: Book
    @State var isEditing = false
    
    var body: some View {
        Form {
            Section("Book") {
                TextFieldCell(text: $book.title,
                              title: "Title",
                              placeholder: "The Tempest",
                              isEditing: isEditing)
                TextFieldCell(text: $book.year,
                              title: "Year",
                              placeholder: "1999",
                              isEditing: isEditing)
            }
            Section("Author") {
                TextFieldCell(text: $book.author.firstName,
                              title: "First Name",
                              placeholder: "William",
                              isEditing: isEditing)
                TextFieldCell(text: $book.author.lastName,
                              title: "Last Name",
                              placeholder: "Shakespeare",
                              isEditing: isEditing)
            }
        }
        .toolbar {
            Button(action: toggleEditing) {
                Text(isEditing ? "Done" : "Edit")
            }
        }
    }
    
    func toggleEditing() {
        withAnimation {
            isEditing.toggle()
        }
        
        if !isEditing {
            viewModel.update(book: book)
        }
    }
}

extension TextField {
    func conditionalTextFieldStyle(editing: Bool) -> some View {
        modifier(ConditionalTextFieldStyle(isEditing: editing))
    }
}

struct ConditionalTextFieldStyle: ViewModifier {
    let isEditing: Bool
    
    func body(content: Content) -> some View {
        if isEditing {
            content
                .textFieldStyle(.roundedBorder)
                .disabled(false)
        } else {
            content
                .textFieldStyle(.plain)
                .disabled(true)
        }
    }
}

struct EditBookView_Previews: PreviewProvider {
    static let book = Book(title: "Foo!",
                           year: "1999",
                           author: Author(firstName: "Fred", lastName: "Jones"))
    
    static var previews: some View {
        EditBookView(book: book)
    }
}
