//
//  CardView.swift
//  BambiNote
//
//  Created by Heesu Shin on 10/10/2024.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.gray
                .ignoresSafeArea()
            Rectangle()
                .fill(Color.white)
                .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                .rotationEffect(.degrees(8.65))
                .shadow(color: Color(#colorLiteral(red: 0.0470588244497776, green: 0.0470588244497776, blue: 0.05098039284348488, alpha: 0.4000000059604645)), radius:32, x:0, y:16)
                .offset(x: xOffset)
                .rotationEffect(.degrees(degrees))
                .animation(.snappy, value: xOffset )
                .gesture(
                    DragGesture()
                        .onChanged(onDragChanged)
                        .onEnded(onDragEnded)
                )
            }
    }
}
private extension CardView {
    func returnToCenter () {
        xOffset = 0
        degrees = 0
    }
    func swipeRight () {
        xOffset = 500
        degrees = 12
    }
    
    func swipeLeft () {
        xOffset = -500
        degrees = -12
    }
}
private extension CardView {
    func onDragChanged (_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 30)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
        }
        
        if width >= SizeConstants.screenCutoff {
        }
    }
    
    
    #Preview {
        CardView()
    }
}
