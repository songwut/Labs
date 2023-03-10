//
//  PathwayPathSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 24/2/23.
//

import SwiftUI

struct PathwayPathSwiftUI: View {
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
                pathVCRep()
            }
            .frame(height: viewModel.pathObjectHeight)
            .padding([.leading, .trailing], 16)
            
            
        }
    }
    
    @ViewBuilder private func pathVCRep() -> some View {
        GeometryReader { geometry in
            let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: viewModel.pathObjectHeight)
            
            VStack(spacing: 0, content: {
                PathwayPathViewRep(
                    frame: frame,
                    viewModel: viewModel)
                //PathViewControllerRep(pathwayVM: viewModel)
            })
            .background(Color.clear)
        }
    }
    
    var pathwayMenuView: some View {
        GeometryReader { geometry in
            PathwayMenuSwiftUI(selection: $viewModel.selection, items: viewModel.menus)
        }
    }
}

struct PathwayPathSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PathwayPathSwiftUI()
            .previewDevice("iPhone 12 Pro Max")
            .environmentObject(PathwayViewModel())
    }
}
