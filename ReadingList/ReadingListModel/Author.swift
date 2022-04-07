// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

struct Author: Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    
    // TODO: Add custom intializer if needed.
}

extension Author: Codable {
    
}
