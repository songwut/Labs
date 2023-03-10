//
//  ContinueLearningSwiftUI.swift
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
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}

struct ContinueLearningSwiftUI: View {
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                AdaptiveStack(horizontalAlignment: .leading, verticalAlignment: .center, spacing: 16) {
                    
                    LearnView()
                        .background(Color.blue)
                        .frame(minWidth: UIDevice.isIPad ? 120 : metrics.size.width,
                               minHeight: 120,
                               maxHeight:.infinity
                        )
                        
                    
                    CalendarView()
                        .background(Color.gray)
                        .frame(minWidth: UIDevice.isIPad ? 100 : metrics.size.width
                        )
                    }
            }
            .frame(width: metrics.size.width)
            .background(Color(UIColor.systemGroupedBackground))
        }
        
    }
    
}


struct ContinueLearningSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ContinueLearningSwiftUI()
            .previewLayout(.fixed(width: 320.0, height: 600.0))
        
        ContinueLearningSwiftUI()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
            .previewLayout(.fixed(width: 800.0, height: 600.0))
            
    }
}
