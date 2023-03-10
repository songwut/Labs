//
//  AllFeedV5ResponseResult.swift
//  LEGO
//
//  Created by SatangBiiger Jaydeestan on 14/12/2565 BE.
//  Copyright © 2565 BE conicle. All rights reserved.
//

import ObjectMapper
import UIKit

enum AllFeedFilterType: String {
    case lastest = "latest"
    case popular = "popular"
    case ratingReview = "rating_review"
    case editorPick = "editor_pick"
    case point = "point"
    case achievement = "achievement"
    case badge = "badge"
}

class AllFeedV5ResponseResult: BaseResult {
    var requestID = ""
    var status = ""
    var message = ""
    var data: [AllFeedV5Result] = []
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        requestID           <- map["request_id"]
        status              <- map["status_code"]
        message             <- map["message"]
        data                <- map["data"]
    }
    
    class func with(_ dict: [String : Any]) -> AllFeedV5ResponseResult? {
        let item = Mapper<AllFeedV5ResponseResult>().map(JSON: dict)
        return item
    }
}

class AllFeedV5Result: Mappable {
    var filter: AllFeedFilterType = .lastest
    var data: [AllFeedV5DataResult] = []
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        filter               <- map["filter"]
        data                 <- map["data"]
    }
    
    func filterIcon() -> UIImage? {
        if filter == .lastest {
            return UIImage(named: "ic_lastest_v5")
        } else if filter == .popular {
            return UIImage(named: "ic_popular_v5")
        } else if filter == .editorPick {
            return UIImage(named: "ic_editor_v5")
        } else if filter == .ratingReview {
            return UIImage(named: "ic_rating_review_v5")
        } else if filter == .point {
            return UIImage(named: "ic_point_challenge_v5")
        } else if filter == .achievement {
            return UIImage(named: "ic_achievement_v5")
        } else if filter == .badge {
            return UIImage(named: "ic_badge_challenge_v5")
        } else {
            return UIImage(named: "ic_lastest_v5")
        }
    }
}

class AllFeedV5DataResult: Mappable {
    var id: Int = 0
    var name: String = ""
    var desc: String = ""
    var image: String = ""
    var status: String?
    var point: Int = 0
    var datetimeStart: String = ""
    var datetimeEnd: String = ""
    var datetimePublish: String?
    var datetimeUpdate: String?
    var contentType: ContentTypeResult?
    var contentProvider: AllFeedContentProviderResult?
    var category: AllFeedItemResult?
    var classProgram: AllFeedItemResult?
    var price: Int = 0
    var priceDiscount: Int = 0
    var countQuestion: Int?
    var checklist: Int?
    var countSection: Int?
    var countContent: Int?
    var location: String?
    var duration: Int?
    var rating: Int = 0
    var review: Int = 0
    var tag: AllFeedV5TagResult?
    var type: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id                      <- map["id"]
        name                    <- map["name"]
        desc                    <- map["desc"]
        image                   <- map["image"]
        status                  <- map["status"]
        point                   <- map["point"]
        datetimeStart           <- map["datetime_start"]
        datetimeEnd             <- map["datetime_end"]
        datetimePublish         <- map["datetime_publish"]
        contentType             <- map["content_type"]
        contentProvider         <- map["content_provider"]
        category                <- map["category"]
        classProgram            <- map["class_program"]
        price                   <- map["price"]
        priceDiscount           <- map["price_discount"]
        countQuestion           <- map["count_question"]
        checklist               <- map["checklist"]
        location                <- map["location"]
        duration                <- map["duration"]
        rating                  <- map["rating"]
        review                  <- map["review"]
        tag                     <- map["tag"]
        countContent            <- map["count_content"]
        type                    <- map["type"]
        datetimeUpdate          <- map["datetime_update"]
    }
}

class AllFeedV5TagResult: Mappable {
    var name: String = ""
    var more: Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name                    <- map["name"]
        more                    <- map["more"]
    }
}

class AllFeedContentProviderResult: Mappable {
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        image       <- map["image"]
    }
}

class AllFeedItemResult: Mappable {
    var id: Int = 0
    var name: String = ""
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
    }
}
