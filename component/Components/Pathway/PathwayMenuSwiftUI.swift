//
//  PathwayMenuSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI

struct PathwayMenu: Hashable {
    var title: String
    var icon: UIImage = UIImage()
    var index = 0
}

struct PathwayMenuSwiftUI: View {
    @State private var currentMenu: PathwayMenu = PathwayMock.currentMenu

    @Binding var selection : Int
    var items : [PathwayMenu]
    @State var itemWidth: CGFloat = 100
    private let spaceH: CGFloat = 8
    
    var body : some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: spaceH) {
                  ForEach (items, id: \.self) { item in
                      SegmentButtonSwiftUI(image: item.icon,
                                    text: item.title,
                                    width: itemWidth,
                                    color: .white,
                                    selectColor: PathwayStyle.menuColor.color,
                                    selectionIndex: item.index,
                                    selection: self.$selection)
                      
                      
                  }
            }
            .onAppear {
                let space = spaceH * CGFloat(items.count - 1)
                self.itemWidth = (geometry.size.width - space) / CGFloat(items.count)
            }
        }
    }
    
}

struct SwiftUI_Previews: PreviewProvider {
    @State static var value: Int = 0
    
    static var previews: some View {
        PathwayMenuSwiftUI(selection: $value, items: PathwayMock.menus)
            .previewLayout(.fixed(width: 400, height: 100))
    }
}
