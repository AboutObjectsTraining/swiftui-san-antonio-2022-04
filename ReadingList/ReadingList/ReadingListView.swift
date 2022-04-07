// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ReadingListView: View {
    var body: some View {
        Text("This reading list doesn't have any books yet.")
            .padding(.horizontal, 40)
            .font(.title2.italic())
            .multilineTextAlignment(.center)
    }
}

struct ReadingListView_Previews: PreviewProvider {
    static var previews: some View {
        ReadingListView()
    }
}
