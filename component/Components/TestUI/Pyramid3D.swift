//
//  Pyramid3D.swift
//  component
//
//  Created by Songwut Maneefun on 4/2/23.
//

import SwiftUI

import SwiftUI

struct Pyramid3D: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        
        return path
    }
}

struct Pyramid3DView: View {
    var body: some View {
        Pyramid3D()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
            .position(x: 200, y: 200)
            .rotation3DEffect(Angle(degrees: 45), axis: (x: 1, y: 1, z: 0))
    }
}

struct Pyramid3DView_Previews: PreviewProvider {
    static var previews: some View {
        Pyramid3DView()
    }
}

