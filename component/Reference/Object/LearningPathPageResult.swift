//
//  LearningPathPageResult.swift
//  LEGO
//
//  Created by Kirameki on 17/7/2561 BE.
//  Copyright © 2561 Conicle. All rights reserved.
//

import Foundation
import ObjectMapper

class LearningPathPageResult: PageResult {
    
    var relatedList = [ContentResult]()
    var list = [LearningPathResult]()
    var tagRalateList = [LearningPathTagList]()
    var contentTypeList = [SearchFilterResult]()
    var filterTypeList = [FilterItemResult]()
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        list             <- map["results"]
        tagRalateList    <- map["tag_relate_list"]
        contentTypeList  <- map["content_type_results"]
        filterTypeList   <- map["filter_content_type"]
        relatedList      <- map["results"]
               
        manageObjects()
    }
}

class LearningPathTagList: BaseResult {
    
    var code = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        code             <- map["code"]
        
    }
}
