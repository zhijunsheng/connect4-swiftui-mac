//
//  ContentView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Conn4Board()
            .stroke()
    }
}

struct Conn4Board: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: 50, y: 50), radius: 50, startAngle: .radians(0), endAngle: .radians(2 * Double.pi), clockwise: false)
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
