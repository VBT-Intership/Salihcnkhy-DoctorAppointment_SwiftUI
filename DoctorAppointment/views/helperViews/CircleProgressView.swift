//
//  CircleProgressView.swift
//  DoctorAppointment
//
//  Created by Salihcan Kahya on 23.07.2020.
//  Copyright © 2020 Salihcan Kahya. All rights reserved.
//

import SwiftUI

struct CircleProgressView: View {
    
    var repeatAnimation : Animation {
        Animation.linear(duration: 1.2).repeatForever(autoreverses: false)}
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(Color.red)
            
            Circle()
                .trim(from: 0.1, to: 0.3)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .opacity(0.9)
                .foregroundColor(Color.red)
            
        }.rotationEffect(Angle(degrees: self.isAnimating ? 360 : 0.0))
            .animation(repeatAnimation)
            .onAppear { self.isAnimating = true }
        
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressView()
    }
}
