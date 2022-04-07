// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct KeyPaths: View {
    @State private var keyPath: KeyPath<Person, String>
    
    private let fred = Person(name: "Fred", age: 23)
    private let nameKeyPath = \Person.name
    private let ageKeyPath = \Person.age.description
    
    
    init() {
        keyPath = nameKeyPath
    }
    
    var body: some View {
        Form {
            Text(String(describing: fred[keyPath: keyPath]))
            Button(action: toggle, label: { Text("Toggle") })
        }
    }
    
    func toggle() {
        keyPath = keyPath == nameKeyPath ? ageKeyPath : nameKeyPath
    }
}

struct KeyPaths_Previews: PreviewProvider {
    static var previews: some View {
        KeyPaths()
    }
}
