//
//  PathwayGridSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 24/2/23.
//

import SwiftUI

struct PathwayGridSwiftUI: View {
    @EnvironmentObject private var viewModel: PathwayViewModel
    
    let mainColor: Color = PathwayStyle.mainColor.color
    
    private let columns = UIDevice.isIPhone ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        VStack {
            scrollGridView
        }
    }
    
    var pathwayMenuView: some View {
        GeometryReader { geometry in
            PathwayMenuSwiftUI(selection: $viewModel.selection, items: viewModel.menus)
        }
    }
    
    var headView: some View {
        VStack {
            Spacer(minLength: 16)
            VStack {
                pathwayMenuView
            }
            .frame(height: PathwayStyle.HEADER_HEIGHT)
            .padding([.leading, .trailing], PathwayStyle.PADDING)
            
            Spacer(minLength: 16)
        }
    }
    
    var scrollGridView: some View {
        GeometryReader { geometry in
            ScrollView {
                
                headView
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.pathwaySectionList, id: \SectionSLPResult.uuid) { section in
                        Section(header: GridSectionSwiftUI(section: section)) {
                            ForEach(section.list, id:\LearnObjectResult.id) { item in
                                let marginBorder: CGFloat = UIDevice.isIPad ? 200 : 90
                                let itemWidth: CGFloat = (geometry.size.width - marginBorder) / CGFloat(columns.count)
                                AllFeedItemV5SwiftUI(item: item,
                                                     code: item.contentTypeCode,
                                                     category: item.content?.categoryCard,
                                                     classProgram: nil,
                                                     point: nil)
                                .frame(
                                    width: itemWidth ,
                                    height: (itemWidth * (9 / 16)) + 184
                                )
                                .padding([.bottom], 24)
                                .onTapGesture {
                                    print("Tapped item \(item.name)")
                                    
                                }
                                
                            }
                        }
                    }
                }.padding([.leading, .trailing], PathwayStyle.PADDING)
            }
        }
    }
}

struct PathwayGridSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PathwayGridSwiftUI()
            .previewDevice("iPhone 12 Pro Max")
            .environmentObject(PathwayViewModel())
    }
}
