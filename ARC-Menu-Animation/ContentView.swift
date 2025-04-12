//
//  ContentView.swift
//  ARC-Menu-Animation
//
//  Created by SAHIL AMRUT AGASHE on 11/04/25.
//

import SwiftUI

struct ContentView: View {
    
    // Initial animation states
    @State private var FABAngle = false
    @State private var iconPosition = false
    
    var body: some View {
        ZStack {
            Text("SwiftUI Arc Menu")
                .font(.largeTitle)
            
            ZStack {
                Circle()
                    .stroke()
                    .frame(width: diameter, height: diameter)
                    .opacity(0)
                
                Image(systemName: "circle.bottomhalf.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 0 : -180))
                    .animation(.easeInOut(duration: 1).delay(0.3), value: iconPosition)
                
                Image(systemName: "circle.dashed.inset.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 30 : -180))
                    .animation(.easeInOut(duration: 1).delay(0.2), value: iconPosition)
                
                Image(systemName: "target")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 60 : -180))
                    .animation(.easeInOut(duration: 1).delay(0.1), value: iconPosition)
                
                Image(systemName: "circle.tophalf.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 90 : -180))
                    .animation(.easeInOut(duration: 1), value: iconPosition)
            }
            .clipShape(Rectangle().offset(x: -20, y: -50))
            .offset(x: 150, y: 335)

            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        // FAB Icon
                        Circle()
                            .frame(width: 56, height: 56)
                            .foregroundStyle(Color(.systemIndigo))
                            .overlay {
                                Image(systemName: "plus")
                                    .rotationEffect(FABAngle ? .degrees(45) : .zero)
                            }
                            .animation(customAnimationWithTimingCurve, value: FABAngle)
                            .shadow(color: .black, radius: 10, x: 1 , y: 1)
                            .onTapGesture {
                                FABAngle.toggle()
                                iconPosition.toggle()
                            }
                        
                    }
                }.padding()
            }
        }// Main Z Stack
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}


private let easeInOutWithCustomDelay: Animation = .easeInOut.delay(0.25)
private let customAnimationWithTimingCurve: Animation = .timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25)
private let diameter: CGFloat = 150
private let radius: CGFloat = diameter / 2
