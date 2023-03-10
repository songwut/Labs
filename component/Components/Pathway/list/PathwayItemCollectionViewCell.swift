//
//  PathwayItemCollectionViewCell.swift
//  component
//
//  Created by Songwut Maneefun on 8/3/23.
//

import SwiftUI

class PathwayItemCollectionViewCell: UICollectionViewCell {
    
    var item: LearningPathResult? = PathwayMock.pathwayDetail
    
    private let swiftUIView = PathwayItemSwiftUI()
    private lazy var hostingController = UIHostingController(rootView: swiftUIView)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: contentView.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
    
    func configure(with item: LearningPathResult) {
        self.item = item
        
        swiftUIView.item = item
    }
}


//struct PathwayItemCollectionViewCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PathwayItemCollectionViewCell()
//    }
//}

//use
//func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PathwayItemCell", for: indexPath) as! PathwayItemCollectionViewCell
//    let pathwayItem = pathwayItems[indexPath.item]
//    cell.configure(with: pathwayItem)
//    return cell
//}
