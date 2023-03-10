//
//  PathwayHeaderView.swift
//  component
//
//  Created by Songwut Maneefun on 11/3/23.
//

import UIKit
import QuartzCore
import ObjectMapper
import SDWebImage
import SwiftUI

struct PathwayHeaderViewRep: UIViewRepresentable {
    
    typealias UIViewType = PathwayHeaderView
    var frame: CGRect
    var viewModel: PathwayViewModel
    
    func makeUIView(context: Context) -> PathwayHeaderView {
        let view = PathwayHeaderView(frame: frame)
        print("PathwayPathView: \(frame)")
        view.viewModel = viewModel
        return view
    }
    
    func updateUIView(_ uiView: PathwayHeaderView, context: Context) {
        
    }
}

class PathwayHeaderView: UIView {

    var viewModel: PathwayViewModel = PathwayViewModel()
    
    var topViewHeight:CGFloat = 248
}
