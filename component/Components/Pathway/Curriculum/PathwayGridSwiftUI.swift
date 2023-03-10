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
    
    var body: some View {
        ScrollView {
            Spacer(minLength: 16)
            VStack {
                pathwayMenuView
            }
            .frame(height: PathwayStyle.HEADER_HEIGHT)
            .padding([.leading, .trailing], PathwayStyle.PADDING)
            
            Spacer(minLength: 16)
            
            VStack {
                ScrollGridView
            }
            .padding([.leading, .trailing], PathwayStyle.PADDING)
        }
        .accentColor(mainColor)
        .listStyle(.sidebar)
    }
    
    var pathwayMenuView: some View {
        GeometryReader { geometry in
            PathwayMenuSwiftUI(selection: $viewModel.selection, items: viewModel.menus)
        }
    }
    
    private let columns = UIDevice.isIPhone ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible()) ]
    
    var ScrollGridView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.pathwaySectionList, id: \SectionSLPResult.uuid) { section in
                    Section(header: GridSectionSwiftUI(section: section)) {
                        
                        ForEach(section.list, id:\LearnObjectResult.id) { item in
                            AllFeedItemV5SwiftUI(item: item)
                                .frame(height: 200)
                        }
                    }
                }
            }.padding()
            
            
            
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
