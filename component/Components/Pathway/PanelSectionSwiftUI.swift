//
//  PanelSectionSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct PanelSectionSwiftUI: View {
    @State var section: SectionSLPResult = PathwayMock.section
    
    let mainColor: Color = PathwayStyle.mainColor.color
    
    var body: some View {
        ZStack {
            contentView
        }
        .frame(height: 60)
        .padding([.leading, .trailing], 8)
        .onTapGesture {
            print("open popup section: \(section.name)")
        }
    }
    
    var contentView: some View {
        HStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .fill(mainColor)
                Text("\(section.num)")
                    .foregroundColor(.white)
                    .font(.font(20, .medium))
            }
            .frame(width: 34, height: 34, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(section.name)
                    .frame(height: 30)
                    .foregroundColor(.black)
                    .font(.font(10, .medium))
                
                Text(section.getDateText())
                    .foregroundColor(.gray)
                    .font(.font(10, .regular))
            }
            
            Spacer()
            
            Button {
                print("expand section: \(section.name)")
            } label: {
                Image(systemName: "chevron.up")
                    .frame(width: 24, height: 24)
                    .foregroundColor(mainColor)
            }
            .frame(width: 24, height: 24, alignment: .trailing)
        }
    }
}

struct PanelSectionView_Previews: PreviewProvider {
    static var previews: some View {
        PanelSectionSwiftUI()
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
