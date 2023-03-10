//
//  MyDashboardSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 17/2/23.
//

import SwiftUI

struct MyDashboardSwiftUI: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ContinueLearningSwiftUI()
                    .frame(height: 230)
                
                SuggestionSwiftUI()
                    .frame(height: 200)
            }

        }
        .background(Color(UIColor.systemGroupedBackground))

    }
}

struct MyDashboardSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        MyDashboardSwiftUI()
            .previewLayout(.fixed(width: 320.0, height: 600.0))
        
        MyDashboardSwiftUI()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
            .previewLayout(.fixed(width: 800.0, height: 600.0))
    }
}
