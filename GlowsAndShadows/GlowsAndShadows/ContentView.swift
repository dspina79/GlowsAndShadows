//
//  ContentView.swift
//  GlowsAndShadows
//
//  Created by Dave Spina on 3/2/21.
//

import SwiftUI

extension View {
    func glow(color: Color = Color.red, radius: CGFloat = 20) -> some View {
        self
            .overlay(self.blur(radius: radius / 6))
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
    }
}

extension View {
    func rainbowGlow() -> some View {
        ForEach(0..<2) { i in
            Rectangle()
                .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                .frame(width: 300, height: 300)
                .mask(self.blur(radius: 20))
                .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
        }
    }
}

extension View {
    func innerShadow<S: Shape>(using shape: S, angle: Angle = .degrees(0), color: Color = .black, width: CGFloat = 6, blur: CGFloat = 6) -> some View {
        
        let finalX = CGFloat(cos(angle.radians - .pi / 2))
        let finalY = CGFloat(sin(angle.radians - .pi / 2))
        return self
            .overlay(
                shape
                    .stroke(color, lineWidth: width)
                    .offset(x: finalX * width * 0.6, y: finalY * width * 0.6)
                    .blur(radius: blur)
                    .mask(shape)
            )
    }
}


struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .frame(width: 250, height: 250)
                .innerShadow(using: Circle())
            
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .innerShadow(using: Rectangle())
            
//            Text("Elijah")
//                .font(.system(size: 96, weight: .black, design: .rounded))
//                .foregroundColor(.white)
//                .multilineTextAlignment(.center)
//                .frame(width: 300, height: 200)
//                .rainbowGlow()
            
//            Circle()
//                .fill(Color.white)
//                .frame(width: 200, height:200)
//                .glow(color: .blue, radius: 23)
            
                // multiple shaodows increases depth and strength of the overall shadow
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
