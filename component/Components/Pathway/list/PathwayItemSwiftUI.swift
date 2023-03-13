//
//  PathwayItemSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 8/3/23.
//

import SwiftUI

struct PathwayItemSwiftUI: View {
    @State var item: LearningPathResult = PathwayMock.pathwayDetail
    @State var code: ContentCode = .pathway
    
    var category: CategoryResult? {
        item.category
    }
    
    var classProgram: String?
    var point: Int?
    
    var body: some View {

        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 3)
                
                
                VStack(alignment: .leading) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(UIColor.neutral(.cool, .shade200).color)
                            .offset(y: 16)
                            .padding([.leading, .trailing], 32)
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(UIColor.neutral(.cool).color)
                            .offset(y: 8)
                            .padding([.leading, .trailing], 16)
                        
                        ImageView(url: item.image,
                                  mode: .fill,
                                  placeholder: UIImage(named: "pathway_cover")!)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .frame(height: coverHeight(width: geometry.size.width))
                        
                        
                    }
                    .frame(height: coverHeight(width: geometry.size.width))
                    
                    contentDetailView
                }
            }
        }
    }
    
    func coverHeight(width: CGFloat) -> CGFloat {
        return width * 9 / 16
    }
    
    
    var contentDetailView: some View {
        VStack(alignment: .leading, spacing: 4) {
            EmptyView()
                .frame(height: 16)
            
            //date
            Text(item.getDateText())
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.semantic(.orange))
                .clipShape(Capsule())
                .font(.font(12, .medium))
            
            //title
            Text(item.name)
                .lineLimit(1)
                .foregroundColor(.black)
                .font(.font(14, .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            //price
            if item.price != nil {
                priceView
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            //provider
            providerView
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //type icon , category
            HStack {
                IconTitleSwiftUI(icon: code.icon(), title: code.name().localized())
                Text("・")
                    .foregroundColor(.neutral(.cool))
                if let category = category {
                    Text(category.name)
                        .font(.font(12, .regular))
                        .foregroundColor(.neutral(.cool, .shade900))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //material, section
            HStack {
                IconTitleSwiftUI(icon: UIImage(named: "ic_v2_material"), title: item.materialCountText)
                
                if let sectionCountText = item.sectionCountText {
                    Text("・")
                        .foregroundColor(.neutral(.cool))
                    Text(sectionCountText)
                        .font(.font(12, .regular))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            //gamification
            if let point = item.point {
                IconTitleSwiftUI(icon: UIImage(named: "pointv5")!, title: "\(point)")
            }
        }
        .padding()
    }
    
    var priceView: some View {
        HStack {
            if let discountPrice = item.discountPrice {
                Text("฿\(discountPrice.withCommas())")
                    .foregroundColor(.black)
                    .font(.font(14, .bold))
            }
            
            if let price = item.price {
                Text("฿\(price.withCommas())")
                    .foregroundColor(.neutral(.cool))
                    .font(.font(12, .regular))
                    .strikethrough()
            }
        }
    }
    
    var providerView: some View {
        HStack(spacing: 4) {
            ZStack {
                ImageView(url: item.provider?.image ?? "",
                          mode: .fill)
                
                .border(Color.neutral(.cool, .shade200), width: 1)
                
                RoundedRectangle(cornerRadius: 18)
                    .stroke(Color.neutral(.cool, .shade200), lineWidth: 1)
            }
            .frame(width: 24, height: 24)
            .clipShape(RoundedRectangle(cornerRadius: 18))
            
            Text(item.provider?.name ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .regular))
        }
    }
}


struct PathwayItemSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        let item = PathwayMock.pathwayDetail
        PathwayItemSwiftUI(item: item, code: item.contentTypeCode)
            .previewLayout(.fixed(width: 335, height: 435))

    }
}
