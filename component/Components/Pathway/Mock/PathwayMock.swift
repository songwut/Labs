//
//  PathwayMock.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import UIKit


struct PathwayStyle {
    static let menuColor: UIColor = .brand(.primary)
    static let HEADER_HEIGHT: CGFloat = 60
    static let PADDING: CGFloat = 24
    static let mainColor: UIColor = LPTheme.shared.mainColor
}

struct PathwayMock {
    static var learnObject: LearnObjectResult = LearnObjectResult(JSON: [:])!
    static let section: SectionSLPResult = SectionSLPResult(JSON: [:])!
    
    static let mockSection1: [LearnObjectResult] = [
        LearnObjectResult(JSON: ["name" : "obj1"])!,
        LearnObjectResult(JSON: ["name" : "obj2"])!,
        LearnObjectResult(JSON: ["name" : "obj3"])!
    ]
    static let mockSection2: [LearnObjectResult] = [
        .init(JSON: ["name" : "obj1"])!,
        .init(JSON: ["name" : "obj2"])!,
        .init(JSON: ["name" : "obj3"])!,
        .init(JSON: ["name" : "obj4"])!,
        .init(JSON: ["name" : "obj5"])!,
        .init(JSON: ["name" : "obj6"])!,
    ]
    static let mockSection3: [LearnObjectResult] = [
        .init(JSON: ["name" : "obj1"])!,
        .init(JSON: ["name" : "obj2"])!,
        .init(JSON: ["name" : "obj3"])!,
        .init(JSON: ["name" : "obj4"])!,
        .init(JSON: ["name" : "obj5"])!,
        .init(JSON: ["name" : "obj6"])!,
    ]

    static var currentMenu: PathwayMenu = PathwayMock.menus.first!
    
    static var menus: [PathwayMenu] = [
        .init(title: "overview",
              icon: UIImage(named: "ic_v2_panel")!,
             index: 0),
        .init(title: "path",
              icon: UIImage(named: "ic_v2_pathway")!,
              index: 1),
        .init(title: "grid",
              icon: UIImage(named: "ic_v2_grid")!,
              index: 2)
    ]
    
    static var playlist: AllFeedV5DataResult {
        return self.homePlaylist[0].data[0]
    }
    
    static var homePlaylist: [AllFeedV5Result] {
        return JSONFile.loadItemList("home_playlist.json")
    }
    
    static var sectionList: [SectionSLPResult] {
        return JSONFile.loadItemList("pathway_list.json")
    }
    
    static var pathwayDetail: LearningPathResult {
        return JSONFile.loadItem("pathway_detail.json")
    }
    
    static var pathwaySectionList: [SectionSLPResult] {
        return JSONFile.loadItemList("pathway_section_list.json")
    }
    
    static var pathwayList: [LearningPathResult] {
        return self.pathwayPage.list
    }
    
    static var pathwayPage: LearningPathPageResult {
        return JSONFile.loadItem("pathway_page.json")
    }
    
    static let backgroundImageLink = "https://lcs.conicle.com/static/back/default/schedule_learning_path/candy_land/CandyLand_Background.png"
    
}
