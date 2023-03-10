//
//  PaperView.swift
//  component
//
//  Created by Songwut Maneefun on 4/2/23.
//

import SwiftUI

struct PaperView: View {
    @State private var animate = false

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                var triangle = Path()
                triangle.move(to: CGPoint(x: -50, y: 50))
                triangle.addLine(to: CGPoint(x: 50, y: 50))
                triangle.addLine(to: CGPoint(x: 0, y: -50))
                triangle.addLine(to: CGPoint(x: -50, y: 50))
                path.addPath(triangle)
            }
            .rotationEffect(.degrees(45))
            .foregroundColor(.blue)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            //.animation(.easeInOut(duration: 2))
            .onAppear {
                self.animate.toggle()
            }
        }
    }
}


struct PaperView_Previews: PreviewProvider {
    static var previews: some View {
        PaperView()
    }
}
