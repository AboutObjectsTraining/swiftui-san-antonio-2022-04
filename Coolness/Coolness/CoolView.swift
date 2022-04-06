// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolView: View {
    let gradientColors: [Color] = [.orange.opacity(0.4), .orange.opacity(0.2)]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Text("Hello, world!")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding()
                    .background(.purple)
                    .border(.white, width: 3)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoolView()
    }
}
