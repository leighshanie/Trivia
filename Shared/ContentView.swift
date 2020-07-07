//
//  ContentView.swift
//  Shared
//
//  Created by Shane Leigh on 07/07/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)

    
    var body: some View {
        
        VStack {

            combinedGesture()

            Text("Double Tap")
                .onTapGesture(count: 2) {
                    print("Double tapped!")
                }
                .padding()

            Text("Long press")
                .onLongPressGesture(minimumDuration: 2) {
                    print("Long pressed!")
                }
                .background(Color.black)
                .foregroundColor(.white)
                .padding()

            Text("Magnification Gesture!")
                .scaleEffect(finalAmount + currentAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { amount in
                            self.currentAmount = amount
                        }
                        .onEnded { amount in
                            self.finalAmount += self.currentAmount
                            self.currentAmount = 0
                        }
                )
                .padding()

            Text("Rotation Gesture!")
                .rotationEffect(finalAngle + currentAngle)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            self.currentAngle = angle
                        }
                        .onEnded { angle in
                            self.finalAngle += self.currentAngle
                            self.currentAngle = .degrees(0)
                        }
                )
                .padding()


        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
