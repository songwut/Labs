//
//  setting.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import UIKit

let fontConicleText = "DBHeaventRounded"
let fontConicleMedium = "DBHeaventRounded-Med"
let fontConicleBold = "DBHeaventRounded-Bold"
let fontConicleTextIt = "DBHeaventRounded-Italic"
let fontConicleMediumIt = "DBHeaventRounded-MedIt"
let fontConicleBoldIt = "DBHeaventRounded-BoldIt"

let LCLCurrentLanguageKey = "LCLCurrentLanguageKey"
var mainCalendar = Calendar.current
struct DeviceID {
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    static let isiPhone = UIDevice.current.userInterfaceIdiom == .phone
}


struct CoImage {
    static let defaultTestQuestionImage = UIImage(named: "Video_Answer_Default_Question")
    static let defaultTestChoiseImage = UIImage(named: "Video_Answer_Default_Answer")
    static let defaultImage = UIImage(named: "ic_default_image_v5")
    static let defaultUserImage = UIImage(named: "ic_profile_gray")

    static let defaultCoverActivity = UIImage(named: "Cover_Activity")
    static let defaultCoverCategory = UIImage(named: "Cover_Category")
    static let defaultCoverClass = UIImage(named: "Cover_Class")
    static let defaultCoverContentProvider = UIImage(named: "Cover_ContentProvider")
    static let defaultCoverCourse = UIImage(named: "Cover_Course")
    static let defaultCoverInstructor = UIImage(named: "Cover_Instructor")
    static let defaultCoverLearningPath = UIImage(named: "Cover_LearningPath")
    static let defaultCoverLearningProgram = UIImage(named: "Cover_LearningProgram")
    static let defaultCoverLocation = UIImage(named: "Cover_Location")
    static let defaultCoverOnboard = UIImage(named: "Cover_Onboard")
    static let defaultCoverPublicLearning = UIImage(named: "Cover_PublicLearning")
    static let defaultCoverLearningRoom = UIImage(named: "Cover_LearningRoom")
}
