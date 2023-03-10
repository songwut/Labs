//
//  CircularProgressBar.swift
//  component
//
//  Created by Songwut Maneefun on 21/2/23.
//

import SwiftUI

struct CircularProgressBar: View {
    @Binding var progress: CGFloat
    @Binding var progress2: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 24.0)
                .opacity(0.3)
                .foregroundColor(.blue)

            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: 0.0))
            /*
            Circle()
                .trim(from: 0.0, to: min(progress2, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 0.0))
            
            */
            Text(String(format: "%.0f%%", min(progress, 1.0) * 100.0))
                .font(.largeTitle)
                .bold()
        }
    }
}

struct CircularProgressView: View {
    @State var progressValue: CGFloat = 0.1
    @State var progressValue2: CGFloat = 0.5

    var body: some View {
        VStack {
            CircularProgressBar(progress: $progressValue,
                                progress2: $progressValue2)
                .frame(width: 150.0, height: 150.0)
                .padding(32.0)
            Spacer()
        }
    }
}


struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView()
    }
}
