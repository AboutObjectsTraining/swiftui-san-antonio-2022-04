// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolView: View {
    let gradientColors: [Color] = [.orange.opacity(0.4), .orange.opacity(0.2)]
    
    var backgroundGradient: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: .top,
                       endPoint: .bottom)
        .edgesIgnoringSafeArea(.all)
    }
    
    var body: some View {
        ZStack {
            backgroundGradient
            VStack {
                AccessoryView()
                CellContainer()
            }
        }
//        .edgesIgnoringSafeArea(.all)
    }
}

struct CellContainer: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                CoolViewCell(message: "Hello, World! 🌎🌏🌍",
                             backgroundColor: .purple)
                CoolViewCell(message: "Cool View Cells Rock! 🎉🍾",
                             backgroundColor: .orange)
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .topLeading)
            .padding(.top, 40)
            .padding(.leading, 20)
        }
    }
}

struct AccessoryView: View {
    struct Height {
        static let compact: CGFloat = 10
        static let regular: CGFloat = 0
    }
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    @State private var text = ""
    
    private var height: CGFloat {
        verticalSizeClass == .compact ? Height.compact : Height.regular
    }
    
    private var addButtonLabel: some View {
        Image(systemName: "plus.circle")
            .font(.system(size: 35))
            .padding(8)
    }
    
    var body: some View {
        HStack {
            TextField("Enter a label", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(action: addCell, label: { addButtonLabel })
        }
        .padding(.top, height)
        .background(.white.opacity(0.5))
    }
    
    // MARK: Actions
    
    private func addCell() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoolView()
        CoolView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
