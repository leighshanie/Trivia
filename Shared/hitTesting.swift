//
//  hitTesting.swift
//  Trivia
//
//  Created by Shane Leigh on 07/07/2020.
//

import SwiftUI

struct hitTesting: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped")
                    }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Circle tapped")
                    }
                    .allowsHitTesting(false)
                
            }
            
            VStack {
                Text("Tappable")
                Spacer().frame(height: 100)
                Text("Tappeable")
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("Tapped")
            }
            
            Spacer()
        }
        
        
    }
}

struct hitTesting_Previews: PreviewProvider {
    static var previews: some View {
        hitTesting()
    }
}
