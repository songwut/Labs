//
//  TriangleView.swift
//  component
//
//  Created by Songwut Maneefun on 4/2/23.
//

import SwiftUI

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct TriangleView: View {
    var body: some View {
        VStack {
            Triangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .position(x: 0, y: 0)
        }
        .background(Color.gray.opacity(0.5))
        
    }
}

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}

