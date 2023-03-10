//
//  AllFeedItemV5SwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import SwiftUI
import UIKit

struct AllFeedItemV5SwiftUI: View {
    var item: LearnObjectResult
    
    var body: some View {
        Text(item.name)
    }
}
/*
struct AllFeedItemV5SwiftUI: UIViewRepresentable {
    var item: AllFeedV5DataResult
    var pressCellCallback: (() -> Void)?
    
    func makeUIView(context: Context) -> AllFeedItemV5CollectionViewCell {
        let cell = AllFeedItemV5CollectionViewCell()
        cell.setupCell(data: item)
        cell.pressCellCallback = pressCellCallback
//        cell.pressCellCallback = { [weak self] in
//            guard let self = self else { return }
//            if let contentCode = item.contentType?.externalCode {
//                print("Content code: \(contentCode)")
//                self.pressedItemCallback?(item.id, item.name, contentCode)
//            }
//        }
        return cell
    }
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        var collectionView: UICollectionView!
    }
    
    func updateUIView(_ uiView: AllFeedItemV5CollectionViewCell, context: Context) {
        // Update the cell's contents here, if needed
        uiView.setupCell(data: item)
    }
}
*/
struct AllFeedItemV5SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        AllFeedItemV5SwiftUI(item: PathwayMock.learnObject)
            .previewLayout(.fixed(width: 335, height: 80))
    }
}
