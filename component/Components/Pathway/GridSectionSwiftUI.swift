//
//  GridSectionSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct GridSectionSwiftUI: View {
    @State var section: SectionSLPResult = PathwayMock.section
    let mainColor: Color = PathwayStyle.mainColor.color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.neutral(.cool, .shade300), lineWidth: 1)
                )
            
            ZStack {
                contentView
            }
            .padding([.leading, .trailing], 16)
            .onTapGesture {
                print("open popup section: \(section.name)")
            }
        }
        .frame(height: 60)
    }
    
    var contentView: some View {
        HStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.neutral(.cool, .shade100))
                Text("\(section.num)")
                    .foregroundColor(.black)
                    .font(.font(20, .medium))
            }
            .frame(width: 34, height: 34, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(section.name)
                    .frame(height: 30)
                    .foregroundColor(.black)
                    .font(.font(10, .medium))
                
                Text(section.getDateText())
                    .foregroundColor(.neutral(.cool))
                    .font(.font(10, .regular))
            }
            
            Spacer()
            
            Button {
                print("expand section: \(section.name)")
            } label: {
                Image("ic_info_outline")
                    .frame(width: 24, height: 24)
                    .foregroundColor(.neutral(.cool))
            }
            .frame(width: 24, height: 24, alignment: .trailing)
        }
    }
}

struct GridSectionSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        GridSectionSwiftUI(section: PathwayMock.section)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
