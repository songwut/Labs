//
//  ContentResult.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import UIKit
import ObjectMapper

enum CreatedFrom: Int {
    case admin = 0
    case creator = 1
}

class ContentResult: BaseResult {
    var createdFrom: CreatedFrom = .admin
    //var owner: OwnerResult?
    var eventProgramCard: ContentResult?
    var countUpcomingEventCard = 0
    var countOngoingEventCard = 0
    var countPastEventCard = 0
    var countContentCard = 0
    //var newStatusCard = LiveNewStatus.notStart
    var datetimeUpdateCard  = ""
    var datetimePublishCard  = ""
    var durationCard = 0
    var providerCard: ProviderResult?
    //var contentPeriodDoingCard: ContentPeriodResult?

    //var categoryCard: CategoryResult?
    var transactionCard: TransactionResult?
    var nameContent: String?
    var slotId = 0
    //var typeVideo: TypeVideo = .video
    //var videoType: TypeVideo = .video
    var slpType:SLPType = SLPType.online
    var typeLearningPath = 0
    //var status = 1
    var linkShare = ""
    var datetimeEnd = "" //2017-10-30T08:00:00+07:00"
    var datetimeStart = "" //2018-01-31T06:00:00+07:00"
    var code = ContentCode.none
    var externalCode = ContentCode.none
    var newCode = ""
    var contentTypeId = 0
    //var contentTypeCode = ContentCode.none
    //var contentTypeExternalCode = ContentCode.none
    var isDependency = false
    var isMessenger = false // course, event, leanringPath
    var contentCount = 0
    //var enrollCondition: EnrollConditionResult?
    //var categoryContentType: ContentTypeResult?
    var contentSource = ""
    var contentLevel: BaseResult?
    var price = 0.0
    var discountPrice = 0.0
    var isPasscode = false
    var durationExpired = 0
    var datetimeExpired: String?
    var label = ""
    var enrollmentRequired = true
    //var instructorListCard: [InstructorResult]?
    var tagListCard = [BaseResult]()  // extra
    var datetimeCreateCard = ""
    var locationCard = ""
    var roomCard = ""
    //var contentPeriodCard: SurveyContentPeriodResult?
    var countItemCard = 0
    var configDatetimeUpdate: String?
    var dictDatetimeUpdate: String?
    var pdfUrl: String?
    var externalMediaId = ""
    var isAllowDownload = false
    var articleContent = ""
    /*
    func itemColor() -> UIColor {
        if typeVideo == .youtube {
            return ConfigApp.externalVideoColor
        }
        return code.getColor() ?? .black
    }
    
    lazy var timeUnlimitedTextCard: String = {
        if let period = self.contentPeriodCard {
            if period.datetimeStart == "" , self.datetimeEnd == "" {
                return unlimitText
            } else {
                return Utility.textCompareDate(start: period.datetimeStart, end: period.datetimeEnd)
            }
        }
        return ""
    }()

    func getDateTextWithContentPeriodCard() -> String {
        if let contentPeriod = self.contentPeriodCard,
            contentPeriod.datetimeStart != "",
            contentPeriod.datetimeEnd != "" {
            return Utility.textFullDatePeriod(start: contentPeriod.datetimeStart, end: contentPeriod.datetimeEnd)
            
        } else {
            return "no_expiry".localized()
        }
    }
    
    func roomTextCard() -> String {
        var roomText = self.roomCard
        if roomText != "" {
            roomText = roomText + ", " + self.locationCard
        } else {
            roomText = self.locationCard
        }
        return roomText
    }
    
    func isAllDependency() -> Bool {
        if self.isDependency {
            return self.isDependency
            
        } else if let enrollCondition = self.enrollCondition {
            return enrollCondition.isDependency
            
        } else {
            return false
        }
    }
    
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
        return unlimitText.localized()
    }
    
    func updateType() {
        self.slpType = typeLearningPath == 0 ? .online : .schedule
    }
    
    var timeText: String {
        if self.datetimeStart == "" , self.datetimeEnd == "" {
            return unlimitText.localized()
        } else {
            return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
        }
    }
    
    var surveyTimeText: String {
        if self.datetimeStart == "" , self.datetimeEnd == "" {
            return unlimitText.localized()
        } else {
            return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
        }
    }
    
    func getPublicLearningDateText() -> String {
        if self.datetimeStart.count > 0, self.datetimeEnd.count > 0 {
            return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
            
        } else if self.datetimeStart.count > 0 {
            return "no_expiry".localized()
            
        } else {
            return ""
        }
    }
     */
    func getLearningPeriod() -> String {
        return Utility.textCompareDate(start: self.datetimeStart, end: self.datetimeEnd)
    }
    
    func isCanExpire() -> Bool {//for SLP
        if self.durationExpired > 0 {
            if let _ = self.datetimeExpired {
                return true
            } else {
                return false
            }
        } else {
            let learningPeriod = self.getLearningPeriod()
            if learningPeriod == "" {
                return false
            } else {
                return true
            }
        }
    }
     
    func getDateText() -> String {//for SLP
        if self.durationExpired > 0 {
            if let datetimeExpired = self.datetimeExpired {
                return "expired_on".localized() + " " + formatter.with(dateFormat: "d MMM yyyy",dateString: datetimeExpired)
            } else {
                return "no_expiry".localized()
            }
        } else {
            let learningPeriod = self.getLearningPeriod()
            if learningPeriod == "" {
                return "no_expiry".localized()
            } else {
                return learningPeriod
            }
        }
    }
    
//    func getContentLabel() -> ContentLabel {
//        let label = ContentLabel(rawValue: self.label)
//        return label ?? ContentLabel.none
//    }

    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        articleContent          <- map["content"]
        externalMediaId         <- map["uuid"]
        pdfUrl                  <- map["url"]
        configDatetimeUpdate    <- map["config_datetime_update"]
        dictDatetimeUpdate      <- map["dict_datetime_update"]
        //owner                   <- map["created_by"]
        createdFrom             <- map["created_from"]
        nameContent             <- map["name_content"]
        countItemCard           <- map["count_item"]
        //contentPeriodCard       <- map["content_period_doing"]
        locationCard            <- map["location"]
        roomCard                <- map["room"]
        eventProgramCard        <- map["event_program"]
        countContentCard        <- map["count_content"]
        countUpcomingEventCard  <- map["count_upcoming"]
        countOngoingEventCard   <- map["count_ongoing"]
        countPastEventCard      <- map["count_past"]
        isAllowDownload         <- map["is_allow_download"]
        datetimeCreateCard      <- map["datetime_create"]
        tagListCard             <- map["tag_list"]
        //newStatusCard           <- map["status"]
        //instructorListCard      <- map["instructor_list"]
        durationCard            <- map["duration"]
        providerCard            <- map["provider"]
        datetimeUpdateCard      <- map["datetime_update"]
        datetimePublishCard     <- map["datetime_publish"]
        //categoryCard            <- map["category"]
        transactionCard         <- map["transaction"]
        slotId                  <- map["slot_id"]
        //videoType               <- map["video_type"]
        //typeVideo               <- map["type"]
        //typeVideo               <- map["content.type"]
        newCode                 <- map["code"]
        datetimeExpired         <- map["datetime_expire"]
        durationExpired         <- map["duration_expire"]
        typeLearningPath        <- map["type_learning_path"]
        id                      <- map["id"]
        name                    <- map["name"]
        image                   <- map["image"]
        imageURL                <- (map["image"], URLTransform())
        linkShare               <- map["link_share"]
        datetimeEnd             <- map["datetime_end"]
        datetimeStart           <- map["datetime_start"]
        isDependency            <- map["is_dependency"]
        isMessenger             <- map["is_messenger"]
        contentTypeId           <- map["content_type.id"]
        //contentTypeCode         <- map["content_type.code"]
        //contentTypeExternalCode <- map["content_type.external_code"]
        //code                    <- map["code"]
        externalCode            <- map["content_type.external_code"]
        contentCount            <- map["count"]
        //enrollCondition         <- map["enroll_condition"]
        //categoryContentType     <- map["content_type"]
        contentSource           <- map["source"]
        contentLevel            <- map["content_level"]
        price                   <- map["price"]
        discountPrice           <- map["discount_price"]
        isPasscode              <- map["is_passcode"]
        label                   <- map["label"]
        enrollmentRequired      <- map["enrollment_required"]
        //externalCode            <- map["external_code"]
        //contentTypeExternalCode <- map["content_type.external_code"]
        
        //self.updateType()
    }
}
