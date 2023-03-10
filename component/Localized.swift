//
//  Localized.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import UIKit
let LCLDefaultLanguage = "th"
let LCLLanguageEnglish = "en"

class Localized: NSObject {
    internal class var shared: Localized {
        struct Static {
            static let instance: Localized = Localized()
        }
        return Static.instance
    }

    var dict: [String: Any]?
    var language: String = configLocale.first(where: { $0.key == defaultLanguage() })?.key ?? LCLLanguageEnglish

    func lineSpacing() -> CGFloat {
        return configParagraphLineSpacing[language] ?? 2.0
    }
    
    open class func defaultLanguage() -> String {
        var defaultLanguage: String = String()
        guard let preferredLanguage = Bundle.main.preferredLocalizations.first else {
            return LCLDefaultLanguage
        }
        let availableLanguages: [String] = self.availableLanguages()
        if availableLanguages.contains(preferredLanguage) {
            defaultLanguage = preferredLanguage
        } else {
            defaultLanguage = LCLDefaultLanguage
        }
        return defaultLanguage
    }
    
    open class func availableLanguages(_ excludeBase: Bool = false) -> [String] {
        var availableLanguages = Bundle.main.localizations
        // If excludeBase = true, don't include "Base" in available languages
        if let indexOfBase = availableLanguages.firstIndex(of: "Base"), excludeBase == true {
            availableLanguages.remove(at: indexOfBase)
        }
        return availableLanguages
    }
    
    open class func currentLanguage() -> String {
        guard let language = UserDefaults.standard.string(forKey: LCLCurrentLanguageKey) else {
            return defaultLanguage()
        }
        Localized.shared.language = language
        return language
    }
}
