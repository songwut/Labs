//
//  Formatter.swift
//  Ondemand
//
//  Created by Songwut Maneefun on 9/15/17.
//  Copyright © 2017 Conicle.Co.,Ltd. All rights reserved.
//

import Foundation

let formatter = FormatterFormats()
let formatsManager = FormatterFormats()

struct DateComponentUnitFormatter {
    
    private struct DateComponentUnitFormat {
        let unit: Calendar.Component
        
        let singularUnit: String
        let pluralUnit: String
        
        let futureSingular: String
        let pastSingular: String
    }
    
    private let formats: [DateComponentUnitFormat] = [
        
//        DateComponentUnitFormat(unit: .year,
//                                singularUnit: "year",
//                                pluralUnit: "years",
//                                futureSingular: "Next year",
//                                pastSingular: "Last year"),
//
//        DateComponentUnitFormat(unit: .month,
//                                singularUnit: "month",
//                                pluralUnit: "months",
//                                futureSingular: "Next month",
//                                pastSingular: "Last month"),
//
//        DateComponentUnitFormat(unit: .weekOfYear,
//                                singularUnit: "week",
//                                pluralUnit: "weeks",
//                                futureSingular: "Next week",
//                                pastSingular: "Last week"),
 
        DateComponentUnitFormat(unit: .day,
                                singularUnit: "day",
                                pluralUnit: "days",
                                futureSingular: "Tomorrow",
                                pastSingular: "Yesterday"),
        
        DateComponentUnitFormat(unit: .hour,
                                singularUnit: "hour",
                                pluralUnit: "hours",
                                futureSingular: "In an hour",
                                pastSingular: "An hour ago"),
        
        DateComponentUnitFormat(unit: .minute,
                                singularUnit: "minute",
                                pluralUnit: "minutes",
                                futureSingular: "In a minute",
                                pastSingular: "A minute ago"),
        
        DateComponentUnitFormat(unit: .second,
                                singularUnit: "second",
                                pluralUnit: "seconds",
                                futureSingular: "Just now",
                                pastSingular: "Just now")
        
        ]
    
    func string(forDateComponents dateComponents: DateComponents, useNumericDates: Bool) -> String {
        for format in self.formats {
            let unitValue: Int
            
            switch format.unit {
//            case .year:
//                unitValue = dateComponents.year ?? 0
//            case .month:
//                unitValue = dateComponents.month ?? 0
//            case .weekOfYear:
//                unitValue = dateComponents.weekOfYear ?? 0
            case .day:
                unitValue = dateComponents.day ?? 0
            case .hour:
                unitValue = dateComponents.hour ?? 0
            case .minute:
                unitValue = dateComponents.minute ?? 0
            case .second:
                unitValue = dateComponents.second ?? 0
            default:
                assertionFailure("Date does not have requried components")
                return ""
            }
            
//            return "\(unitValue) \(format.pluralUnit) ago"
            
            switch unitValue {
            case 2 ..< Int.max:
                return "\(unitValue) \(format.pluralUnit) ago"
            case 1:
                return useNumericDates ? "\(unitValue) \(format.singularUnit) ago" : format.pastSingular
            case -1:
                return useNumericDates ? "In \(-unitValue) \(format.singularUnit)" : format.futureSingular
            case Int.min ..< -1:
                return "In \(-unitValue) \(format.pluralUnit)"
            default:
                break
            }
            
        }
        
        return "Just now"
    }
}

extension Date {
    func getTimeAgoSinceNow(dateText:String, numericDates:Bool = false) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = self < now ? self : now
        let latest =  self > now ? self : now
        
        let unitFlags: Set<Calendar.Component> = [.second, .minute, .hour, .day]
        let components: DateComponents = calendar.dateComponents(unitFlags, from: earliest, to: latest)
        
        var timeAgoText = "just_now".localized()
        
        if let second = components.second {
            if (second >= 20) {
                timeAgoText = second.textNumber(many: "sec_ago_unit".localized())
            }
        }
        
        if let minute = components.minute, minute > 0  {
            timeAgoText = minute.textNumber(many: "min_ago_unit".localized())
        }
        
        if let hour = components.hour, hour > 0 {
            timeAgoText = hour.textNumber(many: "hr_ago_unit".localized())
        }
        
        if let day = components.day, day > 0 {
            if (day >= 7) {
                timeAgoText = dateText
            } else {
                timeAgoText = day.textNumber(many: "day_ago_unit".localized())
            }
        }
        
        return timeAgoText
    }
    
    func timeAgoSinceNow(useNumericDates: Bool = false) -> String {
        let calendar = mainCalendar
        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
        let now = Date()
        let components = calendar.dateComponents(unitFlags, from: self, to: now)
        
        let formatter = DateComponentUnitFormatter()
        return formatter.string(forDateComponents: components, useNumericDates: useNumericDates)
    }
    
    func countMinute(with date: Date) -> Int {
        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.minute], from: date1, to: date2)
        
        return components.minute ?? 0
    }
    
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   == 1 { return "\(years(from: date)) year"   } else if years(from: date)   > 1 { return "\(years(from: date)) years"   }
        if months(from: date)  == 1 { return "\(months(from: date)) month"  } else if months(from: date)  > 1 { return "\(months(from: date)) month"  }
        if weeks(from: date)   == 1 { return "\(weeks(from: date)) week"   } else if weeks(from: date)   > 1 { return "\(weeks(from: date)) weeks"   }
        if days(from: date)    == 1 { return "\(days(from: date)) day"    } else if days(from: date)    > 1 { return "\(days(from: date)) days"    }
        if hours(from: date)   == 1 { return "\(hours(from: date)) hour"   } else if hours(from: date)   > 1 { return "\(hours(from: date)) hours"   }
        if minutes(from: date) == 1 { return "\(minutes(from: date)) minute" } else if minutes(from: date) > 1 { return "\(minutes(from: date)) minutes" }
        return ""
    }
}

class FormatterFormats {
    
    var dateTimeUTC: DateFormatter {
        let dateTimeUTC = DateFormatter()
        dateTimeUTC.calendar = Calendar(identifier: .gregorian)
        dateTimeUTC.locale = Locale(identifier: "en_US")
        dateTimeUTC.timeZone = TimeZone(abbreviation: "UTC")
        return dateTimeUTC
    }
    
    lazy var serverDateTime: DateFormatter = {
        
        var dateTime: DateFormatter = DateFormatter()
        dateTime.calendar = Calendar(identifier: .gregorian)
        dateTime.locale = Locale(identifier: "th_TH")
        dateTime.timeZone = TimeZone(abbreviation: "GMT+7")
        return dateTime
    }()
    
    lazy var dateTime: DateFormatter = {
        var dateTime: DateFormatter = DateFormatter()
        dateTime.timeZone = NSTimeZone.local
        dateTime.locale = Locale.current
        dateTime.calendar = Calendar.current
        return dateTime
    }()
    
    
    class var sharedInstance:FormatterFormats {
        return formatter
    }
    
    func serverDateTime(_ dateString: String) -> Date? {
        //server to device : "GMT+7" -> "UTC"
        //server datetime format multi type need to check
        let type1 = "yyyy-MM-dd" //2018-08-09 // count 10
        let type2 = "yyyy-MM-dd'T'HH:mm:ssZZZ" //"2018-08-09T05:30:00+07:00" count 25
        let type3 = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"// "2018-08-07T14:59:26.086179+07:00" count 32
        let type4 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//2018-08-15T22:30:00Z// Android
        let type5 = "yyyy-MM-dd'T'HH:mm:ssZ" //2018-08-15T22:30:00Z ount 20
        var format = ""
        
        switch dateString.count {
        case 10:
            format = ServerDateTimeFormat.type1.rawValue
        case 20:
            format = ServerDateTimeFormat.type5.rawValue
        case 24:
            format = ServerDateTimeFormat.type4.rawValue
        case 25:
            format = ServerDateTimeFormat.type2.rawValue
        default:
            format = ServerDateTimeFormat.type3.rawValue
        }
        
        serverDateTime.dateFormat = format
        return serverDateTime.date(from: dateString)
    }
    
    func fromDateTime(dateString: String) -> Date? {
        dateTime.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateTime.date(from: dateString)
    }
    
    func with(dateFormat: String, date: Date, dateStyle:DateFormatter.Style? = nil, calendar:Calendar? = nil) -> String {
        if let style = dateStyle {
            dateTime.dateStyle = style
        } else {
            dateTime.dateFormat = dateFormat
        }
        dateTime.locale = Locale(identifier: Localized.shared.language)
        dateTime.calendar = calendar as Calendar? ?? Calendar.current
        
        //dateTime.calendar = mainCalendar
        return dateTime.string(from: date)
    }
    
    func withDatetimeUpdate(dateFormat: String = "yyyy-MM-dd HH:mm:ss", dateString: String) -> String {
        dateTime.timeZone = NSTimeZone.local
        dateTime.locale = Locale(identifier: Localized.currentLanguage())//identifier by app setting
        dateTime.calendar = Calendar(identifier: Localized.currentLanguage() == "th" ? .buddhist : .gregorian)
//        dateTime.calendar = mainCalendar
        dateTime.dateFormat = dateFormat
        if let date = dateString.dateFromISO8601 {
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = ServerDateTimeFormat.type4.rawValue
            return dateTime.string(from: date)
        }
        return dateString
    }
    
    func with(dateFormat: String = "yyyy-MM-dd HH:mm:ss", dateString: String) -> String {
        return withDatetimeUpdate(dateFormat: dateFormat, dateString: dateString)
    }
    
    func withUTC(fromDateFormat: ServerDateTimeFormat = ServerDateTimeFormat.type4, dateFormat: String = "yyyy-MM-dd HH:mm:ss", dateString: String) -> String {
        let dateTimeUTC = self.dateTimeUTC
        dateTimeUTC.dateFormat = fromDateFormat.rawValue
        if let date = dateTimeUTC.date(from: dateString) {
            dateTimeUTC.dateFormat = dateFormat
            return dateTimeUTC.string(from: date)
        }
        
        return dateString
    }
    
    func withUCTToLocal(fromDateFormat: ServerDateTimeFormat = ServerDateTimeFormat.type4, dateFormat: String = "yyyy-MM-dd HH:mm:ss", dateString: String) -> String {
        let dateTimeUTC = self.dateTimeUTC
        dateTimeUTC.dateFormat = fromDateFormat.rawValue
        if let date = dateTimeUTC.date(from: dateString) {
            if Localized.shared.language == "th" {
                dateTimeUTC.calendar = Calendar(identifier: .buddhist)
            }
            dateTimeUTC.locale = Locale(identifier: Localized.currentLanguage())
            dateTimeUTC.timeZone = TimeZone.current
            dateTimeUTC.dateFormat = dateFormat
            return dateTimeUTC.string(from: date)
        }
        
        return dateString
    }
    
    func date(format: String = "d MMM yyyy", dateString: String) -> Date? {
        
        if let date = dateString.dateFromISO8601 {
            return date
        }
        return nil
    }
    
    func dateWith(dateFormat: String = "yyyy-MM-dd HH:mm:ss", dateString: String) -> Date? {

        if let date = dateString.dateFromISO8601 {
            return date
        }
        return nil
    }
    
    func with(style: DateFormatter.Style = .medium, isoDateString: String) -> String {
        
        if let date = isoDateString.dateFromISO8601 {
            dateTime.dateStyle = style
            return dateTime.string(from: date)
        }
        return isoDateString
    }
    
    func timeAgowith(_ dateString: String) -> String {
        if let date = dateString.dateFromISO8601 {
            return date.timeAgoSinceNow()
        }
        return dateString
    }
    
    
    
    init() {
        //dateTime.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //let gregorianCalendar = Calendar(identifier: .gregorian)
        //dateTime.calendar = gregorianCalendar
        //dateTime.timeZone = TimeZone(identifier: "UTC")
        
        let gregorianCalendar = Calendar(identifier: .gregorian)
        dateTime.calendar = gregorianCalendar
        dateTime.timeZone = gregorianCalendar.timeZone //TimeZone(identifier: "BE")
    }
    
}

enum ServerDateTimeFormat: String {
    case type1 = "yyyy-MM-dd" //2018-08-09 // count 10
    case type2 = "yyyy-MM-dd'T'HH:mm:ssZZZ" //"2018-08-09T05:30:00+07:00" count 25
    case type3 = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"// "2018-08-07T14:59:26.086179+07:00" count 32
    case type4 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//2018-08-15T22:30:00Z// Android
    case type5 = "yyyy-MM-dd'T'HH:mm:ssZ" //2018-08-15T22:30:00Z ount 20
    
    static func checkFormatterTypeFrom(dateString: String) -> ServerDateTimeFormat {
        if isFormatterTypeFrom(dateString, type: .type1) {
            return .type1
        } else if isFormatterTypeFrom(dateString, type: .type2) {
            return .type2
        } else if isFormatterTypeFrom(dateString, type: .type3) {
            return .type3
        } else if isFormatterTypeFrom(dateString, type: .type4) {
            return .type4
        } else if isFormatterTypeFrom(dateString, type: .type5) {
            return .type5
        }
        return .type4
    }
    
    private static func isFormatterTypeFrom(_ dateString: String, type: ServerDateTimeFormat) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = type.rawValue
        if let _ = dateFormatter.date(from: dateString) {
            return true
        }
        return false
    }
}
