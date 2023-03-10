//
//  extension.swift
//  component
//
//  Created by Songwut Maneefun on 17/2/23.
//

import UIKit

extension Double {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:self))
        return formattedNumber ?? String(self)
    }
}

public extension String {
    /**
     Swift 2 friendly localization syntax, replaces NSLocalizedString
     - Returns: The localized string.
     */
    func localized() -> String {
        return self
    }
    
    var dateFromISO8601: Date? {
        return formatsManager.serverDateTime(self)
    }
    
    func dateTimeAgo() -> String {
        let dateStr = formatter.with(dateFormat: "d MMM yyyy, HH:mm", dateString: self)
        if let date = formatter.dateWith(dateString: self) {
            return date.getTimeAgoSinceNow(dateText: dateStr)
        }
        return dateStr
    }
    
    func shorted(to symbols: Int) -> String {
        guard self.count > symbols else {
            return self
        }
        return self.prefix(symbols) + "..."
    }
}
    
    
extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}

extension Float {
    var priority: UILayoutPriority {
        return UILayoutPriority(rawValue: self)
    }
    
    var scoreText: String {
        if self.decimal == 0.0, self == 0.0 {
            return "0"
        } else if self > 0.0  {
            return "\(Int(self))"
        } else {
            return "\(self)"
        }
    }
    
    var decimal:Float {
        return self - floor(self)
    }
    
    var roundInt: Int {
        if self.decimal >= 0.5 {
            return Int(ceil(self))//up
        } else {
            return Int(floor(self))//down
        }
    }
}

extension Double {
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Int {
    
    func shorted() -> String {
        let d = Double(self)
        let thousandNum = d/1000
        let millionNum = d/1000000
        if self >= 1000 && d < 1000000 {
            if(floor(thousandNum) == thousandNum){
                return ("\(Int(thousandNum))k").replacingOccurrences(of: ".0", with: "")
            }
            return("\(thousandNum.roundTo(places: 1))k").replacingOccurrences(of: ".0", with: "")
        }
        if self > 1000000{
            if(floor(millionNum) == millionNum){
                return("\(Int(thousandNum))k").replacingOccurrences(of: ".0", with: "")
            }
            return ("\(millionNum.roundTo(places: 1))M").replacingOccurrences(of: ".0", with: "")
        }
        else{
            if(floor(d) == d){
                return ("\(Int(d))")
            }
            return ("\(d)")
        }
    }
    
    var sec: Int {
        return Int((self % 3600) % 60)
    }
    var dayFromSec: Int {
        return Int(self / 86400)
    }
    
    var minsToSec: Int {
        return self * 60
    }
    
    var minsFromSec: Int {
        return (Int(self % 3600) / 60)
    }
    
    var hoursFromSec: Int {
        return (Int(self % 86400) / 3600)
    }
    
    var seconds: Int {
        return self
    }
    
    var stringFromSec: String {
        
        let sec = self.sec
        let mins = self.minsFromSec
        let hours = self.hoursFromSec
        let day = self.dayFromSec
        //ConsoleLog.show("stringFromSec d\(day) \(hours)h \(mins)m \(sec)s \(seconds)seconds")
        var strList = [String]()
        
        if day >= 1 {
            strList.append(day.textNumber(many: "days"))
        }
        
        if hours >= 1 {
            strList.append(hours.textNumber(many: "hrs"))
        }
        
        if mins >= 1 {
            strList.append(mins.textNumber(many: "mins"))
        }
        
        if sec >= 1 {
            strList.append(sec.textNumber(many: "secs"))
        }
        
        var str = ""
        for text in strList {
            if str == "" {
                str = text
            } else {
                str = str + " " + text
            }
        }
        return str
    }
    
    func isValueInside(unit: String) -> Bool {
        return unit.range(of: "%@") != nil
    }
    
    func textNumber(one:String = "", many:String, noString:String = "") -> String {
        let unit = self.unit(many)
        if self == 0, noString.count > 0 {
            return "\(noString.localized())"
        } else {
            if self.isValueInside(unit: unit) {
                return String(format: "\(unit)", self)// view_unit = %@ View | %@ Views
            } else {
                return "\(self) \(unit)" // view_unit = View | Views
            }
        }
    }
    
    func unit(_ unitString: String) -> String {
        let textArray = unitString.localized().components(separatedBy: " | ")
        if textArray.count == 1 {
            return "\(textArray[0])"
            
        } else if textArray.count == 2 {
            let oneText = textArray[0]
            let manyText = textArray[1]
            if self == 1 {
                return "\(oneText)"
            } else {
                return "\(manyText)"
            }
        } else {
            return "\(unitString.localized())"
        }
    }
    
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formattedNumber = numberFormatter.string(from: NSNumber(value:self))
        return formattedNumber ?? String(self)
    }
}

@IBDesignable

extension UIView {
    func makeRoundCorner(withRadius radius: CGFloat = 4) {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
    
    func makeShadow(offset: CGSize = CGSize(width: 0, height: 2),
                    opacity: Float = 0.2,
                    radius: CGFloat = 4,
                    color: UIColor = UIColor.black) {
        let layer = self.layer
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        clipsToBounds = false
    }
}

extension UIImageView {
    func setImage(_ urlString: String, placeholderImage: UIImage? = CoImage.defaultUserImage, completion: ((_ image: UIImage) -> Void)? = nil) {
        guard let url = URL(string: urlString) else {
            //image = placeholderImage
            return
        }

        //setImage(url, placeholderImage: placeholderImage)

    }
}
