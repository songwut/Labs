//
//  ItemListSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 8/3/23.
//

import SwiftUI

struct ItemPathway: Identifiable {
    let id = UUID()
    let name: String
}

struct ItemListSwiftUI: View {
    let items = [
        ItemPathway(name: "Item 1"),
        ItemPathway(name: "Item 2"),
        ItemPathway(name: "Item 3"),
        ItemPathway(name: "Item 4"),
        ItemPathway(name: "Item 5"),
        ItemPathway(name: "Item 6"),
        ItemPathway(name: "Item 7"),
        ItemPathway(name: "Item 8"),
        ItemPathway(name: "Item 9"),
        ItemPathway(name: "Item 10"),
        ItemPathway(name: "Item 1"),
        ItemPathway(name: "Item 2"),
        ItemPathway(name: "Item 3"),
        ItemPathway(name: "Item 4"),
        ItemPathway(name: "Item 5"),
        ItemPathway(name: "Item 6"),
        ItemPathway(name: "Item 7"),
        ItemPathway(name: "Item 8"),
        ItemPathway(name: "Item 9"),
        ItemPathway(name: "Item 10"),
        ItemPathway(name: "Item 1"),
        ItemPathway(name: "Item 2"),
        ItemPathway(name: "Item 3"),
        ItemPathway(name: "Item 4"),
        ItemPathway(name: "Item 5"),
        ItemPathway(name: "Item 6"),
        ItemPathway(name: "Item 7"),
        ItemPathway(name: "Item 8"),
        ItemPathway(name: "Item 9"),
        ItemPathway(name: "Item 10")
    ]
    @State private var currentPage = 1 // The current page
    @State private var currentItems: [ItemPathway] = [] // The items to show on the current page
    let pageSize = 24 // The number of items to show per page
        
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let itemRatio: CGFloat = 435 / 335
    private let hMargin:CGFloat = 70
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("NavigationLink View")) {
                
            }
            VStack(alignment: .leading, spacing: 24) {
                Text("total".localized())
                    .foregroundColor(.black)
                    .padding([.leading, .trailing], 20)
                
                if UIDevice.isIPhone {
                    iPhoneLayoutView
                } else {
                    iPadLayoutView
                }
            }
        }
        .background(Color("FBFBFB"))
        .navigationTitle("Navigation")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var iPhoneLayoutView: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(alignment: .center, spacing: 24) {
                    
                    ForEach(currentItems) { item in
                        NavigationLink(destination: Text("Second View")) {
                            PathwayItemSwiftUI()
                                .frame(
                                    height: geometry.size.width * itemRatio
                                )
                        }
                        .animation(.interpolatingSpring(stiffness: 100, damping: 10, initialVelocity: 0))
                        
                    }
                }
                .padding()
            }
        }
        
    }
    
    var iPadLayoutView: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    ForEach(currentItems) { item in
                        NavigationLink(destination: Text("Second View")) {
                            let itemWidth = geometry.size.width * 0.4
                            PathwayItemSwiftUI()
                                .frame(
                                    width: itemWidth ,
                                    height: (itemWidth * (9 / 16)) + 230
                                )
                                .padding([.bottom], hMargin * 0.4)
                        }
                        .animation(.interpolatingSpring(stiffness: 100, damping: 10, initialVelocity: 0))
                        
                    }
                }
                .padding([.leading, .trailing], hMargin)
            }
        }
        
    }
    
    // Load the next page of items
    private func loadNextPage() {
        let startIndex = (currentPage - 1) * pageSize
        let endIndex = min(startIndex + pageSize, items.count)
        let newItems = items[startIndex..<endIndex]
        currentItems.append(contentsOf: newItems)
        currentPage += 1
    }
    
}


struct ItemListSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ItemListSwiftUI()
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
