//
//  Bi-DirectionalArcMenu.swift
//  ARC-Menu-Animation
//
//  Created by SAHIL AMRUT AGASHE on 12/04/25.
//

import SwiftUI

struct BiDirectionalArcMenuAnimationView: View {
    
    // Initial animation states
    @State private var FABAngle = false
    @State private var iconPosition = false
    
    var body: some View {
        ZStack {
            Text("FAB Bi-Directional ARC Menu")
                .font(.largeTitle)
            
            ZStack {
                // Hidden motion path
                Circle()
                    .stroke()
                    .frame(width: diameter, height: diameter)
                    .opacity(0)
                
                Image(systemName: "circle.bottomhalf.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 0 : -90))
                    .animation(.easeInOut(duration: 1).delay(0.3), value: iconPosition)
                
                Image(systemName: "circle.dashed.inset.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 30 : -90))
                    .animation(.easeInOut(duration: 1).delay(0.2), value: iconPosition)
                
                Image(systemName: "target")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 60 : -90))
                    .animation(.easeInOut(duration: 1).delay(0.1), value: iconPosition)
                
                Image(systemName: "circle.tophalf.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 90 : -90))
                    .animation(.easeInOut(duration: 1), value: iconPosition)
                
                // From right
                Image(systemName: "circle.dashed.inset.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 120 : 250))
                    .animation(.easeInOut(duration: 1).delay(0.1), value: iconPosition)
                
                Image(systemName: "target")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 150 : 250))
                    .animation(.easeInOut(duration: 1).delay(0.2), value: iconPosition)
                
                Image(systemName: "circle.tophalf.fill")
                    .font(.title)
                    .offset(x: -radius)
                    .rotationEffect(.degrees(iconPosition ? 180 : 250))
                    .animation(.easeInOut(duration: 1).delay(0.3), value: iconPosition)
                
            }
            .frame(width: 300, height: 200, alignment: .center)
            .foregroundStyle(.red)
            .clipShape(Rectangle().offset(x: -20, y: -80))
            .offset(x: -5, y: 335)

            VStack {
                Spacer()
                HStack {
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
    BiDirectionalArcMenuAnimationView()
}

private let easeInOutWithCustomDelay: Animation = .easeInOut.delay(0.25)
private let customAnimationWithTimingCurve: Animation = .timingCurve(0.68, -0.6, 0.32, 1.6).delay(0.25)
private let diameter: CGFloat = 150
private let radius: CGFloat = diameter / 2
