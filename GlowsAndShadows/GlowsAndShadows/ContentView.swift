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


struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 200, height:200)
                .glow(color: .blue, radius: 23)
            
                // multiple shaodows increases depth and strength of the overall shadow
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
