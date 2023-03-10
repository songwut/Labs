//
//  CircleProgressSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct CircleProgressSwiftUI: View {
    @State var content: LearnObjectResult
    
    private let lineWidth: CGFloat = 2.0
    private let strokeColor: UIColor = .neutral(.cool, .shade300)
    private let progressColor: UIColor = .neutral(.cool, .shade600)
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    strokeColor.color ,
                    lineWidth: lineWidth
                )
            Circle()
                .trim(from: 0, to: CGFloat(content.percentRatio))
                .stroke(
                    content.statusColor.color,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .square
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: content.progress)
            Text(content.percentText)
                .font(.font(10, .medium))
                .foregroundColor(progressColor.color)

        }
    }
}

struct CircleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgressSwiftUI(content: PathwayMock.learnObject)
            .previewLayout(.fixed(width: 60, height: 60))
    }
}
