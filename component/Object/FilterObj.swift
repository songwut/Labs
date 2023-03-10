//
//  FilterObj.swift
//  AISADMISSION
//
//  Created by Songwut Maneefun on 9/7/2559 BE.
//  Copyright © 2559 Build The Dot. All rights reserved.
//

import Foundation
import ObjectMapper

@objc class FilterSectionObj: NSObject, Mappable {
    var param: String?
    var name: String?
    var list: [FilterObj]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        param      <- map["param"]
        name      <- map["name"]
        list    <- map["list"]
    }
    
    @objc class func objectWithDict(_ dict: [String: Any]) -> FilterSectionObj? {
        let item = Mapper<FilterSectionObj>().map(JSON: dict)
        return item
    }
}

@objc class FilterObj: NSObject, Mappable {
    var name: String?
    var value: AnyObject?
    var param = ""
    var isSelected = false
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name      <- map["name"]
        value     <- map["value"]
    }
    
    @objc class func objectWithDict(_ dict: [String: Any]) -> FilterObj? {
        let item = Mapper<FilterObj>().map(JSON: dict)
        return item
    }
}

@objc class FilterParamObj: NSObject {
    var name: String?
    var param: String
    var value: String
    
    init(name: String, param: String, value: String) {
        self.name = name
        self.param = param
        self.value = value
        super.init()
    }
}
