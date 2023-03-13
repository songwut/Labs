//
//  DateFlagSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 11/3/23.
//

import SwiftUI

struct DateFlagSwiftUI: View {
    @State var dateString: String
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.semantic(.pink))
                    .shadow(radius: 3)
                
                VStack(alignment: .center, spacing: 0) {
                    Text(formatter.with(dateFormat: "d", dateString: dateString))
                        .font(.font(16, .bold))
                        .foregroundColor(.white)
                    
                    Text(formatter.with(dateFormat: "MMM", dateString: dateString))
                        .font(.font(12, .bold))
                        .foregroundColor(.white)
                }
                
            }
            
        }
    }
    
}

struct DateFlagSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        DateFlagSwiftUI(dateString: "2023-03-08T00:00:00+07:00")
            .previewLayout(.fixed(width: 46, height: 47))
    }
}
