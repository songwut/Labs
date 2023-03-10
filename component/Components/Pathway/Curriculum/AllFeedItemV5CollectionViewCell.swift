//
//  AllFeedItemV5CollectionViewCell.swift
//  LEGO
//
//  Created by SatangBiiger Jaydeestan on 13/12/2565 BE.
//  Copyright © 2565 BE conicle. All rights reserved.
//

import UIKit

class AllFeedItemV5CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerImageView: UIView!
    @IBOutlet weak var dateTagView: UIView! {
        didSet {
            dateTagView.backgroundColor = .semantic(.pink)
            dateTagView.makeRoundCorner(withRadius: 12)
        }
    }
    @IBOutlet weak var dateTagLabel: UILabel! {
        didSet {
            dateTagLabel.textColor = .white
            dateTagLabel.font = .font(12, .medium)
        }
    }
    @IBOutlet weak var tagContainerView: UIView!
    @IBOutlet weak var tagView: UIView! {
        didSet {
            tagView.isHidden = true
            tagView.makeRoundCorner(withRadius: tagView.frame.size.height/2)
        }
    }
    @IBOutlet weak var tagLabel: UILabel! {
        didSet {
            tagLabel.font = .font(12, .medium)
        }
    }
    @IBOutlet weak var tagTailingIconImageView: UIImageView!
    @IBOutlet weak var tagTailingLabel: UILabel! {
        didSet {
            tagTailingLabel.font = .font(12, .text)
        }
    }
    @IBOutlet weak var tagMoreImageView: UIImageView!
    @IBOutlet weak var titleContentView: UIView!
    @IBOutlet weak var titleContentLabel: UILabel! {
        didSet {
            titleContentLabel.font = .font(14, .medium)
        }
    }
    @IBOutlet weak var tagMoreWidthConstraint: NSLayoutConstraint! {
        didSet {
            tagMoreWidthConstraint.constant = 0
        }
    }
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = .font(12, .text)
        }
    }
    @IBOutlet weak var discountPriceLabel: UILabel! {
        didSet {
            discountPriceLabel.font = .font(12, .text)
            discountPriceLabel.textColor = UIColor(hex: "#99A3AD")
        }
    }
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var companyImageView: UIImageView! {
        didSet {
            companyImageView.makeRoundCorner(withRadius: 4)
            companyImageView.layer.borderWidth = 1
            companyImageView.layer.borderColor = UIColor(hex: "#99A3AD").cgColor
        }
    }
    @IBOutlet weak var companyLabel: UILabel! {
        didSet {
            companyLabel.font = .font(12, .text)
        }
    }
    @IBOutlet weak var contentTypeView: UIView!
    @IBOutlet weak var contentTypeImageView: UIImageView!
    @IBOutlet weak var contentTypeLabel: UILabel! {
        didSet {
            contentTypeLabel.font = .font(12, .text)
        }
    }
    
    @IBOutlet weak var pointView: UIView!
    @IBOutlet weak var pointImageView: UIImageView! {
        didSet {
            pointImageView.image = UIImage(named: "pointv5")
            pointImageView.tintColor = UIColor(hex: "#99A3AD")
        }
    }
    @IBOutlet weak var pointLabel: UILabel! {
        didSet {
            pointLabel.font = .font(12, .text)
        }
    }
    @IBOutlet weak var subContentTypeView: UIView!
    @IBOutlet weak var subContentTypeIconImageView: UIImageView! {
        didSet {
            subContentTypeIconImageView.image = UIImage(named: "ic_v2_class")
            subContentTypeIconImageView.tintColor = UIColor(hex: "#99A3AD")
        }
    }
    @IBOutlet weak var subContentTypeLabel: UILabel!  {
        didSet {
            subContentTypeLabel.font = .font(12, .text)
        }
    }
    
    var pressCellCallback: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.makeRoundCorner(withRadius: 20)
        containerView.makeShadow(offset: CGSize(width: 0, height: 0), opacity: 0.2, radius: 3, color: .lightGray)
        containerImageView.makeRoundCorner(withRadius: 20)
        imageView.makeRoundCorner(withRadius: 20)
        containerImageView.makeShadow(offset: CGSize(width: 0, height: 0), opacity: 0.2, radius: 3, color: .lightGray)
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pressCell)))
    }
    
    func setupCell(data: AllFeedV5DataResult) {
        imageView.contentMode = .scaleAspectFill
        imageView.setImage(data.image, placeholderImage: UIImage(named: "ic_default_image_v5"))
        titleContentLabel.text = data.name.isEmpty ? "-" : data.name
        if let contentProvider = data.contentProvider {
            companyView.isHidden = false
            companyImageView.setImage(contentProvider.image, placeholderImage: nil)
            companyLabel.text = contentProvider.name
        } else {
            companyView.isHidden = true
        }
        
        if let contentCode = data.contentType?.externalCode {
            if contentCode == .liveIn || contentCode == .liveEx || contentCode == .classIn || contentCode == .classEx || contentCode == .classProgram {
                if !data.datetimeStart.isEmpty {
                    dateTagView.isHidden = false
                    print(data.datetimeStart)
                    dateTagLabel.text = formatter.with(dateFormat: "dd\nMMM", dateString: data.datetimeStart)
                } else {
                    dateTagView.isHidden = true
                }
            } else {
                dateTagView.isHidden = true
            }
            
            if contentCode == .courseIn || contentCode == .courseEx || contentCode == .liveIn || contentCode == .liveEx || contentCode == .learningMaterialAudioIn || contentCode == .learningMaterialAudioEx || contentCode == .learningMaterialVideoIn || contentCode == .learningMaterialVideoEx || contentCode == .learningMaterialArticleIn || contentCode == .learningMaterialArticleEx || contentCode == .learningMaterialDocumentIn || contentCode == .learningMaterialDocumentEx || contentCode == .learningMaterialFlashCardIn || contentCode == .learningMaterialFlashCardEx {
                
                priceView.isHidden = true // Hidden prices but in the future show prices
                priceLabel.text = "฿\(data.price.withCommas())"
                if contentCode == .courseIn || contentCode == .courseEx || contentCode == .liveIn || contentCode == .liveEx {
                    let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "฿\(data.priceDiscount.withCommas())")
                        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                    discountPriceLabel.attributedText = attributeString
                } else {
                    discountPriceLabel.text = "\(data.priceDiscount.withCommas())"
                }
            } else {
                priceView.isHidden = true
            }
            
            if contentCode == .courseIn || contentCode == .courseEx || contentCode == .liveIn || contentCode == .liveEx || contentCode == .classIn || contentCode == .classEx || contentCode == .activityIn || contentCode == .activityEx || contentCode == .learningMaterialAudioIn || contentCode == .learningMaterialAudioEx || contentCode == .learningMaterialVideoIn || contentCode == .learningMaterialVideoEx || contentCode == .learningMaterialExternalVideoIn || contentCode == .learningMaterialExternalVideoEx || contentCode == .learningMaterialArticleIn || contentCode == .learningMaterialArticleEx || contentCode == .learningMaterialDocumentIn || contentCode == .learningMaterialDocumentEx || contentCode == .learningMaterialFlashCardIn || contentCode == .learningMaterialFlashCardEx || contentCode == .testIn || contentCode == .testEx || contentCode == .surveyIn || contentCode == .surveyEx {
                if data.point > 0 {
                    pointView.isHidden = false
                    pointLabel.text = data.point.withCommas()
                } else {
                    pointView.isHidden = true
                }
            } else {
                pointView.isHidden = true
            }
            
            if contentCode == .courseIn || contentCode == .courseEx {
                tagTailingIconImageView.isHidden = false
                tagTailingLabel.isHidden = false
                tagContainerView.isHidden = false
                tagTailingLabel.text = "\(Double(data.rating)) ( \(data.review.shorted()) )"
            } else {
                tagTailingIconImageView.isHidden = true
                tagTailingLabel.isHidden = true
                tagContainerView.isHidden = true
            }
            
            if contentCode == .classIn || contentCode == .classEx || contentCode == .classProgram {
                subContentTypeView.isHidden = false
                if contentCode == .classProgram {
                    subContentTypeLabel.text = "\((data.countContent ?? 0).withCommas()) \((data.countContent ?? 0).unit("classes"))"
                } else {
                    subContentTypeLabel.text = data.classProgram?.name ?? "-"
                }
            } else {
                subContentTypeView.isHidden = true
            }
            
            if data.contentType?.code == .publicLearning {
                contentTypeImageView.image = data.contentType?.code.icon()
            } else {
                contentTypeImageView.image = contentCode.icon()
            }
            contentTypeImageView.tintColor = UIColor(hex: "#99A3AD")
            if contentCode == .testIn || contentCode == .testEx || contentCode == .liveIn || contentCode == .liveEx || contentCode == .classIn || contentCode == .classEx || contentCode == .activityIn || contentCode == .activityEx || data.contentType?.code == .publicLearning || contentCode == .activityEx || contentCode == .classProgram || contentCode == .learningMaterialAudioIn || contentCode == .learningMaterialAudioEx || contentCode == .learningMaterialVideoIn || contentCode == .learningMaterialVideoEx || contentCode == .learningMaterialExternalVideoIn || contentCode == .learningMaterialExternalVideoEx || contentCode == .learningMaterialArticleIn || contentCode == .learningMaterialArticleEx || contentCode == .learningMaterialDocumentIn || contentCode == .learningMaterialDocumentEx || contentCode == .learningMaterialFlashCardIn || contentCode == .learningMaterialFlashCardEx {
                if contentCode == .testIn || contentCode == .testEx {
                    if let categoryName = data.category?.name {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName.shorted(to: 10)) ・ \(data.countQuestion ?? 0) \((data.countQuestion ?? 0).unit("questions"))"
                    } else {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(data.countQuestion ?? 0) \((data.countQuestion ?? 0).unit("questions"))"
                    }
                } else if contentCode == .classIn || contentCode == .classEx || contentCode == .classProgram {
                    if let categoryName = data.category?.name {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName)"
                    } else {
                        contentTypeLabel.text = "\(contentCode.localized())"
                    }
                } else if contentCode == .activityIn || contentCode == .activityEx {
                    if let categoryName = data.category?.name {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName.shorted(to: 10)) ・ \(data.checklist ?? 0) \((data.checklist ?? 0).unit("checklist_unit"))"
                    } else {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(data.checklist ?? 0) \((data.checklist ?? 0).unit("checklist_unit"))"
                    }
                } else if contentCode == .learningMaterialAudioIn || contentCode == .learningMaterialAudioEx || contentCode == .learningMaterialVideoIn || contentCode == .learningMaterialVideoEx || contentCode == .learningMaterialExternalVideoIn || contentCode == .learningMaterialExternalVideoEx || contentCode == .learningMaterialArticleIn || contentCode == .learningMaterialArticleEx || contentCode == .learningMaterialDocumentIn || contentCode == .learningMaterialDocumentEx || contentCode == .learningMaterialFlashCardIn || contentCode == .learningMaterialFlashCardEx {
                    if contentCode == .learningMaterialExternalVideoIn || contentCode == .learningMaterialExternalVideoEx {
                        if let categoryName = data.category?.name {
                            if let datetimeUpdate = data.datetimeUpdate {
                                contentTypeLabel.text = "\("external_video_short".localized()) ・ \(categoryName.shorted(to: 10)) ・ \((datetimeUpdate).dateTimeAgo())"
                            } else {
                                contentTypeLabel.text = "\("external_video_short".localized()) ・ \(categoryName)"
                            }
                        } else {
                            if let datetimeUpdate = data.datetimeUpdate {
                                contentTypeLabel.text = "\("external_video_short".localized()) ・ \((datetimeUpdate).dateTimeAgo())"
                            } else {
                                contentTypeLabel.text = "\("external_video_short".localized())"
                            }
                        }
                    } else {
                        if let categoryName = data.category?.name {
                            if let datetimeUpdate = data.datetimeUpdate {
                                contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName.shorted(to: 10)) ・ \((datetimeUpdate).dateTimeAgo())"
                            } else {
                                contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName)"
                            }
                        } else {
                            if let datetimeUpdate = data.datetimeUpdate {
                                contentTypeLabel.text = "\(contentCode.localized()) ・ \((datetimeUpdate).dateTimeAgo())"
                            } else {
                                contentTypeLabel.text = "\(contentCode.localized())"
                            }
                        }
                    }
                    
                } else if contentCode == .publicLearning {
                    if let categoryName = data.category?.name {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName)"
                    } else {
                        contentTypeLabel.text = "\(contentCode.localized())"
                    }
                } else if contentCode == .liveIn || contentCode == .liveEx {
                    if let categoryName = data.category?.name {
                        contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName)"
                    } else {
                        contentTypeLabel.text = "\(contentCode.localized())"
                    }
                }
            } else if contentCode == .surveyIn || contentCode == .surveyEx {
                if let categoryName = data.category?.name {
                    contentTypeLabel.text = "\(data.type.localized()) ・ \(categoryName.shorted(to: data.type == "questionnaire" ? 5 : 10)) ・ \(data.countQuestion ?? 0) \((data.countQuestion ?? 0).unit("questions"))"
                } else {
                    contentTypeLabel.text = "\(data.type.localized()) ・ \(data.countQuestion ?? 0) \((data.countQuestion ?? 0).unit("questions"))"
                }
            } else if contentCode == .courseIn || contentCode == .courseEx {
                if let categoryName = data.category?.name {
                    contentTypeLabel.text = "\(contentCode.localized()) ・ \(categoryName)"
                } else {
                    contentTypeLabel.text = "\(contentCode.localized())"
                }
            } else {
                contentTypeLabel.text = contentCode.localized()
            }
        }
    }
    
    @objc func pressCell() {
        pressCellCallback?()
    }

}
