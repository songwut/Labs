//
//  PathwayPathView.swift
//  LEGO
//
//  Created by Songwut Maneefun on 25/2/23.
//  Copyright © 2023 conicle. All rights reserved.
//

import SwiftUI

struct PathwayPathViewRep: UIViewRepresentable {
    var frame: CGRect
    var viewModel: PathwayViewModel
    
    func makeUIView(context: Context) -> some UIView {
        let view = PathwayPathView(frame: frame)
        view.viewModel = viewModel
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class PathwayPathView: UIView {
    var viewModel: PathwayViewModel = PathwayViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
    }
}

