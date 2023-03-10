//
//  Utility.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import Foundation

class Utility {
    class func textCompareDate(start:String, end:String) -> String {
        var text = ""
        let dayStart = formatter.with(dateFormat:"dd", dateString: start)
        let dayEnd = formatter.with(dateFormat:"dd", dateString: end)
        
        let monthStart = formatter.with(dateFormat:"MMM", dateString: start)
        let monthEnd = formatter.with(dateFormat:"MMM", dateString: end)
        
        let yearStart = formatter.withDatetimeUpdate(dateFormat:"yyyy", dateString: start)
        let yearEnd = formatter.withDatetimeUpdate(dateFormat:"yyyy", dateString: end)
        if start == "", end == "" {
            text = ""
        } else if dayStart == dayEnd, monthStart == monthEnd, yearStart == yearEnd {
            text = "\(dayStart) \(monthStart) \(yearStart)"
            
        } else if monthStart == monthEnd, yearStart == yearEnd {
            text = "\(dayStart) - \(dayEnd) \(monthStart) \(yearStart)"
            
        } else if yearStart == yearEnd {
            text = "\(dayStart) \(monthStart) - \(dayEnd) \(monthEnd) \(yearEnd)"
            
        } else {
            text = "\(dayStart) \(monthStart) \(yearStart) - \(dayEnd) \(monthEnd) \(yearEnd)"
        }
        return text
    }
}

