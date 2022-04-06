// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Text("Hello")
                Text("There")
            }
            Text("World")
            Text("Now is the time for all good men")
                .lineLimit(1)
            Image(systemName: "circle.hexagongrid.fill")
                .symbolRenderingMode(.multicolor)
            Spacer()
        }
        .font(.system(size: 50))
//        .padding(60)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue.opacity(0.3))
        .foregroundColor(.white)
        
//        ZStack {
//            LinearGradient(colors: [.blue, .purple, .pink], startPoint: .top, endPoint: .bottom)
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.8)
//            Group {
//                Circle()
//                    .fill(.ultraThinMaterial)
//                Circle()
//                    .stroke(.white, lineWidth: 6)
//            }
//            .padding(50)
//
//            Text("My Text is Nice")
//                .font(.system(size: 30, weight: .bold))
//                .foregroundColor(.white)
//                .shadow(color: .black.opacity(0.5), radius: 7, x: 0, y: 3)
//        }
//        .background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.dark)
//        ContentView()
//            .previewInterfaceOrientation(.landscapeLeft)
    }
}
