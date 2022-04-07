// Copyright (C) 2022 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import SwiftUI

struct CoolViewCell: View {
    let message: String
    let backgroundColor: Color
    
    @GestureState private var offsetAmount: CGSize = .zero
    @State private var currentOffset: CGSize = .zero
    
    var border: some View {
        RoundedRectangle(cornerRadius: Constants.radius)
            .stroke(Constants.color, lineWidth: 3)
    }
    
    var drag: some Gesture {
        DragGesture()
            .updating($offsetAmount) { value, state, _ in
                state = value.translation
            }
            .onEnded(updateOffset)
    }
    
    private func updateOffset(gesture: DragGesture.Value) {
        //        DispatchQueue.main.async {
        self.currentOffset = self.currentOffset + gesture.translation
        //        }
    }
    
    var body: some View {
        Text(message)
            .font(.headline)
            .fontWeight(.bold)
            .padding(.vertical, 9)
            .padding(.horizontal, 14)
            .background(backgroundColor)
            .cornerRadius(Constants.radius)
            .shadow(color: .black.opacity(0.3), radius: 7, x: 0, y: 3)
            .foregroundColor(Constants.color)
            .overlay(border)
            .offset(offsetAmount + currentOffset)
            .gesture(drag)
    }
    
    struct Constants {
        static let radius: CGFloat = 10
        static let color: Color = .white
    }
}

extension CGSize {
    static func +(lhs: CGSize, rhs: CGSize) -> CGSize {
        return CGSize(width: lhs.width + rhs.width,
                      height: lhs.height + rhs.height)
    }
}
