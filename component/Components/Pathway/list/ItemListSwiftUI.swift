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
    @State var list: [LearningPathResult] = PathwayMock.pathwayList
    
    @State private var isDetailVisible = false
    @State private var currentPage = 0
    @State private var isLoading = false
    let pageSize = 24
        
    private let columns = UIDevice.isIPhone ? [GridItem(.flexible())] : [GridItem(.flexible()), GridItem(.flexible()) ]
    private let itemRatio: CGFloat = 435 / 335
    private let hMargin:CGFloat = 70
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            contentScrollView
        }
    }
    
    var totalView: some View {
        Text("total".localized())
            .foregroundColor(.black)
            .padding([.leading, .trailing], 24)
    }
    
    var contentScrollView: some View {
        GeometryReader { geometry in
            ScrollView {
                totalView
                    .frame(maxWidth: .infinity, maxHeight: 30)
                
                LazyVGrid(columns: columns, alignment: .center, spacing: 16) {
                    ForEach(list, id:\LearningPathResult.uuid) { item in
                        let marginBorder: CGFloat = UIDevice.isIPad ? 140 : 40
                        let itemWidth: CGFloat = (geometry.size.width - marginBorder) / CGFloat(columns.count)
                        PathwayItemSwiftUI()
                            .frame(
                                width: itemWidth ,
                                height: (itemWidth * (9 / 16)) + 230
                            )
                            .padding([.bottom], 24)
                            .onTapGesture {
                                print("Tapped item \(item.name)")
                                
                            }
                    }
                }
                .padding()
                            
                if isLoading {
                    ProgressView()
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
        
    }
    
    // Load the next page of items
    private func loadNextPage() {
        
        let startIndex = currentPage * pageSize
        let endIndex = min(startIndex + pageSize, list.count)
        if startIndex >= list.count {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                //list.append(contentsOf: page.list)
                isLoading = false
                currentPage += 1
            }
        }
    }
    
}


struct ItemListSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        ItemListSwiftUI()
    }
}
