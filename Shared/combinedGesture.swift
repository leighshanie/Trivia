//
//  combinedGesture.swift
//  Flashzilla
//
//  Created by Shane Leigh on 07/07/2020.
//

import SwiftUI

struct combinedGesture: View {
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged {value in self.offset =
                value.translation
            }
            .onEnded { _ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
            }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        
        return  Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)    }
}

struct combinedGesture_Previews: PreviewProvider {
    static var previews: some View {
        combinedGesture()
    }
}
