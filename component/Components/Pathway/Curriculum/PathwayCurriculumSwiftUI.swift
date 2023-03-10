//
//  PathwayCurriculumSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct PathwayCurriculumSwiftUI: View {
    @EnvironmentObject private var viewModel: PathwayViewModel
    
    var body: some View {
        VStack {
            curriculumView()
        }
        .background(
            ImageView(url: viewModel.backgroundImageLink,
                      mode: .fill)
        )
        .onAppear(perform: {
            viewModel.managePathwayLearnObject()
        })
    }
    
    @ViewBuilder private func curriculumView() -> some View {
        switch viewModel.pathStyle {
        case .list:
            PathwayPanelSwiftUI()
                .environmentObject(viewModel)
            
        case .path:
            PathwayPathSwiftUI()
                .environmentObject(viewModel)
            
        case .grid:
            PathwayGridSwiftUI()
                .environmentObject(viewModel)
        }
    }
}

struct PathwayCurriculumSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PathwayCurriculumSwiftUI()
            .environmentObject(PathwayViewModel())
    }
}

public struct SectionHeader: ViewModifier {
    var width: CGFloat
    var backgroundColor:Color
    var foregroundColor:Color
    
    public func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], 0)
            .frame(
                width: width,
                height: PathwayStyle.HEADER_HEIGHT,
                alignment: .leading)
            .buttonStyle(PlainButtonStyle())
            //.background(backgroundColor)
            //.foregroundColor(foregroundColor)
        //need to remove (>)
    }
    
}
