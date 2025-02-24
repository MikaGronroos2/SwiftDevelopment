//
//  CounterApp.swift
//  counterApp
//
//  Created by Mika Grönroos on 24.2.2025.
//

import SwiftUI

struct CounterApp: View {
    
    @StateObject private var counter = Counter(lowerBound: 0, upperBound: 15, step: 1)
    @State private var stepInput: String = ""
    
    var body: some View {
        
        VStack{
            Text("This is a simple CounterApp")
            Text("Current count: \(counter.value)")
            Text("Current increment: \(counter.step)")
            TextField("Set how many steps to increase/decrease", text: $stepInput, onCommit: {
                if let step = Int(stepInput) {
                    counter.setStep(step)
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            
            
            HStack {
                Button(action: {
                    counter.increment()
                }) {
                    HStack { Text("Increase") }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                
                Button(action: {
                    counter.decrement()
                }) {
                    HStack { Text("Decrease") }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        
        
        
        
        
    }
}
