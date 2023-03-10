//
//  ContentType.swift
//  LEGO
//
//  Created by Songwut Maneefun on 9/15/17.
//  Copyright © 2017 Conicle. All rights reserved.
//

import UIKit
import ObjectMapper

class ContentTypePageResult: PageResult {
    var list = [ContentTypeResult]()

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)

        list <- map["results"]
    }
}

class ContentTypeDetailResult: ContentResult {
    var typeList = [ContentTypeResult]()
    
    override func mapping(map: Map) {
        super.mapping(map: map)

        typeList <- map["data"]
    }
}

class ContentTypeResult: ContentResult {
    var progressGroup: ProgressGroup?
    var count = 0
    var progressGroupDict = [String: Int]()
    /*
    func filterFirstLoad() -> FilterParam { // select first tap
        if let progressGroup = progressGroup {
            if progressGroup.todoCount >= 1 {
                return FilterParam(groupDict: ["to_do": true], statusList: groupTodo)

            } else if progressGroup.doingCount >= 1 {
                return FilterParam(groupDict: ["doing": true], statusList: groupDoing)

            } else if progressGroup.doneCount >= 1 {
                return FilterParam(groupDict: ["done": true], statusList: groupDone)
            }
        }
        return FilterParam(groupDict: ["to_do": true], statusList: groupTodo)
    }

    func filterGroup() -> FilterGroup { // select first tap
        if let progressGroup = progressGroup {
            if progressGroup.todoCount >= 1 {
                return FilterGroup.todo

            } else if progressGroup.doingCount >= 1 {
                return FilterGroup.doing

            } else if progressGroup.doneCount >= 1 {
                return FilterGroup.done
            }
        }
        return FilterGroup.todo
    }
*/
    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        progressGroup <- map["progress_group"]
        progressGroupDict <- map["progress_group"]
        count <- map["count"]
        code <- map["code"]
        externalCode <- map["external_code"]
    }

    class func with(_ dict: [String: Any]) -> ContentTypeResult? {
        let item = Mapper<ContentTypeResult>().map(JSON: dict)
        return item
    }
}

enum EcerType: Int {
    case file = 1
    case url = 2
}

enum TypeVideo: Int {
    case video = 1
    case youtube = 2
    case none = 3
}

enum TypeCox: Int {
    case course = 1
    case learningMaterial = 2
}

enum TypeNotiPlaylist: Int {
    case approval = 193
    case recommend = 194
    case returnHomePage = 202
    case none = 0
}

enum RolePlaylist: String {
    case admin
    case manager = "content manager"
    case recommender
    case owner
}

enum PlaylistType: Int {
    case playlistPersonal = 0
    case playlistPublic = 1
}

enum FollowType: Int {
    case followTypeDefault = 0
    case followTypeFollowing = 1
    case followTypeAssigned = 2
}

enum ActionPopup {
    case normal
    case editTitle
    case createNewPlaylist
    case duplicatePlaylist
    case newPlaylistFormSelectplaylist
    case deleteImage
    case mixImage
    case deletePlaylist
}

enum removeAccountList: Int {
    case removeExternal
    case removeInternal
    case none
}

enum StatusAskToAdd: Int {
    case pending = 1
    case approveed = 2
    case rejected = 3
}

enum ContentCode: String {
    // https://gitlab.conicle.co/hrd/conicle/wikis/data-dictionary-content-type
    // 4.0
    case none = ""
    case forYou = "for_you"
    case all
    case event = "event.event"
    case tagEvent = "tag_type=event" // for event.event that is tag_type=event
    case eventProgram = "event_program.eventprogram"
    case survey = "survey.survey"
    case newsupdate = "news_update.newsupdate"
    case eventSession = "event.session"

    case category = "category.category"
    case instructor = "instructor.instructor"
    case instructorAccount = "instructor.account"
    case provider = "provider.provider"

    // 4.1
    case courseConicleX = "course.coniclex"
    case course = "course.course"
    case onboard = "onboard.onboard"
    case test = "exam.exam"
    case learningPath = "learning_path.learningpath"
    case program = "content_program.contentprogram"
    case about
    case activity = "activity.activity"
    case publicLearning = "public_learning.publiclearning"
    case publicLearningRequest = "public_learning.publicrequest"

    case publicRequest = "public_request.publicrequest"
    case contentRequest = "content_request.contentrequest"
    case dashboard
    case learningHistory = "learning_history.learninghistory"

    case scheduleLearningPath = "learning_path.schedule"

    case live = "live.live"

    case video = "video.video"
    case audio = "audio.audio"
    case pdf = "material.pdf"
    case article = "material.article"
    case learningMaterial = "learning_content.learningcontent"
    case scorm = "scorm.scorm"

    // 4.11
    case flashcard = "flashcard.flashcard"
    case playlist = "playlist.playlist"

    // explore -> Learning Request
    case requestList
    case requestMaterial
    case requestWaitingForApprove
    
    case identificationRevision = "identification.revisionaccount"
    
    //5.0
    case externalVideo = "video.externalvideo"

    // 5.0
    case courseIn = "internal.course"
    case courseEx = "external.course"
    case classIn = "internal.class"
    case classEx = "external.class"
    case onboardIn = "internal.onboard"
    case onboardEx = "external.onboard"
    case activityIn = "internal.activity"
    case activityEx = "external.activity"
    case testIn = "internal.test"
    case testEx = "external.test"
    case surveyIn = "internal.survey"
    case surveyEx = "external.survey"
    case learningPathOnlineIn = "internal.learning_path.online"
    case learningPathOnlineEx = "external.learning_path.online"
    case learningPathScheduleIn = "internal.learning_path.schedule"
    case learningPathScheduleEx = "external.learning_path.schedule"
    case learningMaterialVideoIn = "internal.learning_material.video"
    case learningMaterialVideoEx = "external.learning_material.video"
    case learningMaterialExternalVideoIn = "internal.learning_material.external_video"
    case learningMaterialExternalVideoEx = "external.learning_material.external_video"
    case learningMaterialAudioIn = "internal.learning_material.audio"
    case learningMaterialAudioEx = "external.learning_material.audio"
    case learningMaterialDocumentIn = "internal.learning_material.document"
    case learningMaterialDocumentEx = "external.learning_material.document"
    case learningMaterialArticleIn = "internal.learning_material.article"
    case learningMaterialArticleEx = "external.learning_material.article"
    case learningMaterialFlashCardIn = "internal.learning_material.flash_card"
    case learningMaterialFlashCardEx = "external.learning_material.flash_card"
    case scormIn = "internal.scorm"
    case scormEx = "external.scorm"
    case liveIn = "internal.live"
    case liveEx = "external.live"
    case classProgram = "internal.class_program"
    case classProgramEx = "external.class_program"
    case learningPathIn = "internal.learning_path.*"
    case learningContentIn = "internal.learningcontent"
    case learningContentEx = "external.learningcontent"
    case contentProgramIn = "internal.contentprogram"
    case contentProgramEx = "external.contentprogram"
    case publicLearningIn = "internal.public_learning"
    case publicLearningEx = "external.public_learning"
    case playlistIn = "internal.playlist"
    case playlistEx = "external.playlist"
    case pathway = "pathway"
    case pathwayIn = "internal.pathway"
    case pathwayEx = "external.pathway"
    case newsupdateIn = "internal.newsupdate"
    case newsupdateEx = "external.newsupdate"

    func materialIdField() -> String {
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            return "video_id"
        case .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            return "video_id"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio_id"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "document_id"
        default:
            return "id"
        }
    }

    func resumableType() -> String {
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            return "video/mp4"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio/mpeg"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "file/pdf" // test for "application/pdf"
        default:
            return "id"
        }
    }

    func fieldUGCCover() -> String {
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            return "image_video_id"
        case .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            return "image_video_id"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "image_audio_id"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            return "image_flash_card_id"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "image_document_id"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            return "image_article_id"
        default:
            return "image_id"
        }
    }

    func path() -> String {
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            return "video"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            return "flash-card"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "document"
        default:
            return "course"
        }
    }

    func getColor() -> UIColor? {
        return .config_primary()
        /*
        var color: UIColor = .config_primary()
        switch self {
        case .event, .classIn, .classEx:
            color = ConfigApp.eventColor
        case .eventProgram, .classProgram:
            color = ConfigApp.eventColor
        case .course, .courseIn, .courseEx:
            color = ConfigApp.courseColor
        case .survey, .surveyIn, .surveyEx:
            color = ConfigApp.surveyColor
        case .onboard, .onboardIn, .onboardEx:
            color = ConfigApp.onboardColor
        case .test, .testIn, .testEx:
            color = ConfigApp.testColor
        case .learningPath, .learningPathOnlineIn, .learningPathOnlineEx:
            color = ConfigApp.learningPathColor
        case .scheduleLearningPath, .learningPathScheduleIn, .learningPathScheduleEx:
            color = ConfigApp.learningPathColor
        case .activity, .activityIn, .activityEx:
            color = ConfigApp.activityColor
        case .publicLearning:
            color = ConfigApp.publicLearningColor
        case .contentRequest:
            color = ConfigApp.publicRequestColor
        case .publicRequest:
            color = ConfigApp.publicLearningColor // publicRequestColor
        case .live, .liveIn, .liveEx:
            color = ConfigApp.liveColor
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            color = ConfigApp.videoColor
        case .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            color = ConfigApp.externalVideoColor
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            color = ConfigApp.audioColor
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            color = ConfigApp.pdfColor
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            color = ConfigApp.articleColor
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            color = ConfigApp.flashcardColor
        default:
            color = CoColor.grayColor
        }
         
        return color
         */
    }

    func getDefaultImage() -> UIImage {
        return CoImage.defaultImage ?? UIImage()
    }

    func getType() -> SectionType {
        switch self {
        case .event, .classIn, .classEx:
            return SectionType.event
        case .survey, .surveyIn, .surveyEx:
            return SectionType.survey
        case .test, .testIn, .testEx:
            return SectionType.test
        case .learningPath, .learningPathOnlineIn, .learningPathOnlineEx, .learningPathScheduleIn, .learningPathScheduleEx:
            return SectionType.learningPath
        default:
            return SectionType.course
        }
    }

    func cellContentHeight() -> CGFloat {
        return 50
//        switch self {
//        case .event, .classIn, .classEx:
//            return EventCollectionViewCell.contentHeight()
//        case .survey, .surveyIn, .surveyEx:
//            return SurveyCollectionViewCell.contentHeight()
//        case .test, .testIn, .testEx:
//            return SurveyCollectionViewCell.contentHeight()
//        default:
//            return ContentRateCollectionViewCell.contentHeight()
//        }
    }

    func backgroundImage() -> UIImage? {
        var imgName = ""
        switch self {
        case .category:
            imgName = "bg-category"
        case .instructor:
            imgName = "bg-instructor"
        case .provider:
            imgName = "bg-provider"
        case .program:
            imgName = "bg-program"
        default:
            imgName = ""
        }
        return UIImage(named: imgName)
    }

    func icon() -> UIImage? {
        var imgName = ""
        switch self {
        case .externalVideo: // only from content-request/content-type/ugc/
            imgName = "ic_v2_youtube"
        case .course, .courseIn, .courseEx:
            imgName = "ic_v2_course"
        case .event, .classIn, .classEx:
            imgName = "ic_v2_class"
        case .tagEvent:
            imgName = "ic_v2_class"
        case .eventProgram, .classProgram:
            imgName = "ic_v2_class_program"
        case .learningPath, .pathway:
            imgName = "pathway_menu"
        case .test, .testIn, .testEx:
            imgName = "ic_v2_test"
        case .survey, .surveyIn, .surveyEx:
            imgName = "ic_v2_survey"
        case .onboard, .onboardIn, .onboardEx:
            imgName = "ic_v2_onboard"
        case .publicLearning:
            imgName = "ic_v2_public_learning"
        case .publicRequest:
            imgName = "ic_v2_public_request"
        case .activity, .activityIn, .activityEx:
            imgName = "ic_v2_activity"
        case .contentRequest:
            imgName = "ic-publicLearning"
        case .live, .liveIn, .liveEx:
            imgName = "ic_v2_live"
        case .all:
            imgName = "ic_v2_add"
        case .category:
            imgName = "ic_v2_category"
        case .provider:
            imgName = "ic_v2_content_provider"
        case .program:
            imgName = "ic_v2_learning_program"
        case .instructor:
            imgName = "ic_v2_instructor"
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            imgName = "ic_v2_video2" // ic_v2_youtube with type 2
        case .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            imgName = "ic_v2_youtube"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            imgName = "ic_v2_audio2"
        case .learningMaterial:
            imgName = "ic_v2_material"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            imgName = "ic_v2_article"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            imgName = "ic_v2_pdf"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            imgName = "ic_v2_flashcard"
        case .learningPathIn, .learningPathScheduleIn, .learningPathScheduleEx:
            imgName = "pathway_menu"
        default:
            imgName = "ic_v2_coniclex"
        }
        return UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
    }
    
    func iconBottom() -> UIImage? {
        var imgName = ""
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            imgName = "ic_create_video_v5_bottom"
        case .externalVideo, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            imgName = "ic_create_external_video_v5_bottom"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            imgName = "ic_create_audio_v5_bottom"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            imgName = "ic_create_article_v5_bottom"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            imgName = "ic_create_document_v5_bottom"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            imgName = "ic_create_flash_card_v5_bottom"
        case .publicLearningIn, .publicLearningEx:
            imgName = "ic_create_public_learning_v5"
        default:
            imgName = "ic_v2_coniclex"
        }
        return UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
    }
    
    func iconTop() -> UIImage? {
        var imgName = ""
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            imgName = "ic_create_video_v5_top"
        case .externalVideo, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            imgName = "ic_create_external_video_v5_top"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            imgName = "ic_create_audio_v5_top"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            imgName = "ic_create_article_v5_top"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            imgName = "ic_create_document_v5_top"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            imgName = "ic_create_flash_card_v5_top"
        case .publicLearningIn, .publicLearningEx:
            imgName = "ic_create_public_learning_v5"
        default:
            imgName = "ic_v2_coniclex"
        }
        return UIImage(named: imgName)?.withRenderingMode(.alwaysTemplate)
    }
    
    func nameForCreate() -> String {
        var name = ""
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            name = "create_video".localized()
        case .externalVideo, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            name = "create_external_video".localized()
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            name = "create_audio".localized()
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            name = "create_article".localized()
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            name = "create_document".localized()
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            name = "create_flash_card".localized()
        case .publicLearningIn, .publicLearningEx:
            name = "create_public_learning".localized()
        case .playlistIn, .playlistEx:
            name = "new_learning_playlist".localized()
        default:
            name = "create_video".localized()
        }
        return name
    }
    
    func descForCreate() -> String {
        var name = ""
        switch self {
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx:
            name = "create_video_desc".localized()
        case .externalVideo, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            name = "create_external_video_desc".localized()
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            name = "create_audio_desc".localized()
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            name = "create_article_desc".localized()
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            name = "create_document_desc".localized()
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            name = "create_flash_card_desc".localized()
        case .publicLearningIn, .publicLearningEx:
            name = "create_public_learning_desc".localized()
        case .playlistIn, .playlistEx:
            name = "create_learning_playlist_desc".localized()
        default:
            name = "create_video".localized()
        }
        return name
    }

    func name() -> String { // and use in full-text-search api path
        switch self {
        case .externalVideo, .learningMaterialExternalVideoIn:
            return "external_video"
        case .test, .testIn, .testEx:
            return "test"
        case .course, .courseIn:
            return "course"
        case .courseEx:
            return "course.coniclex"
        case .learningPath, .learningPathIn:
            return "pathway"
        case .onboard, .onboardIn, .onboardEx:
            return "onboard"
        case .event, .classIn, .classEx:
            return "class"
        case .eventProgram, .classProgram:
            return "class_program"
        case .survey, .surveyIn, .surveyEx:
            return "survey"
        case .publicLearning:
            return "public_learning"
        case .newsupdate, .newsupdateIn, .newsupdateEx:
            return "news_update"
        case .forYou:
            return "for_you"
        case .eventSession:
            return "session"
        case .activity, .activityIn, .activityEx:
            return "activity"
        case .all:
            return "select_all"
        case .category:
            return "category"
        case .provider:
            return "provider"
        case .program:
            return "content-program"
        case .instructor:
            return "instructor"
        case .live, .liveIn, .liveEx:
            return "live"
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx, .learningMaterialExternalVideoEx:
            return "video"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "doc"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            return "article"
        case .learningMaterial:
            return "learning_material"
        case .learningPathOnlineIn, .learningPathOnlineEx, .learningPathScheduleIn, .learningPathScheduleEx:
            return "pathway"
        default:
            return rawValue
        }
    }
    
    func names() -> String {// use in evaluation
        switch self {
        case .externalVideo, .learningMaterialExternalVideoEx, .learningMaterialVideoEx, .learningMaterialExternalVideoIn:
            return "external_video_unit"
        case .test, .testIn, .testEx:
            return "test_unit"
        case .course, .courseIn, .courseEx:
            return "course_unit"
        case .learningPath:
            return "learning_path_unit"
        case .onboard, .onboardIn, .onboardEx:
            return "onboard_unit"
        case .event, .classIn, .classEx:
            return "class_unit"
        case .eventProgram:
            return "class_program_unit"
        case .survey, .surveyIn, .surveyEx:
            return "survey_unit"
        case .publicLearning:
            return "public_learning_unit"
        case .newsupdate, .newsupdateIn, .newsupdateEx:
            return "news_update"
        case .forYou:
            return "for_you"
        case .eventSession:
            return "session_unit"
        case .activity, .activityIn, .activityEx:
            return "activity_unit"
        case .all:
            return "select_all"
        case .category:
            return "category_unit"
        case .provider:
            return "provider_unit"
        case .program:
            return "learning_program_unit"
        case .instructor:
            return "instructor_unit"
        case .live, .liveIn, .liveEx:
            return "live_unit"
        case .video, .learningMaterialVideoIn :
            return "video_unit"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio_unit"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "document_unit"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            return "article_unit"
        case .learningMaterial:
            return "learning_material_unit"
        case .flashcard, .learningMaterialFlashCardIn, .learningMaterialFlashCardEx:
            return "flash_card_unit"
        default:
            return self.rawValue
        }
    }
    
    func continueName() -> String {
        switch self {
        case .externalVideo:
            return "external_video"
        case .test, .testIn, .testEx:
            return "continue_exam"
        case .course, .courseIn, .courseEx:
            return "continue_courses"
        case .learningPath, .learningPathIn:
            return "learning_path"
        case .onboard, .onboardIn, .onboardEx:
            return "onboard"
        case .event, .classIn, .classEx:
            return "continue_classes"
        case .eventProgram, .classProgram:
            return "class_program"
        case .survey, .surveyIn, .surveyEx:
            return "continue_surveys"
        case .publicLearning:
            return "public_learning"
        case .newsupdate, .newsupdateIn, .newsupdateEx:
            return "news_update"
        case .forYou:
            return "for_you"
        case .eventSession:
            return "session"
        case .activity, .activityIn, .activityEx:
            return "continue_activities"
        case .all:
            return "select_all"
        case .category:
            return "category"
        case .provider:
            return "provider"
        case .program:
            return "content-program"
        case .instructor:
            return "instructor"
        case .live, .liveIn, .liveEx:
            return "continue_live"
        case .video, .learningMaterialVideoEx, .learningMaterialVideoIn, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            return "video"
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return "audio"
        case .pdf, .learningMaterialDocumentIn, .learningMaterialDocumentEx:
            return "doc"
        case .article, .learningMaterialArticleIn, .learningMaterialArticleEx:
            return "article"
        case .pathwayIn, .pathwayEx:
            return "continue_pathway"
        case .learningMaterial, .learningContentIn, .learningContentEx:
            return "continue_materials"
        default:
            return rawValue
        }
    }

    func noContentText() -> String {
        switch self {
        case .course, .courseIn, .courseEx:
            return "No course"
        case .event, .classIn, .classEx:
            return "No class"
        case .onboard, .onboardIn, .onboardEx:
            return "No onboard"
        case .instructor:
            return "No instructor"
        case .category:
            return "No category"
        case .provider:
            return "No learning center"
        default:
            return "No content"
        }
    }

    func contentCountText(count: Int) -> String {
        switch self {
        case .course, .courseIn, .courseEx:
            return count.textNumber(many: "courses")
        case .event, .classIn, .classEx:
            return count.textNumber(many: "events")
        case .survey, .surveyIn, .surveyEx:
            return count.textNumber(many: "surveys")
        case .live, .liveIn, .liveEx:
            return count.textNumber(many: "lives")
        case .test, .testIn, .testEx:
            return count.textNumber(many: "tests")
        case .activity, .activityIn, .activityEx:
            return count.textNumber(many: "activitys")
        case .scheduleLearningPath, .learningPathScheduleIn, .learningPathScheduleEx:
            return count.textNumber(many: "pathway_unit")
        case .learningPath:
            return count.textNumber(many: "pathway_unit")
        case .eventProgram, .classProgram:
            return count.textNumber(many: "class_program_unit")
        case .onboard, .onboardIn, .onboardEx:
            return count.textNumber(many: "onboards")
        case .publicLearning:
            return count.textNumber(many: "public_learnings")
        case .video, .learningMaterialVideoIn, .learningMaterialVideoEx, .learningMaterialExternalVideoIn, .learningMaterialExternalVideoEx:
            return count.textNumber(many: "videos")
        case .audio, .learningMaterialAudioIn, .learningMaterialAudioEx:
            return count.textNumber(many: "audios")
        case .learningMaterial:
            return count.textNumber(many: "learning_materials")
        case .newsupdate, .newsupdateIn, .newsupdateEx:
            return count.textNumber(many: "news_updates")
        case .all:
            return count.textNumber(many: "contents")
        default:
            return count.textNumber(many: "contents")
        }
    }

    func unitText() -> String {
        switch self {
        case .course, .courseIn, .courseEx:
            return "course(s)"
        case .event, .classIn, .classEx:
            return "class(s)"
        case .instructor:
            return "instructor(s)"
        case .category:
            return "category(s)"
        case .provider:
            return "provider(s)"
        default:
            return "content(s)"
        }
    }

    func sectionMenus() -> [String] {
        switch self {
        case .course, .courseIn, .courseEx:
            return [String]()
        case .event, .classIn, .classEx:
            return ["Class", "Live", "Event"]
        default:
            return [String]()
        }
    }
    
    func localized() -> String {
        
        switch self.rawValue {
        case "internal.course":
            return "course".localized()
        case "external.course":
            return "course.coniclex".localized()
        case "internal.class":
            return "class".localized()
        case "external.class":
            return "class".localized()
        case "internal.onboard":
            return "onboard".localized()
        case "external.onboard":
            return "onboard".localized()
        case "internal.activity":
            return "activity".localized()
        case "external.activity":
            return "activity".localized()
        case "internal.test":
            return "test".localized()
        case "external.test":
            return "test".localized()
        case "internal.survey":
            return "survey".localized()
        case "external.survey":
            return "survey".localized()
        case "internal.learning_path.online":
            return "online_learning_path".localized()
        case "internal.learning_path.schedule":
            return "schedule_learning_path".localized()
        case "external.learning_path.online":
            return "online_learning_path".localized()
        case "external.learning_path.schedule":
            return "schedule_learning_path".localized()
        case "internal.learning_material.video":
            return "video".localized()
        case "external.learning_material.video":
            return "internal.learning_material.external_video".localized()
        case "internal.learning_material.external_video":
            return "external_video".localized()
        case "external.learning_material.external_video":
            return "external_video".localized()
        case "internal.learning_material.audio":
            return "audio".localized()
        case "external.learning_material.audio":
            return "audio".localized()
        case "internal.learning_material.document":
            return "document".localized()
        case "external.learning_material.document":
            return "document".localized()
        case "internal.learning_material.article":
            return "article".localized()
        case "external.learning_material.article":
            return "article".localized()
        case "internal.learning_material.flash_card":
            return "flash_card".localized()
        case "external.learning_material.flash_card":
            return "flash_card".localized()
        case "internal.live":
            return "live".localized()
        case "external.live":
            return "live".localized()
        case "internal.class_program", "external.class_program":
            return "class_program".localized()
        case "internal.learning_path.*":
            return "learning_path".localized()
        case "internal.learningcontent", "external.learningcontent":
            return "learning_content".localized()
        case "internal.contentprogram", "external.contentprogram":
            return "content_program".localized()
        case "internal.public_learning", "external.public_learning":
            return "public_learning".localized()
        case "internal.playlist", "external.playlist":
            return "playlist".localized()
        default: return ""
        }
    }
}

class FilterTypeResult: BaseResult {
    var code: ContentCode = .none
    //var optionList = [OptionResult]()

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        id <- map["id"]
        name <- map["name"]
        code <- map["code"]
    }

    func getItemName() -> String {
        if code != .none {
            return code.rawValue.localized()
        } else {
            return name
        }
    }

    class func with(_ dict: [String: Any]) -> FilterTypeResult? {
        let item = Mapper<FilterTypeResult>().map(JSON: dict)
        return item
    }
}
