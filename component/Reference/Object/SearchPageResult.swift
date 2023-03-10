//
//  SearchPageResult.swift
//  LEGO
//
//  Created by Songwut on 15/1/2561 BE.
//  Copyright © 2561 Conicle. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchFilterResult: ContentTypeResult {
    
    var param = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        id          <- map["content_type_id"]
        name        <- map["content_type_name"]
        code        <- map["content_type_code"]
        param       <- map["params"]
    }
}

class SearchPageResult: PageResult {
    
    //var list = [SearchResult]()
    var searchFilterList = [SearchFilterResult]()
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        //list                   <- map["results"]
        searchFilterList       <- map["filter_list"]
    }
}

class FullTextSearchResult: PageResult {
    
    var contentTypeList = [FullTextSearchFilterResult]()
    //var list = [SearchResult]()
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        contentTypeList     <- map["content_type_results"]
        //list                <- map["results"]
    }
    
}

class FilterItemListResult {
    
    var typeVideo: TypeVideo?
    var idString = ""
    
    init(idString: String, typeVideo: TypeVideo) {
        self.idString = idString
        self.typeVideo = typeVideo
    }
}

//prepare to replace FilterTypeResult with FilterItemResult
class FilterItemResult: FilterTypeResult {
    var isShowCount = false //custom for learning material list
    var tag = 0
    var codedict = ""
    var sort = 0
    var count = 0
    
    var contentCode: ContentCode = .none//UGC already has type "video.externalvideo"
    var typeVideo: TypeVideo? //1 video.video ,2 external_video
    var typeSlp = 0 //0 online ,1 schedule
    func slpName() -> String {
        if self.typeSlp == 1 {
            return "schedule_pathway"
        } else {
            return "duration_pathway"
        }
    }
    
    var subLevel = 1
    var learningContentList: [FilterItemResult]?
    var index = 0
    var parentIndex: Int?
    var childIndexList = [Int]()
    //local variables
    var collapsed = false
    var isSelected = false
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        learningContentList <- map["learning_content_list"]
        contentCode <- map["code"]
        typeSlp     <- map["type"]
        typeVideo   <- map["type"]
        codedict    <- map["code"]
        sort        <- map["sort"]
        count       <- map["count"]
    }
}

class FullTextSearchFilterResult: FilterItemResult {
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
    }
}

class SearchSuggestResult: PageResult {
    
    var phrase = ""
    var type = SectionType.none
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        phrase      <- map["phrase"]
        type        <- map["type"]
    }
}

class SearchSuggestPageResult: BaseResult {
    
    var list = [SearchSuggestResult]()
    var providerList = [SearchSuggestResult]()
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        list            <- map["results"]
        providerList    <- map["provider_results"]
    }
}
