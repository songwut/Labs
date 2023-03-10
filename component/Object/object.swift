//
//  object.swift
//  component
//
//  Created by Songwut Maneefun on 21/2/23.
//

import Foundation
import ObjectMapper
import UIKit
import SwiftUI

open class DidAction {
    var handler: ((_ sender: Any?) -> Void)!
    
    init(handler: @escaping ((_ sender: Any?) -> Void)) {
        self.handler = handler
    }
}

class BaseResult: Mappable {
    var id = 0
    var idString = ""
    var name = ""
    var title = ""
    var desc = ""
    var image = ""
    var imageURL: URL?
    

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        idString <- map["id"]
        id <- map["id"]
        title <- map["title"]
        name <- map["name"]
        desc <- map["desc"]
        image <- map["image"]
        imageURL <- (map["image"], URLTransform())
    }
}

enum PathStyle:String {
    case list = "overview"
    case path = "path"
    case grid = "grid"
    
    func name() -> String {
        return self.rawValue
    }
    
    func icon() -> UIImage? {
        if self == .path {
            return UIImage(named: "ic_v2_pathway")
        } else if self == .grid {
            return UIImage(named: "ic_v2_grid")
        } else {
            return UIImage(named: "ic_v2_panel")
        }
        
    }
}

class LearnObjectResult: PointObject {
    
    var hasPermission = false
    var section: SectionSLPResult?
    var sectionId = 0 // get section id when getLearningList() call
    var sectionStart = ""
    var code = ""
    var percentRatio:Float = 0
    var progressDict = [String: Any]()
    
    var datetimeExpire: String?

    lazy var statusColor: UIColor = {
        self.progress?.status.statusColor() ?? .gray
    }()

    lazy var progress: ProgressResult? = {
        ProgressResult(JSON: self.progressDict)
    }()
    
    func subText() -> String? {
        if let expireString = datetimeExpire {
            return "expired_on".localized() + " " + formatter.with(dateFormat: "d MMM yyyy",dateString: expireString)
        }
        return nil
    }
    
    lazy var percentText: String = {
        return "\(percentRatio.roundInt)%"
    }()
    
    func icon() -> UIImage? {
        return UIImage(named: "Main_menu")
    }
}

class SectionSLPResult: PointObject {
    var list = [LearnObjectResult]()
    var sort = 1
    var num = 1 //manual calculate
    var collapsed: Bool = false
    var isDisplay: Bool = false
    var datetimeStart = ""
    var datetimeEnd = ""
    var dayLeft = 0
    
    func getDateText() -> String {
        return "3 Feb 2022 - 17 Nov 2022"
    }
    
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        dayLeft           <- map["day_left"]
        name              <- map["name"]
        list              <- map["slot_list"]
        desc              <- map["desc"]
        datetimeStart     <- map["datetime_start"]
        datetimeEnd       <- map["datetime_end"]
        sort              <- map["sort"]
        isDisplay         <- map["is_display"]
    }
}

class MarkObject: PointObject {
    
}

class PointObject: BaseResult, Identifiable {
    let uuid = UUID()
    var isRequired = false
    var index = 0
    var isReady = false
    
}

enum SLPTypeInt: Int {
    case all = -1
    case online = 0
    case schedule = 1
    
    func type() -> SLPType {
        var str = SLPType.online.rawValue
        
        if self == .schedule {
            str = SLPType.schedule.rawValue
            
        }
        return SLPType(rawValue: str) ?? SLPType.online
    }
    
    func scheduleApi() -> String? {
        if self == .schedule {
            return "schedule"
        } else {
            return nil
        }
    }
    
    func name() -> String {
        if self == .online {
            return "duration"
            
        } else if self == .schedule {
            return "schedule"
            
        } else {
            return "all_learning_periods"
        }
    }
}

enum SLPType: String {//use home, home.title
    case schedule = "schedule_learning_path"
    case online = "learning_path"
    //case all = "learning_path"
    //case online = 0
    //case schedule = 1
    
    func scheduleApi() -> String? {
        if self == .schedule {
            return "schedule"
        } else {
            return nil
        }
    }
}

class LearningPathResult: ContentResult {
    var provider: ProviderResult?
    var transaction: TransactionResult?
    var contentType: ContentTypeResult?
    var category: CategoryResult?
    var point: Int = 0
    var typeIcon: UIImage {
        contentType?.code.icon() ?? UIImage()
    }
    
    var typeName: String {
        contentType?.code.name() ?? ""
    }
    
    override func getDateText() -> String {
        if let t = self.transaction, self.slpType == .online {
            if t.datetimeEnd == "" {
                return "no_expiry".localized()
            } else {
                guard let end = formatter.dateWith(dateString: t.datetimeEnd) else { return "" }
                let unitFlags: Set<Calendar.Component> = [.day]
                let components = calendar.dateComponents(unitFlags, from: Date(), to: end)
                let day = components.day ?? 0
                return day.textNumber(many: "days")
                //return "expired_on".localized() + " " + formatter.with(dateFormat: "d MMM yyyy",dateString: t.datetimeEnd)
            }
        } else {
            return super.getDateText()
        }
    }
    
    lazy var timeUnlimitedText: String = {
        if self.datetimeStart == "" , self.datetimeEnd == "" {
            return "no_expiry".localized()
        } else {
            return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
        }
    }()
    
    var isEnrolled: Bool {
        if let transaction = self.transaction {
            return transaction.status == .success || transaction.status == .expired
        } else {
            return false
        }
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        point                   <- map["point"]
        category                <- map["category"]
        provider                <- map["provider"]
        datetimeEnd             <- map["datetime_end"]
        datetimeStart           <- map["datetime_start"]
        contentType             <- map["content_type"]
    }
}

class StatusResult: BaseResult {
    var status:ProgressStatus = ProgressStatus.notStart
    var statusLabel = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        status             <- map["status"]
        statusLabel        <- map["status_label"]
    }
}

class ProgressStepList: BaseResult {
    var step = 0
    var accountApprove: AccountResult?
    var countApprover = 0
    var isAuto = false
    var isApprovable = false
    var status = ProgressStatus.notStart
    var statusLabel = ""
    var message = ""
    var datetimeStart = ""
    var datetimeEnd = ""
    var datetimeComplete = ""

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        step <- map["step"]
        accountApprove <- map["account_approve"]
        countApprover <- map["count_approver"]
        isAuto <- map["is_auto"]
        isApprovable <- map["is_approvable"]
        status <- map["status"]
        statusLabel <- map["status_label"]
        message <- map["message"]
        datetimeStart <- map["datetime_start"]
        datetimeEnd <- map["datetime_end"]
        datetimeComplete <- map["datetime_complete"]
    }
}

class AccountResult: BaseResult {
    var firstName = ""
    var lastName = ""
    var email = ""
    var username = ""
    var codeText = ""
    var position = ""
    var department = ""
    
    var fullName: String {
        return "\(self.firstName) \(self.lastName)"
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        codeText           <- map["code"]//public request
        firstName          <- map["first_name"]
        lastName           <- map["last_name"]
        email              <- map["email"]
        username           <- map["username"]
        position           <- map["position"]
        department         <- map["department"]


    }
}

class TransactionResult: Mappable {
    var id = 0
    var label = ""
    var datetimeStart = ""
    var datetimeEnd = ""
    var datetimeUpdate = ""
    var dayLeft = ""
    var methodLabel: String?
    var status = TransactionStatus.unknow
    
    //var contentType: ContentTypeResult?
    var isExpired = false
    var progress: ProgressResult?
    var progressSnap:  ProgressResult?
    //var form: FormResult?
    var countMaterial = 0
    var countMaterialComplete = 0
    var isActionLog = false
    
    var isAcceptTerm: Bool?
    var isAllowStart = true
    
    var isIdentificationVerify = true
    var isTakePhotoAagin = false
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        progress                <- map["progress"]
        id                      <- map["id"]
        //form                    <- map["form"]
        label                   <- map["status_label"]
        datetimeStart           <- map["datetime_start"]
        datetimeEnd             <- map["datetime_end"]
        dayLeft                 <- map["day_left"]
        //contentType             <- map["content_type"]
        isExpired               <- map["is_expired"]
        progress                <- map["progress"]
        progressSnap            <- map["progress_snap"]
        //status                  <- map["status"]
        methodLabel             <- map["method_label"]
        isAcceptTerm            <- map["is_accept_terms"]
        isAllowStart            <- map["is_allow_start"]
        countMaterial           <- map["count_material"]
        countMaterialComplete   <- map["count_material_complete"]
        isActionLog             <- map["has_action_log"]
        datetimeUpdate          <- map["datetime_update"]
        isIdentificationVerify  <- map["identification_is_verify"]
        isTakePhotoAagin        <- map["is_take_photo_again"]
    }
}

enum TransactionStatus: Int {
    case unknow = 999
    case requestExpired = -6
    case rejected = -3
    case expired = -2
    case cancel = -1
    case success = 0
    case waitingApprove = 1
    case inWaitingList = 2
    case formSubmit = 3
    case formProcess = 4
    case waitingContentRequest = 5
    case completed = 30

    func statusColor() -> UIColor {
        return .blue
        /*
        var color: UIColor!
        switch self {
        case .waitingApprove: color = ConfigApp.progressWaitingApproveColor
        case .completed: color = ConfigApp.progressCompleteColor
        case .rejected: color = ConfigApp.progressRejectColor
        case .expired: color = ConfigApp.progressExpireColor
        case .cancel: color = ConfigApp.progressCancelColor
        case .requestExpired: color = ConfigApp.progressExpireColor
        default: color = UIColor.black
        }

        assert(color != nil)
        return color
        */
    }
}


class ProviderResult: ContentResult {
    var itemCount = 0
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        itemCount      <- map["item_count"]
    }
}

class ProviderFilterResult: BaseResult {
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
}


class ProgressGroup: BaseResult {
    var totalCount = 0
    var todoCount = 0
    var doingCount = 0
    var doneCount = 0
    var suggestionCount = 0

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        suggestionCount <- map["suggestion"]
        totalCount <- map["total"]
        todoCount <- map["to_do"]
        doingCount <- map["doing"]
        doneCount <- map["done"]
    }
}
