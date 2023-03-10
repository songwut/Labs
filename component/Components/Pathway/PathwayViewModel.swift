//
//  PathwayViewModel.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import Combine
import SwiftUI

class PathwayViewModel: ObservableObject {
    @Published var selection: Int = 0
    @Published var topViewHeight: CGFloat = 136
    
    var menus: [PathwayMenu] = PathwayMock.menus
    var pathwaySectionList : [SectionSLPResult] = PathwayMock.pathwaySectionList
    var backgroundImageLink = PathwayMock.backgroundImageLink
    
    var didOpenPopup: DidAction?
    var didOpenProgressLog: DidAction?
    
    private let bubbleW: CGFloat = 80
    let objectPerColumn = DeviceID.isiPhone ? 1 : 3
    let marginH:CGFloat = 80 / 2
    let distanceY:CGFloat = DeviceID.isiPhone ? 155 : 100
    
    var itemList = [Any]()
    
    func managePathwayLearnObject() {
    }
    
    
    
    lazy var pathObjectHeight: CGFloat = {
        let rowFloat = CGFloat(itemList.count) / CGFloat(objectPerColumn)
        let row = Int(rowFloat.rounded(.up))
        let pathHeight = CGFloat(row) * CGFloat(distanceY)
        print("getPathHeight: \(pathHeight)")
        return pathHeight + 50
    }()
    
    var pathStyle: PathStyle {
        if selection == 1 {
            return .path
        } else if selection == 2 {
            return .grid
        }
        return .list
    }
    
    var learningPath: LearningPathResult = PathwayMock.pathwayDetail
    
}
