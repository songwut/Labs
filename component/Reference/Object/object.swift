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

class LearnObjectResult: PointObject { // MaterialResult Course, Class, Test .....
    var slotId: Int?
    var subType: ContentCode = ContentCode.none
    var hasPermission = false
    var section: SectionSLPResult?
    var sectionId = 0 // get section id when getLearningList() call
    var sectionStart = ""
    var code = ""
    var type: ContentCode = ContentCode.none
    var progressDict = [String: Any]()
    var isRequirePermission = false
    var isDependency = false
    //var permissions = [PermissionObj]()
    //var dependencies: [MaterialContentResult]?
    var content: MaterialContentResult?
    var batch: String?
    var datetimeEnd = "" // 2017-10-30T08:00:00+07:00"
    var datetimeStart = "" // 2018-01-31T06:00:00+07:00"
    var eventProgram: MaterialContentResult?
    var contentTypeCode = ContentCode.none
    var typeVideo: TypeVideo = .video
    var progressSnap: ProgressResult?
    var progressCard: ProgressResult?
    var datetimeExpire: String?
    var durationExpire = 0
    var price: Int?
    var discountPrice: Int?
    
    var dateFlagText: String? {
        let code = contentTypeCode
        switch code {
        case .liveIn, .liveEx, .classIn, .classEx, .classProgram, .eventProgram:
            if !datetimeStart.isEmpty {
                return datetimeStart
            } else {
                return nil
            }
        default:
            return nil
        }
    }
    
    var isLock: Bool {
        if isDependency || self.hasPermission == false {
            return true
        }
        return false
    }
    
    func dayLeft() -> String? {
        guard let expireString = datetimeExpire else { return nil }
        if let dateExpire = formatter.dateWith(dateString: expireString) {
            return dateExpire.days(from: Date()).textDays + " \("left".localized())"
        }
        return nil
    }

    func subText() -> String? {
        if let expireString = datetimeExpire {
            return "expired_on".localized() + " " + formatter.with(dateFormat: "d MMM yyyy",dateString: expireString)
        }
        return nil
    }
    /*
    func manageDependency() {
        if let d = dependencies {
            let list = d.filter({ m -> Bool in
                m.progress?.status == .completed
            })
            isDependency = !(list.count == d.count)
        } else {
            isDependency = false
        }
    }

    func contentColor() -> UIColor? {
        if type == .eventProgram {
            if let _ = selectedEvent {
                return type.getColor()
            } else {
                return CoColor.grayColor
            }
        } else {
            return type.getColor()
        }
    }
*/
    func icon() -> UIImage? {
        return type.icon()
    }
    
    lazy var percentRatio: Float = {
        if let progress = self.progress {
            return progress.percent / 100
        }
        return 0.0
    }()

    lazy var percentText: String = {
        if let progress = self.progress {
            return "\(progress.percent.roundInt)%"
        } else {
            return "0%"
        }
    }()

    lazy var typeText: String? = {
        self.type.rawValue.localized()
    }()

    lazy var statusColor: UIColor = {
        self.progress?.status.statusColor() ?? .gray
    }()

    lazy var progress: ProgressResult? = {
        ProgressResult(JSON: self.progressDict)
    }()

    override func mapping(map: Map) {
        super.mapping(map: map)
        price                   <- map["price"]
        discountPrice           <- map["discount_price"]
        durationExpire <- map["content.duration_expire"]
        datetimeExpire <- map["content.datetime_expire"]
        eventProgram <- map["content.event_program"]
        //eventList <- map["content.event_list"]
        batch <- map["batch"]
        content <- map["content"]
        slotId <- map["id"]
        id <- map["content.id"]
        code <- map["content.code"]
        image <- map["content.image"]
        progressDict <- map["progress"]
        progressCard <- map["progress"]
        progressSnap <- map["progress_snap"]
        type <- map["content.content_type.code"]
        //dependencies <- map["dependency_list"]
        //permissions <- map["permission_list"]
        hasPermission <- map["content.has_permission"]
        subType <- map["content.content_type.code_sub"]
        datetimeEnd <- map["datetime_end"]
        datetimeStart <- map["datetime_start"]
        contentTypeCode <- map["content.content_type.code"]
        typeVideo <- map["content.type"]
        isRequired <- map["is_required"]
        //manageDependency()
    }
}

class MaterialContentResult: BaseResult {
    var provider: ProviderResult?
    //var eventListCard = [EventResult]()
    var datetimeUpdateCard  = ""
    var datetimePublishCard  = ""
    var durationCard = 0
    var providerCard: ProviderResult?
    var typeVideo: TypeVideo = .video
    var categoryContentType: ContentTypeResult?
    var contentPeriodDoingCard: ContentPeriodResult?

    var label = ""
    var categoryCard: CategoryResult?
    var contentTypeCode = ContentCode.none
    var url: String?
    var duration = "00:00:00"
    var content: ContentResult?
    var contentLocation: ContentResult?
    var progress: ProgressResult?
    var datetimeStart = ""
    var datetimeEnd = ""
    var code = ContentCode.none
    var type = 0
    var surveyType: Int?
    var surveyTypeDisplay: String?
    var uuid: String?
    
    func periodDisplayCard(transaction: TransactionResult?, format: String = "d MMM yyyy, HH:mm") -> String {
        
        if let t = transaction {
            if t.datetimeEnd == "" {
                return unlimitText.localized()
            } else {
                let expireText = formatter.with(dateFormat: format, dateString: t.datetimeEnd)
                return "expired_on".localized() + " " + expireText
            }
        } else {
            if let periodDoing = self.contentPeriodDoingCard {
                if periodDoing.typeExpire == .schedule {
                    return Utility.textCompareDate(start: periodDoing.datetimeStart, end: periodDoing.datetimeEnd)
                    
                } else if periodDoing.typeExpire == .duration {
                    if let t = transaction,
                        let start = formatter.dateWith(dateString: t.datetimeStart) {
                        var expireText = formatter.with(dateFormat: format, dateString: t.datetimeStart)
                        if periodDoing.duration > 0 {
                            let moreTime = start.addingTimeInterval(TimeInterval(periodDoing.duration.seconds))
                            expireText = formatter.with(dateFormat: format, date: moreTime)
                        }
                        return "expired_on".localized() + " " + expireText
                    } else {
                        return "\(periodDoing.duration.textDays) \("of_testing_period".localized())"
                        //return "expired_date".localized() + " : " + "after" + periodDoing.duration.stringFromSec
                    }
                } else if periodDoing.typeExpire == .noExpiry {
                    return unlimitText.localized()
                }
            }
        }
        return ""
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        provider                <- map["content_type"]
        contentPeriodDoingCard
        //eventListCard           <- map["event_list"]
        categoryContentType     <- map["content_type"]
        durationCard            <- map["duration"]
        providerCard            <- map["provider"]
        datetimeUpdateCard      <- map["datetime_update"]
        datetimePublishCard     <- map["datetime_publish"]
        typeVideo               <- map["type"]
        typeVideo               <- map["content.type"]
        label                   <- map["label"]
        categoryCard            <- map["category"]
        contentTypeCode         <- map["content_type.code"]
        contentLocation         <- map["content_location"]
        datetimeStart           <- map["datetime_start"]
        datetimeEnd             <- map["datetime_end"]
        url                     <- map["url"]
        duration                <- map["duration"]
        content                 <- map["content"]
        progress                <- map["progress"]
        type                    <- map["type"]
        uuid                    <- map["uuid"]
        surveyType              <- map["survey_type"]
        surveyTypeDisplay       <- map["survey_type_display"]
        
    }
}

class SectionSLPResult: PointObject {
    var list = [LearnObjectResult]()
    var sort = 1
    var num = 1 //manual calculate
    var collapsed: Bool = false
    @State var isExpanded: Bool = true
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
    var imageFinish: UIImage?

    override func mapping(map: Map) {
        super.mapping(map: map)
    }
}

class PointObject: BaseResult, Identifiable {
    let uuid = UUID()
    var pointStatus: ProgressStatus = ProgressStatus.notStart
    var isRequired = false
    var index = 0
    var isReady = false
    
    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
    }
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

class LearningPathResult: ContentResult, Identifiable {
    let uuid = UUID()
    var provider: ProviderResult?
    var transaction: TransactionResult?
    var contentType: ContentTypeResult?
    var category: CategoryResult?
    var point: Int?
    var sectionCount: Int?
    var materialCount: Int = 0
    var typeIcon: UIImage {
        contentType?.code.icon() ?? UIImage()
    }
    
    
    var materialCountText: String {
        materialCount.textNumber(many: "contents")
    }
    
    var sectionCountText: String? {
        sectionCount?.textNumber(many: "sections")
    }
    
    var typeName: String {
        contentType?.code.name() ?? ""
    }
    
    override func getDateText() -> String {
        let calendar = Calendar(identifier: .gregorian)
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
        materialCount           <- map["material_count"]
        sectionCount            <- map["section_count"]
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

enum PeriodType: Int {
    case noExpiry = 0
    case schedule = 1
    case duration = 2
}

class ContentPeriodResult: BaseResult {
    var datetimeActive = ""
    var datetimeStart = ""
    var datetimeEnd = ""
    var typeExpire = PeriodType.noExpiry
    var typeExpireLabel = ""
    var duration = 0 // sec
    var isActive = false

    lazy var timeText: String = {
        if self.datetimeStart == "", self.datetimeEnd == "" {
            return unlimitText
        } else {
            return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
        }
    }()

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        datetimeStart <- map["datetime_start"]
        datetimeEnd <- map["datetime_end"]
        typeExpireLabel <- map["type_expire_label"]
        duration <- map["duration"]
        isActive <- map["is_active"]
        typeExpire <- map["type_expire"]

        datetimeActive <- map["datetime_active"]
    }
}
