// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct TextFieldCell: View {
    @Binding var text: String
    
    let title: String
    let placeholder: String
    let isEditing: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .padding(.bottom, -4)
                .foregroundColor(.brown.opacity(0.5))
            TextField(placeholder, text: $text)
                .conditionalTextFieldStyle(editing: isEditing)
                .font(.title3)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 8)
        }
        .listRowBackground(Color.brown.opacity(0.1))
    }
}
