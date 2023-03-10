//
//  SuggestionView.swift
//  component
//
//  Created by Songwut Maneefun on 17/2/23.
//

import SwiftUI

struct SuggestionView: View {
    var body: some View {
        VStack {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(16/9, contentMode: .fit)
            Text("Hello, World!")
        }
        
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView()
    }
}
