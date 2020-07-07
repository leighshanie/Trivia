//
//  ContentView.swift
//  Shared
//
//  Created by Shane Leigh on 07/07/2020.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: -offset * 2.5, height: -offset * 5))
    }
}
struct ContentView: View {
    
    
    @State private var cards = [Card](repeating: Card.example, count: 10)
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    ForEach(0..<cards.count, id:\.self) { index in
                        CardView(card: self.cards[index])
                            .stacked(at: index, in: self.cards.count)
                    }
//                    CardView(card: Card.example)
                }
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
