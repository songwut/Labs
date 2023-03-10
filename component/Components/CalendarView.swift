//
//  CalendarView.swift
//  component
//
//  Created by Songwut Maneefun on 17/2/23.
//

import SwiftUI

private struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        Group {
            if sizeClass == .compact {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
                
            } else {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct CalendarView: View {
    var body: some View {
        ScrollView(.horizontal) {
            AdaptiveStack {
                // 1
                Text("First Row")
                    .padding()

                    .background(Color.white)

                    .cornerRadius(8)
                    .frame(width: .infinity)

                Text("Second Row")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .frame(width: .infinity)
                Text("Third Row")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .frame(width: .infinity)
            }
            // 2
            .padding()

        }
        // 3
        .background(Color(UIColor.systemGroupedBackground))

    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
