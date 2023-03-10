//
//  SuggestionSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 17/2/23.
//

import SwiftUI

struct SuggestionSwiftUI: View {
    var body: some View {
        
        ScrollView(.horizontal) {
            VStack (alignment: .leading) {
                HStack {
                    Text("Suggestions")
                        .fontWeight(.semibold)
                        .font(Font.system(size:20))
                    Image(systemName: "chevron.right.circle")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyHStack {
                SuggestionView()
                
                SuggestionView()
                
                SuggestionView()
            }
            
        }
        .padding()
        .background(Color(UIColor.systemGroupedBackground))

    }
}

struct SuggestionSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionSwiftUI()
    }
}
