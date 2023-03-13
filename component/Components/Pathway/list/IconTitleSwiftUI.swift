//
//  IconTitleSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import SwiftUI

struct IconTitleSwiftUI: View {
    @State var icon: UIImage?
    @State var title: String
    
    var body: some View {
        VStack {
            HStack(spacing: 4) {
                Image(uiImage: icon ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(UIColor.neutral(.cool).color)
                
                Text(title)
                    .foregroundColor(UIColor.neutral(.cool, .shade900).color)
                    .font(.font(12, .regular))
            }
        }
    }
}

struct IconTitleSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        IconTitleSwiftUI(title: "Company name")
            .previewLayout(.fixed(width: 335, height: 80))
    }
}
