// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct EditTitleView: View {
    @EnvironmentObject var viewModel: ReadingListViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section("Current Title") {
                    TextField("Title", text: $viewModel.readingList.title)
                }
            }
            .navigationTitle("Edit Title")
            .toolbar {
                Button(action: viewModel.toggleEditingTitle,
                       label: { Text("Done") })
            }
        }
    }
}

