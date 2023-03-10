//
//  LPConfig.swift
//  component
//
//  Created by Songwut Maneefun on 27/2/23.
//

import ObjectMapper

class LPConfig: Mappable {
    var pathHeight = 6
    var passPathHeight = 20
    var innerPassPathHeight = 12
    var passInnerPathColor = "FEE03E"
    var backgroundColor = "0E1C34"
    var mainColor = "FF5840"
    var subColor = "122847"
    var pathColor = "ffffff"
    var passPathColor = "FEE03E"
    var textColor = "FFFFFF"
    var subTextColor = "B5B7B9"
    var sectionColor = "F85459"
    var menuBackgroundColor = "081224"
    var menuBorderColor = "979797"
    var backgroundImage = ""
    var userPointImage = ""
    var startPointImage = ""
    var endPointImage = ""
    var sectionImageList = [String]()
    var elementImageList = [String]()

    var sectionBgColor = "#54EED3"
    var tertiaryTextColor = "#B5B7B9"
    var sectionBoxBgStartColor = "b090ff"
    var sectionBoxBgEndColor = "#268cff"
    var sectionBoxTextColor = "#FFFFFF"
    var pointBoxBGStartColor = "#ffa882"
    var pointBoxBGEndColor = "#b10000"
    var pointBoxTextColor = "#FFFFFF"
    var activeMenuColor = "#FFDE8D"
    var activeMenuBorderColor = "#FFDE8D"

    var sectionListButtonColor = "#EA2427"
    var sectionListButtonBgColor = "#FFFFFF"
    var sectionListButtonInactiveColor = "#FFFFFF"
    var overviewBgColor = "#081224"
    var overviewMenuBgColor = "#122847"

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        sectionListButtonColor <- map["section_list_button_color"]
        sectionListButtonBgColor <- map["section_list_button_background_color"]
        sectionListButtonInactiveColor <- map["section_list_button_inactive_color"]
        overviewBgColor <- map["overview_background_color"]
        overviewMenuBgColor <- map["overview_menu_background_color"]

        activeMenuColor <- map["active_menu_color"]
        activeMenuBorderColor <- map["active_menu_border_color"]
        sectionBgColor <- map["section_background_color"]
        tertiaryTextColor <- map["tertiary_text_color"]
        sectionBoxBgStartColor <- map["section_box_background_start_color"]
        sectionBoxBgEndColor <- map["section_box_background_end_color"]
        sectionBoxTextColor <- map["section_box_text_color"]
        pointBoxBGStartColor <- map["point_box_background_start_color"]
        pointBoxBGEndColor <- map["point_box_background_end_color"]
        pointBoxTextColor <- map["point_box_text_color"]

        menuBackgroundColor <- map["menu_background_color"]
        menuBorderColor <- map["menu_border_color"]
        pathHeight <- map["path_height"]
        passPathHeight <- map["pass_path_height"]
        innerPassPathHeight <- map["inner_pass_path_height"]
        passInnerPathColor <- map["pass_inner_path_color"]
        backgroundColor <- map["background_color"]
        mainColor <- map["main_color"]
        subColor <- map["sub_color"]
        pathColor <- map["path_color"]
        passPathColor <- map["pass_path_color"]
        textColor <- map["text_color"]
        subTextColor <- map["sub_text_color"]
        sectionColor <- map["section_color"]
        backgroundImage <- map["background_image"]
        userPointImage <- map["user_point_image"]
        startPointImage <- map["start_point_image"]
        endPointImage <- map["end_point_image"]
        sectionImageList <- map["section_image_list"]
        elementImageList <- map["element_image_list"]
    }

    func with(_ dict: [String: Any]) -> LPConfig? {
        let item = Mapper<LPConfig>().map(JSON: dict)
        return item
    }
}
