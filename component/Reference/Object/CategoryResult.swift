//
//  CategoryResult.swift
//  AISADMISSION
//
//  Created by Songwut Maneefun on 7/27/2559 BE.
//  Copyright © 2559 Build The Dot. All rights reserved.
//

import Foundation
import ObjectMapper

class CategoryResult: ContentResult, Identifiable {
   
    var count = 0
    var new: Int?
    var sort = 0
    var childList = [CategoryResult]()
    var isAll = false
    var subList = [CategoryResult]()
    var allCategory: CategoryResult?
    
    
    //UGC UI option
    var isChecked: Bool = false
    var isExpaned: Bool = false
        /*
    class func createAll(category:CategoryResult?) -> CategoryResult {
        var id = 0
        var name = ParamType.category.allName()
        if let c = category {
            id = c.id
            name = c.name
        }
        
        return CategoryResult.with(["id": id, "name": name, "is_all": true])!
    }
    
    func manageSubList() {
        self.subList.removeAll()
        if self.childList.count >= 1 {
            self.subList.append(CategoryResult.createAll(category: self))
            for item in self.childList {
                self.subList.append(item)
            }
            
        }
    }
    */
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        
        count           <- map["count"]
        new             <- map["new"]
        childList       <- map["child_list"]
        isAll           <- map["is_all"]
        //self.manageSubList()
    }
    
    class func with(_ dict: [String : Any]) -> CategoryResult? {
        let item = Mapper<CategoryResult>().map(JSON: dict)
        return item
    }
}
