//
//  SectionResult.swift
//  connect
//
//  Created by Songwut Maneefun on 1/12/2560 BE.
//  Copyright © 2560 Conicle. All rights reserved.
//

import UIKit
import ObjectMapper

enum SectionType: String {
    
    //home
    case none = ""
    case forYou = "progress_account"
    case forYouV2 = "progress_account_content_type"
    case banner = "banner" // previous version -> case banner = "highlight"
    case highlight = "highlight"
    case newsUpdate = "news_update"
    case course = "course"
    case courseConicleX = "coniclex"
    case onboard = "onboard"
    case event = "event"//"class"
    case eventProgram = "event_program"
    case survey = "survey"
    case learningPath = "learning_path"
    case slp = "schedule_learning_path"
    case program = "program"
    case instructor = "instructor"
    case test = "exam"//"test"
    case testExam = "test"
    case activity = "activity"
    case publicLearning = "public_learning"
    case publicLearningSource = "public_learning_source"//"public_learning_partner"
    case contentProgram = "content_program"
    
    case provider = "provider" // is learning Center
    case new = "new"
    case live = "live"
    case learningMaterial = "learning_content"
    case learningMaterialConicleX = "learning_content_coniclex"
    case continueLearning = "continue_learning"
    
    case pathway = "pathway"
    case externalTraining = "external_traning"
    
    //explore
    case calendar = "calendar"
    case contentCount = "content"
    case explore = "classification"//"explore"
    case category = "category"
    case publicRequest = "publicRequest"
    case learningProgram = "learning_program"
    case customMenu = "custom_menu"
    case playlist = "playlist"
    
    //explore -> Learning Request
    case requestList = "requestList"
    case requestMaterial = "requestMaterial"
    case requestWaitingForApprove = "requestWaitingForApprove"
    
    func contentColor() -> UIColor {
        return .red
        /*
        switch self {
        case .event:
            return ConfigApp.eventColor
        case .eventProgram:
            return ConfigApp.eventColor
        case .course:
            return ConfigApp.courseColor
        case .survey:
            return ConfigApp.surveyColor
        case .test:
            return ConfigApp.testColor
        case .learningPath:
            return ConfigApp.learningPathColor
        case .onboard:
            return ConfigApp.onboardColor
        case .activity:
            return ConfigApp.activityColor
        case .publicLearning:
            return ConfigApp.publicLearningColor
        default:
            return ConfigApp.programColor
        }
         */
    }
    
    func contentIcon() -> UIImage? {
        var imgName = ""
        switch self {
        case .course:
            imgName = "ic_v2_course"
        case .courseConicleX:
            imgName = "ic_v2_coniclex"
        case .event:
            imgName = "ic_v2_class"
        case .pathway:
            imgName = "pathway_menu"
        case .learningPath:
            imgName = "pathway_menu"
        case .test:
            imgName = "ic_v2_test"
        case .survey:
            imgName = "ic_v2_survey"
        case .onboard:
            imgName = "ic_v2_onboard"
        case .publicLearning:
            imgName = "ic_v2_public_learning"
        case .activity:
            imgName = "ic_v2_activity"
        case .learningProgram:
            imgName = "icLearningProgram"
        case .live:
            imgName = "ic_v2_live"
        case .learningMaterial:
            imgName = "ic_v2_material"
        case .playlist:
            imgName = "ic_v2_learning playlist"
        case .contentProgram:
            imgName = "ic_v2_learning_program"
        default:
            imgName = "ic_v2_course"
        }
        return UIImage(named: imgName)
    }
    
    func contentCountText(count: Int, isConicleX:Bool) -> String {
        if isConicleX, self == .course {
            return count.textNumber(many: "course_coniclex_unit").lowercased()
        } else {
            return self.contentCountText(count: count).lowercased()
        }
    }
    
    func contentCountText(count: Int, isConicleX:Bool, tagType:String?) -> String {
        if isConicleX, self == .course {
            return count.textNumber(many: "course_coniclex_unit").lowercased()
        } else {
            if let text = tagType {
                return count.textNumber(many: "\(text)_unit").lowercased()
            } else {
                return self.contentCountText(count: count).lowercased()
            }
        }
    }
    
    func contentCountText(count: Int) -> String {
        switch self {
        case .eventProgram :
            return count.textNumber(many: "class_program_unit")
        case .course:
            return count.textNumber(many: "course_unit")
        case .event:
            return count.textNumber(many: "class_unit")
        case .survey:
            return count.textNumber(many: "survey_unit")
        case .test:
            return count.textNumber(many: "test_unit")
        case .learningPath:
            return count.textNumber(many: "learning_path_unit")
        case .activity:
            return count.textNumber(many: "activity_unit")
        case .publicLearning:
            return count.textNumber(many: "public_learning_unit")
        case .live:
            return count.textNumber(many: "live_unit")
        case .learningMaterial:
            return count.textNumber(many: "learning_material_unit")
        case .playlist:
            return count.textNumber(many: "learning_playlist_unit")
        default:
            return count.textNumber(many: "content_unit")
        }
    }
    
    func noContentText() -> String {
        switch self {
        case .course:
            return "No course"
        case .event:
            return "No class"
        case .program:
            return "No program"
        case .instructor:
            return "No instructor"
        case .category:
            return "No category"
        case .provider:
            return "No learning center"
        default:
            return "No content"
        }
        
    }
    
    func unitText() -> String {
        switch self {
        case .course:
            return "course(s)"
        case .event:
            return "class(s)"
        case .program:
            return "program(s)"
        case .instructor:
            return "instructor(s)"
        case .category:
            return "category(s)"
        case .provider:
            return "provider(s)"
        default:
            return "content(s)"
        }
    }
    
    func sectionMenus() -> [String] {
        switch self {
        case .course:
            return [String]()
        case .event:
            return ["Class", "Live", "Event"]
        default:
            return [String]()
        }
    }
    
    func backgroundImage() -> UIImage? {
        var imgName = ""
        switch self {
        case .category:
            imgName = "bg-category"
        case .instructor:
            imgName = "bg-instructor"
        case .provider:
            imgName = "bg-provider"
        case .program:
            imgName = "bg-program"
        default:
            imgName = ""
        }
        return UIImage(named: imgName)
    }
    
    func toContentCode(filter: String? = nil) -> ContentCode {
        switch self {
        case .learningMaterial:
            return .learningMaterial
        case .event:
            return .event
        case .eventProgram:
            return .eventProgram
        case .course:
            return .course
        case .live:
            return .live
        case .survey:
            return .survey
        case .test:
            return .test
        case .testExam:
            return .test
        case .learningPath:
            return .learningPath
        case .onboard:
            return .onboard
        case .activity:
            return .activity
        case .publicLearning:
            return .publicLearning
        case .playlist:
            return .playlist
        default:
            return .none
        }
    }
}

enum GroupType: Int {
    case noGroup = -1
    case featured = 0
    case byLevel = 1
    case byCategory = 2
    case viewAll = 3
    case sortByLatest = 4
    case sortByPopular = 5
}

enum HomeApp: String {
    case unknow = ""
    case forYou = "progress_account_content"
    case forYouV2 = "progress_account_content_type"
    case banner = "banner"
    case announcement = "announcement"
    case event = "event"
    case course = "course"
    case survey = "survey"
}

class AppSectionResult: BaseResult {
    var type = HomeApp.unknow
    var contentList = [[String: Any]]()
    var count = 0
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
    }
}
/*
class SectionResult: BaseResult {
    var type = SectionType.none
    var code = ContentCode.event
    var dateText = ""
    var dictList = [[String: Any]]()
    var count = 0
    var contentList = [ContentResult]()
    var isMore = true
    var isAvailable = false
    var seeMoreText = "See more"
    
    var banners = [BannerResult]()
    var sections = [SectionResult]()
    
    var newList = [NewUpdateResult]()
    var liveList = [LiveDetailResult]()
    var learningMaterialList = [LearningMaterialResult]()
    var courses = [CourseResult]()
    var programs = [ProgramResult]()
    var instructors = [InstructorResult]()
    var providers = [ProviderResult]()
    var categories = [CategoryResult]()
    
    var filter = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        isMore              <- map["is_more"]
        courses             <- map["course_list"]
        programs            <- map["program_list"]
        instructors         <- map["tutor_list"]
        providers           <- map["provider_list"]
        categories          <- map["category_list"]
        newList             <- map["new_list"]
        eventList           <- map["event_list"]
        liveList            <- map["live_list"]
        learningMaterialList <- map["learning_content_list"]
        
        code                <- map["content_type.code"]
        type                <- map["app"]
        dictList            <- map["content_list"]
        dateText            <- map["date"]
        count               <- map["count"]
        
        filter              <- map["filter"]
        
        self.manageObjects()
    }
    
    private func manageObjects() {
        
        var objs = [ContentResult]()
        print("type ", self.type.rawValue)
        print("self.dictList ", self.dictList)
        for dict in self.dictList {
            if self.type == .forYou || self.type == .forYouV2 {
                forYou = ContentTypeResult(JSON: ["id" : 99, "name" : "For You", "count": 1, "code": upcommingText])
                
            } else if self.type == .highlight {
                objs.append(BannerResult(JSON: dict)!)
                
            } else if self.type == .newsUpdate {
                objs.append(NewUpdateResult(JSON: dict)!)
                
            } else if self.type == .survey {
                objs.append(SurveyResult(JSON: dict)!)
                
            } else if self.type == .course {
                objs.append(CourseResult(JSON: dict)!)
            
            } else if self.type == .category {
                objs.append(CategoryResult(JSON: dict)!)
                
            } else if self.type == .contentCount {
                let item = ContentTypeResult(JSON: dict)!
                if item.count >= 1 {
                    objs.append(ContentTypeResult(JSON: dict)!)
                }
            } else if self.type == .explore {
                objs.append(ContentTypeResult(JSON: dict)!)
                
            } else if self.type == .customMenu {
                objs.append(ContentTypeResult(JSON: dict)!)
                
            } else if self.type == .calendar {
                objs.append(ContentResult(JSON: dict)!)
                
            } else if self.type == .learningPath {
                objs.append(LearningPathResult(JSON: dict)!)
                
            } else if self.type == .test {
                objs.append(TestResult(JSON: dict)!)
                
            } else if self.type == .activity{
                objs.append(ActivityResult(JSON: dict)!)
                
            } else if self.type == .publicLearning {
                objs.append(PublicLearningResult(JSON: dict)!)
                
            } else if self.type == .event {
                objs.append(EventResult(JSON: dict)!)
                
            } else if self.type == .live {
                objs.append(LiveDetailResult(JSON: dict)!)
                
            } else if self.type == .learningMaterial {
                objs.append(LearningMaterialResult(JSON: dict)!)
            }

            
        }
        ConsoleLog.show("getObjects",objs.count)
        contentList = objs
        self.isAvailable = Bool(contentList.count >= 1)
    }
    
    class func with(_ dict: [String : Any]) -> SectionResult? {
        let item = Mapper<SectionResult>().map(JSON: dict)
        return item
    }
}
 */
