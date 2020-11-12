//
//  ContentView.swift
//  Connect4
//
//  Created by Golden Thumb on 2020-11-11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Conn4Board()
                .fill(Color.white)
            
            Conn4Board()
                .stroke(Color.black, lineWidth: 2)
            
            Conn4Grid()
                .stroke(Color.gray)
        }
    }
}

struct Conn4Board: Shape {
    func path(in rect: CGRect) -> Path {
        let cellWidth: CGFloat = rect.width / 7
        let cellHeight: CGFloat = rect.height / 6
        let radiusRatio: CGFloat = 0.4
        let radius: CGFloat = cellWidth > cellHeight ? radiusRatio * cellHeight : radiusRatio * cellWidth
        
        var path = Path()
        
        for col in 0..<7 {
            for row in 0..<6 {
                let centerX: CGFloat = 0.5 * cellWidth + CGFloat(col) * cellWidth
                let centerY: CGFloat = 0.5 * cellHeight + CGFloat(row) * cellHeight
                
                path.move(to: CGPoint(x: centerX + radius, y: centerY))
                path.addArc(center: CGPoint(x: centerX, y: centerY), radius: radius, startAngle: .radians(0), endAngle: .radians(2 * Double.pi), clockwise: false)
            }
        }

        return path
    }
}

struct Conn4Grid: Shape {
    func path(in rect: CGRect) -> Path {
        let cellWidth: CGFloat = rect.width / 7
        let cellHeight: CGFloat = rect.height / 6
        
        var path = Path()
        
        for row in 1...5 {
            path.move(to: CGPoint(x: 0, y: CGFloat(row) * cellHeight))
            path.addLine(to: CGPoint(x: rect.width, y: CGFloat(row) * cellHeight))
        }
        
        for col in 1...6 {
            path.move(to: CGPoint(x: CGFloat(col) * cellWidth, y: 0))
            path.addLine(to: CGPoint(x: CGFloat(col) * cellWidth, y: rect.height))
        }
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
