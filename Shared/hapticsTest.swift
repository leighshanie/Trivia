//
//  hapticsTest.swift
//  Trivia
//
//  Created by Shane Leigh on 07/07/2020.
//
// I don't have a working device to test out, whatever...

import CoreHaptics
import SwiftUI

struct hapticsTest: View {
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        Circle()
            .fill(Color.green)
            .frame(width: 64, height: 64)
            .onAppear(perform: prepareHaptics)
            .onTapGesture(perform: complexSuccess)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware()
                .supportsHaptics else {return}
        
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription).")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware()
                .supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }

    
}

struct hapticsTest_Previews: PreviewProvider {
    static var previews: some View {
        hapticsTest()
    }
}
