// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

@main
struct ReadingListApp: App {
    @StateObject var viewModel = ReadingListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ReadingListView()
                .environmentObject(viewModel)
        }
    }
}
