//
//  LockPopupSwiftUI.swift
//  LEGO
//
//  Created by Songwut Maneefun on 19/1/23.
//  Copyright © 2023 conicle. All rights reserved.
//

import SwiftUI

struct LockPopupSwiftUI: View {
    
    @State var detail = ""
    @State var buttonText = ""
    @State var buttonBGColor: Color = .red
    
    private let bgColor: Color = UIColor("212121").color
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundColor(bgColor.opacity(0.95))
            VStack(alignment: .center, spacing: 16) {
                
                Image("icon_lock")
                    .frame(width: 40, height: 40, alignment: .center)
                    .foregroundColor(.white)
                
                Text(detail)
                    .foregroundColor(.white)
                
                Button(buttonText.uppercased()) {}
                    .buttonStyle(ButtonFill(color: buttonBGColor))
                    .frame(height: 50, alignment: .center)
                    .cornerRadius(25)
            }
            .frame(maxWidth: 552, alignment: .center)
            .padding([.leading, .trailing], 16)
        }
    }
}

struct LockPopupSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LockPopupSwiftUI(detail: "Content Lock. Please enroll for start learning.",
                             buttonText: "Go to information")
            
            LockPopupSwiftUI(detail: "Content Lock. Please enroll for start learning.",
                             buttonText: "Go to information")
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
    }
}
