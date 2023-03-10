//
//  PanelRowViewSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct PanelRowViewSwiftUI: View {
    @EnvironmentObject private var viewModel: PathwayViewModel
    @State var item = PathwayMock.learnObject
    
    var body: some View {
        contentView
        .frame(height: 60)
        .ignoresSafeArea()
        .contentShape(Rectangle())
        .onTapGesture {
            print("open popup section: \(item.name)")
            viewModel.didOpenPopup?.handler(item)
        }
    }
    
    var contentView: some View {
        VStack {
            HStack(alignment: .center, spacing: 8 ) {
                Image(uiImage: item.icon() ?? UIImage())
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.name)
                        .foregroundColor(.black)
                        .font(.font(12, .regular))
                    
                    if let expireText = item.subText() {
                        Text(expireText)
                            .foregroundColor(.gray)
                            .font(.font(16, .regular))
                    }
                    
                }
                .frame(minHeight: 24, alignment: .center)
                
                Spacer(minLength: 8)
                
                if viewModel.learningPath.isEnrolled {
                    circleProgressView
                        .frame(width: 32, height: 32, alignment: .trailing)
                }
            }
            .padding([.leading, .trailing], 16)
            
        }
        .frame(height: 60)
        .onTapGesture {
            print("open popup section: \(item.name)")
            viewModel.didOpenPopup?.handler(item)
        }
        .ignoresSafeArea()
    }
    
    var circleProgressView: some View {
        CircleProgressSwiftUI(content: item)
    }
}

struct PanelRowView_Previews: PreviewProvider {
    static var previews: some View {
        PanelRowViewSwiftUI()
            .previewLayout(.fixed(width: 320, height: 60))
            
    }
}
