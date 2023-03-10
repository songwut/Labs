//
//  ColorHelper.swift
//  component
//
//  Created by Songwut Maneefun on 19/1/23.
//

import Foundation
import UIKit
import SwiftUI

enum ColorHelper: Int {
    case theme = 0
    case grey = 1
    case black = 2
    case grey112 = 3
    case greyInActiveLabel = 4
    case greyCCD6DD = 5
    case greyA0ADB8 = 6
    case grey808285 = 7
    case green = 8
    case titleText = 9
    
    // Represent full name for font
    func color() -> UIColor {
        var color: UIColor!
        switch self {
        case .theme: color = themeColor
        case .grey: color = UIColor(hex: "999999")
        case .black: color = UIColor.black
        case .grey112: color = UIColor(red: 112, green: 112, blue: 112)
        case .greyInActiveLabel: color = UIColor(red: 160, green: 173, blue: 184)
        case .greyCCD6DD: color = UIColor(red: 204, green: 214, blue: 221)
        case .greyA0ADB8: color = UIColor(red: 160, green: 173, blue: 184)
        case .grey808285: color = UIColor(red: 128, green: 130, blue: 133)
        case .green: color = UIColor(hex: "B2D234")
        case .titleText: color = UIColor.white
        }
        
        assert(color != nil)
        return color
    }
    
    static func hexToRGB(hex: String) -> (r:Float, g:Float, b:Float) {
        assert(hex[hex.startIndex] == "#", "Expected hex string of format #RRGGBB")

        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1  // skip #
        
        var rgb: UInt32 = 0
        scanner.scanHexInt32(&rgb)
        print(rgb)
        
        let r = Float((rgb & 0xFF0000) >> 16)
        let g = Float((rgb & 0xFF00) >> 8)
        let b = Float((rgb & 0xFF))
        return (r, g, b)
    }

    static func getHueFormHex(hex: String) -> Float {
        let r:Float = Float(hexToRGB(hex: hex).r/255)
        let g:Float = Float(hexToRGB(hex: hex).g/255)
        let b:Float = Float(hexToRGB(hex: hex).b/255)
        print("r =\(r), g =\(g), b =\(b)")
        
        let Max:Float = max(r, g, b)
        let Min:Float = min(r, g, b)

       //h 0-360
        var h:Float = 0
        if Max == Min {
            h = 0.0
        }else if Max == r && g >= b {
            h = 60 * (g-b)/(Max-Min)
        } else if Max == r && g < b {
            h = 60 * (g-b)/(Max-Min) + 360
        } else if Max == g {
            h = 60 * (b-r)/(Max-Min) + 120
        } else if Max == b {
            h = 60 * (r-g)/(Max-Min) + 240
        }
        print("h =\(h)")
        
        return h
    }
    
    static func getColor(_ hex: String, shade: ColorShade) -> UIColor {
        let hexStr = hex.trimmingCharacters(in: ["#"])
        
        let shadeValue = shade.getShade()
        let color = UIColor(hexa: hexStr, alpha: 1)
        if let colorHSL = color.hsl {
            let hue = colorHSL.hue
            let saturation = colorHSL.saturation

            return UIColor(hue: hue,
                           saturation: saturation,
                           lightness: shadeValue,
                           alpha: 1)
        } else {
            return color
        }
    }
}

extension Color {
    init(_ hex: String) {
        let uiColor = UIColor(hex)
        self.init(uiColor)
    }
    
    static func base(_ color: BaseColor) -> Color {
        return UIColor(color.getColorHex()).color
    }
    
    static func brand(_ color: BrandColor, _ shade: ColorShade = .shade500) -> Color {
        return ColorHelper.getColor(color.getColorHex(), shade: shade).color
    }
    
    static func semantic(_ color: SemanticColor, _ shade: ColorShade = .shade500) -> Color {
        return ColorHelper.getColor(color.getColorHex(), shade: shade).color
    }
    
    static func neutral(_ color: NeutralColor, _ shade: ColorShade = .shade500) -> Color {
        return ColorHelper.getColor(color.getColorHex(), shade: shade).color
    }
}

extension UIColor {
    
    static func config_primary(_ alpha: CGFloat = 1.0) -> UIColor {
        return primaryColor.withAlphaComponent(alpha)//config-primary-color
    }
    
    static func config_primary_10() -> UIColor {
        return primaryColor.withAlphaComponent(0.1)
    }

    static func config_primary_25() -> UIColor {
       return primaryColor.withAlphaComponent(0.25)
    }

    static func config_primary_50() -> UIColor {
       return primaryColor.withAlphaComponent(0.50)
    }

    static func config_primary_75() -> UIColor {
       return primaryColor.withAlphaComponent(0.75)
    }

    static func config_secondary(_ alpha: CGFloat = 1.0) -> UIColor {
        return secondaryColor.withAlphaComponent(alpha)//config-secondary-color
    }

    static func config_secondary_10() -> UIColor {
       return secondaryColor.withAlphaComponent(0.1)
    }

    static func config_secondary_25() -> UIColor {
       return secondaryColor.withAlphaComponent(0.25)
    }

    static func config_secondary_50() -> UIColor {
       return secondaryColor.withAlphaComponent(0.50)
    }

    static func config_secondary_75() -> UIColor {
       return secondaryColor.withAlphaComponent(0.75)
    }
    
    static func config_green() -> UIColor {
       return greenColor.withAlphaComponent(0.75)
    }
}

extension UIColor {
    /// The SwiftUI color associated with the receiver.
    var color: Color { Color(self) }
    
    static func background() -> UIColor{
        return UIColor("FBFBFB")
    }
    
    static func elementBackground() -> UIColor{
        return UIColor("2F3542")
    }
    
    static func table() -> UIColor{
        return UIColor("F5F5F5")
    }
    
    static func text(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor( "525252").withAlphaComponent(alpha)
    }
    
    static func text75(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor( "7D7D7D").withAlphaComponent(alpha)
    }
    
    static func text50(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor( "A9A9A9").withAlphaComponent(alpha)
    }
    
    static func text25(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor( "D3D3D3").withAlphaComponent(alpha)
    }
    
    static func light(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor( "FFFFFF").withAlphaComponent(alpha)
    }
    
    static func background(_ alpha: CGFloat = 1.0) -> UIColor {
        return UIColor("FBFBFB").withAlphaComponent(alpha)
    }
    
    static func success() -> UIColor {
       return UIColor("00DB85")
    }
    
    static func warning() -> UIColor {
       return UIColor("FFAD00")
    }
    
    static func warningBackground() -> UIColor {
       return UIColor("FFF8E6")
    }

    static func error() -> UIColor {
       return UIColor("EB4852")
    }
    
    static func info() -> UIColor {
       return UIColor("1F75FE")
    }
    
    static func info_10() -> UIColor {
        return info().withAlphaComponent(0.10)
    }
    
    static func info_75() -> UIColor {
        return info().withAlphaComponent(0.75)
    }
    
    static func noti() -> UIColor {
       return UIColor("FF202A")
    }
    
    static func disable() -> UIColor {
       return UIColor("DDDDDD")
    }
    
    static func black() -> UIColor {
       return UIColor( red: (0.0)/255, green: (0.0)/255, blue: (0.0)/255, alpha: (1.00) )
    }
}

extension Color {
    
    static func config_primary(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.config_primary(alpha).color
    }
    
    static func config_primary10() -> Color {
        return UIColor.config_primary_10().color
    }

    static func config_primary25() -> Color {
        return UIColor.config_primary_25().color
    }

    static func config_primary50() -> Color {
        return UIColor.config_primary_50().color
    }

    static func config_primary75() -> Color {
        return UIColor.config_primary_75().color
    }

    static func config_secondary(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.config_secondary(alpha).color
    }

    static func config_secondary10() -> Color {
        return UIColor.config_secondary_10().color
    }

    static func config_secondary25() -> Color {
        return UIColor.config_secondary_25().color
    }

    static func config_secondary50() -> Color {
        return UIColor.config_secondary_50().color
    }

    static func config_secondary75() -> Color {
        return UIColor.config_secondary_75().color
    }
    
    static func background() -> Color {
        return UIColor.background().color
    }
    
    static func elementBackground() -> Color {
        return UIColor.elementBackground().color
    }
    
    static func table() -> Color {
        return UIColor.table().color
    }
    
    static func text(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.text(alpha).color
    }
    
    static func text75(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.text75().color
    }
    
    static func text50(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.text50().color
    }
    
    static func text25(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.text25().color
    }
    
    static func light(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.light(alpha).color
    }
    
    static func background(_ alpha: CGFloat = 1.0) -> Color {
        return UIColor.background(alpha).color
    }
    
    static func success() -> Color {
        return UIColor.success().color
    }
    
    static func warning() -> Color {
        return UIColor.warning().color
    }

    static func error() -> Color {
        return UIColor.error().color
    }
    
    static func info() -> Color {
        return UIColor.info().color
    }
    
    static func info10() -> Color {
        return UIColor.info_10().color
    }
    
    static func info75() -> Color {
        return UIColor.info_75().color
    }
    
    static func noti() -> Color {
        return UIColor.noti().color
    }
    
    static func disable() -> Color {
        return UIColor.disable().color
    }
}

enum ColorShade: Int {
    case shade50
    case shade100
    case shade200
    case shade300
    case shade400
    case shade500
    case shade600
    case shade700
    case shade800
    case shade900
    
    func getPercentL() -> Int {
        switch self {
        case .shade50:
            return 97
        case .shade100:
            return 95
        case .shade200:
            return 89
        case .shade300:
            return 79
        case .shade400:
            return 69
        case .shade500:
            return 59
        case .shade600:
            return 49
        case .shade700:
            return 39
        case .shade800:
            return 29
        case .shade900:
            return 14
        }
    }
    
    func getShade() -> CGFloat {
        switch self {
        case .shade50:
            return 0.97
        case .shade100:
            return 0.95
        case .shade200:
            return 0.89
        case .shade300:
            return 0.79
        case .shade400:
            return 0.69
        case .shade500:
            return 0.59
        case .shade600:
            return 0.49
        case .shade700:
            return 0.39
        case .shade800:
            return 0.29
        case .shade900:
            return 0.14
        }
    }
    
}



enum BrandColor {
    case primary
    case secondary
    case tertiary
    
    func getColorHex() -> String {
        switch self {
        case .primary:
            return primaryColor.hex//real is primaryColorHex
        case .secondary:
            return secondaryColor.hex
        case .tertiary:
            return "#A42EFF"//wait config
        }
    }
}

enum SemanticColor: String {
    case green
    case red
    case yellow
    case orange
    case blue
    case violet
    case pink
    case blueGreen
    
    func getColorHex() -> String {
        switch self {
        case .green:
            return "#009E60"
        case .red:
            return "#FF0712"
        case .yellow:
            return "#FFB400"
        case .orange:
            return "#FF772E"
        case .blue:
            return "#1E75FF"
        case .violet:
            return "#A452F7"
        case .pink:
            return "#FA0053"
        case .blueGreen:
            return "#05F2F2"
        }
    }
}

enum BaseColor: String {
    case white
    case black
    case background
    
    func getColorHex() -> String {
        switch self {
        case .white:
            return "#FFFFFF"
        case .black:
            return "#000000"
        case .background:
            return "#FBFBFB"
        }
    }
}

enum NeutralColor: String {
    case materialGray
    case materialCoolGray
    case cool
    
    func getColorHex() -> String {
        switch self {
        case .cool:
            return "#99A3AD"
        case .materialGray:
            return "#BDBDBD"
        case .materialCoolGray:
            return "#99A3AD"
        }
    }
}

extension UIColor {
    struct HSL: Hashable {

        /// The hue component of the color, in the range [0, 360°].
        var hue: CGFloat
        /// The saturation component of the color, in the range [0, 100%].
        var saturation: CGFloat
        /// The lightness component of the color, in the range [0, 100%].
        var lightness: CGFloat

    }
    
    static func base(_ color: BaseColor) -> UIColor {
        return UIColor(color.getColorHex())
    }
    
    static func brand(_ color: BrandColor, _ shade: ColorShade = .shade500) -> UIColor {
        return ColorHelper.getColor(color.getColorHex(), shade: shade)
    }
    
    static func semantic(_ color: SemanticColor, _ shade: ColorShade = .shade500) -> UIColor {
        return ColorHelper.getColor(color.getColorHex(), shade: shade)
    }
    
    static func neutral(_ color: NeutralColor, _ shade: ColorShade = .shade500) -> UIColor {
        return ColorHelper.getColor(color.getColorHex(), shade: shade)
    }
    
    convenience init(_ hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension StringProtocol {
    subscript(range: Range<Int>) -> SubSequence {
        let start = self.index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
        return self[start..<(self.index(start, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
    }
    var hexaCGFloat: CGFloat { .init(strtoul(String(self), nil, 16)) }
}

extension UIColor {
    var rgb: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }
        return (red, green, blue, alpha)
    }
    var hsb: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)? {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        guard getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return nil
        }
        return (hue, saturation, brightness, alpha)
    }
    
    var hsl: (hue: CGFloat, saturation: CGFloat, lightness: CGFloat, alpha: CGFloat)? {
        guard let rgb = rgb, let hsb = hsb else { return nil }
        let maximum = max(rgb.red, rgb.green, rgb.blue)
        let minimum = min(rgb.red, rgb.green, rgb.blue)
        let range = maximum - minimum
        let lightness = (maximum + minimum) / 2.0
        let saturation = range == 0 ? 0 : range / { return lightness < 0.5 ? lightness * 2 : 2 - (lightness * 2) }()
        return (hsb.hue, saturation, lightness, hsb.alpha)
    }
    
    convenience init(hue: CGFloat, saturation: CGFloat, lightness: CGFloat , alpha: CGFloat) {
        var saturation = saturation
        let lightness = lightness * 2
        saturation *= lightness <= 1 ? lightness : 2 - lightness
        self.init(hue: hue,
                  saturation: lightness == 0 ? 0 : (2 * saturation) / (lightness + saturation),
                  brightness: (lightness+saturation)/2,
                  alpha: 1)
    }
    
    convenience init(hexa: String, alpha: Double) {
        self.init(red:   hexa[0..<2].hexaCGFloat / 255,
                  green: hexa[2..<4].hexaCGFloat / 255,
                  blue:  hexa[4..<6].hexaCGFloat / 255,
                  alpha: .init(alpha))
    }
}
