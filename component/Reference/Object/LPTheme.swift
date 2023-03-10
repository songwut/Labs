//
//  LPTheme.swift
//  learningpath
//
//  Created by Songwut on 30/3/20.
//  Copyright © 2020 conicle. All rights reserved.
//

import UIKit

class LPTheme: NSObject {
    class var shared: LPTheme {
        
        struct Static {
            static let instance: LPTheme = LPTheme()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
    }
    
    
    var pathHeight = 6
    var passPathHeight = 20
    var innerPassPathHeight = 12
    var passInnerPathColor = UIColor(hex: "FEE03E")
    var backgroundColor = UIColor(hex: "0E1C34")
    var mainColor = UIColor(hex: "FF5840")
    var subColor = UIColor(hex: "122847")
    var pathColor = CoColor.whiteColor
    var passPathColor = UIColor(hex: "FF8400")
    var textColor = CoColor.whiteColor
    var subTextColor = UIColor(hex: "B5B7B9")
    var sectionColor = UIColor(hex: "F85459")
    var menuBackgroundColor = UIColor(hex: "#081224")
    var menuBorderColor  = UIColor(hex: "979797")
    
    var sortViewColor = UIColor(hex: "94BDFF")
    
    var sectionImageList = [ImageTheme]()
    var flyImageList = [ImageTheme]()
    
    var backgroundImage = ""
    var userPointImage = ""
    var startPointImage = ""
    var endPointImage = ""
    
    var sectionUrlImagelist = [String]()
    var elementUrlImageList = [String]()
    
    var sectionBgColor  = UIColor(hex: "#54EED3")
    var tertiaryTextColor = UIColor(hex: "#B5B7B9")
    var sectionBoxBgStartColor = UIColor(hex: "b090ff")
    var sectionBoxBgEndColor = UIColor(hex: "#268cff")
    var sectionBoxTextColor = CoColor.whiteColor
    var pointBoxBGStartColor = UIColor(hex: "#ffa882")
    var pointBoxBGEndColor = UIColor(hex: "#b10000")
    var pointBoxTextColor = CoColor.whiteColor
    var activeMenuColor = UIColor(hex: "#FFDE8D")
    var activeMenuBorderColor = UIColor(hex: "#FFDE8D")
    
    var sectionListButtonColor = UIColor(hex: "#EA2427")
    var sectionListButtonBgColor = CoColor.whiteColor
    var sectionListButtonInactiveColor = CoColor.whiteColor
    var overviewBgColor = UIColor(hex: "#081224")
    var overviewMenuBgColor = UIColor(hex: "#122847")
    
    func updatSectionImageList() {
        if self.sectionImageList.count == 0 {
            var l = [ImageTheme]()
            for urlStr in self.sectionUrlImagelist {
                l.append(ImageTheme(url: urlStr))
            }
            if l.count >= 1 {
                self.sectionImageList = l
            }
        }
    }
    
    func resetImageList() {
        self.sectionImageList.removeAll()
        self.flyImageList.removeAll()
    }
    
    func updateFlyImageList() {
        if self.flyImageList.count == 0 {
            var l = [ImageTheme]()
            for urlStr in self.elementUrlImageList {
                l.append(ImageTheme(url: urlStr))
            }
            if l.count >= 1 {
                self.flyImageList = l
            }
        }
    }
    
    func updateConfig(config:LPConfig?) {
        if let c = config {
            LPTheme.shared.sectionListButtonColor = UIColor(hex: c.sectionListButtonColor)
            LPTheme.shared.sectionListButtonBgColor = UIColor(hex: c.sectionListButtonBgColor)
            LPTheme.shared.sectionListButtonInactiveColor = UIColor(hex: c.sectionListButtonInactiveColor)
            LPTheme.shared.overviewBgColor = UIColor(hex: c.overviewBgColor)
            LPTheme.shared.overviewMenuBgColor = UIColor("FAFAFA") //UIColor(hex: c.overviewMenuBgColor)
            
            LPTheme.shared.sectionBgColor = UIColor(hex: c.sectionBgColor)
            LPTheme.shared.tertiaryTextColor = UIColor(hex: c.tertiaryTextColor)
            LPTheme.shared.sectionBoxBgStartColor = UIColor(hex: c.sectionBoxBgStartColor)
            LPTheme.shared.sectionBoxBgEndColor = UIColor(hex: c.sectionBoxBgEndColor)
            LPTheme.shared.sectionBoxTextColor = UIColor(hex: c.sectionBoxTextColor)
            LPTheme.shared.pointBoxBGStartColor = UIColor(hex: c.pointBoxBGStartColor)
            LPTheme.shared.pointBoxBGEndColor = UIColor(hex: c.pointBoxBGEndColor)
            LPTheme.shared.pointBoxTextColor = UIColor(hex: c.pointBoxTextColor)
            LPTheme.shared.activeMenuColor = UIColor(hex: c.activeMenuColor)
            LPTheme.shared.activeMenuBorderColor = UIColor(hex: c.activeMenuBorderColor)
            
            LPTheme.shared.pathHeight = c.pathHeight
            LPTheme.shared.passPathHeight = c.passPathHeight
            LPTheme.shared.innerPassPathHeight = c.innerPassPathHeight
            LPTheme.shared.passInnerPathColor = UIColor(hex: c.passInnerPathColor)
            LPTheme.shared.backgroundColor = UIColor(hex: c.backgroundColor)
            LPTheme.shared.mainColor = UIColor(hex: c.mainColor)
            LPTheme.shared.subColor = UIColor(hex: c.subColor)
            LPTheme.shared.pathColor = UIColor(hex: c.pathColor)
            LPTheme.shared.passPathColor = UIColor(hex: c.passPathColor)
            LPTheme.shared.textColor = UIColor("757575") //UIColor(hex: c.textColor)
            LPTheme.shared.subTextColor = UIColor(hex: c.subTextColor)
            LPTheme.shared.sectionColor = UIColor(hex: c.sectionColor)
            LPTheme.shared.menuBackgroundColor = UIColor(hex: c.menuBackgroundColor)
            LPTheme.shared.menuBorderColor = UIColor(hex: c.menuBorderColor)
            LPTheme.shared.backgroundImage = c.backgroundImage
            LPTheme.shared.userPointImage = c.userPointImage
            LPTheme.shared.startPointImage = c.startPointImage
            LPTheme.shared.endPointImage = c.endPointImage
            LPTheme.shared.sectionUrlImagelist = c.sectionImageList
            LPTheme.shared.elementUrlImageList = c.elementImageList
            
            LPTheme.shared.updatSectionImageList()
            LPTheme.shared.updateFlyImageList()
        }
    }
}

class ImageTheme {
    var name : String = ""
    var url : String = ""
    
    init(name:String) {
        self.name = name
    }
    
    init(url:String) {
        self.url = url
    }
}

