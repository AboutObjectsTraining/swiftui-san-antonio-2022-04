// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

public struct Author: Identifiable {
    public var id = UUID()
    public var firstName: String
    public var lastName: String
    
    public var fullName: String {
        switch (firstName, lastName) {
            case ("", ""): return "Unknown"
            case (let name, ""), ("", let name): return name
            default: return "\(firstName) \(lastName)"
        }
    }
    
    public init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }
}

extension Author: Codable {
    
}
