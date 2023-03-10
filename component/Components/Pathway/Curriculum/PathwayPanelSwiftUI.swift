//
//  PathwayPanelSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct PathwayPanelSwiftUI: View {
    @EnvironmentObject private var viewModel: PathwayViewModel
    let mainColor: Color = PathwayStyle.mainColor.color
    
    init() {
       UITableView.appearance().separatorStyle = .none
       UITableViewCell.appearance().backgroundColor = .clear
       UITableView.appearance().backgroundColor = .clear
    }
    var body: some View {
        ScrollView {
            Spacer(minLength: 16)
            contentList
        }
    }
    
    var contentList: some View {
        LazyVStack(alignment: .leading, spacing: 8) {
            //use with scrollview "DisclosureGroupNew"
            VStack {
                pathwayMenuView
            }
            .frame(height: PathwayStyle.HEADER_HEIGHT)
            .padding([.leading, .trailing], PathwayStyle.PADDING)
            
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("overview".localized())
                        .frame(height: 60)
                        .foregroundColor(mainColor)
                        .font(.font(18, .medium))
                    
                    ForEach(viewModel.pathwaySectionList, id: \SectionSLPResult.uuid) { section in
                        Section(header: PanelSectionSwiftUI(section: section)) {
                            ForEach(section.list, id:\LearnObjectResult.id) { item in
                                PanelRowViewSwiftUI(item: item)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding()
                
            }
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
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
}


struct PathwayPanelSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PathwayPanelSwiftUI()
            .previewDevice("iPhone 12 Pro Max")
            .environmentObject(PathwayViewModel())
    }
}
