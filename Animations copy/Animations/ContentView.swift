 //
//  ContentView.swift
//  Animations
//
//  Created by Tausif Qureshi on 2023-02-10.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    @State private var animationAmount2 = 1.0
    
    @State private var animationAmount3 = 0.0
    
    
    
    var body: some View {
        print(animationAmount2)
        
        return VStack {
            VStack {
             
                Spacer()
                Button("Tap Me!") {
                    animationAmount2 += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount2)
                
                Spacer()
            }
            
            VStack{
                Button("Tap Me!") {
                    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                        animationAmount3 += 360
                    }
                }
                .padding(50)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .rotation3DEffect( .degrees(animationAmount3), axis: (x: 2, y: 0, z: 0))
                Spacer()
            }
            
            // implicit animation example
            Button("Tap Me") {
                //            animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear{
                animationAmount = 3
            }
            Spacer()
            // Binding Animations example
            Stepper("Scale Amount", value: $animationAmount2.animation(
                .easeInOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
