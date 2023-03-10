//
//  AllFeedItemV5SwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 9/3/23.
//

import SwiftUI
import UIKit

struct AllFeedItemV5SwiftUI: View {
    @State var item: LearnObjectResult
    @State var code: ContentCode
    @State var category: CategoryResult?
    @State var classProgram: String?
    @State var point: Int?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(radius: 3)
                
                
                VStack(alignment: .leading) {
                    ZStack {
                        ImageView(url: item.image,
                                  mode: .fill,
                                  placeholder: UIImage(named: "pathway_cover")!)
                            .background(Color.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
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
        VStack(alignment: .leading, spacing: 8) {
            if let _ = point {//wait back/po
                rateView
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Title
            Text(item.name)
                .lineLimit(2)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Price
            if item.price != nil {
                priceView
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer(minLength: 8)
            
            providerView
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                IconTitleSwiftUI(icon: code.icon() ?? UIImage(), title: code.name())
                Text("・")
                    .foregroundColor(.neutral(.cool))
                if let category = category {
                    Text(category.name)
                        .font(.font(12, .regular))
                        .foregroundColor(.neutral(.cool, .shade900))
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let classProgram = classProgram {
                IconTitleSwiftUI(icon: UIImage(named: "ic_v2_class_program")!, title: "\(classProgram)")
            }
            
            if let point = point {
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
            ImageView(url: item.content?.provider?.image ?? "",
                      mode: .fill)
                .frame(width: 24, height: 24)
                .border(Color.neutral(.cool, .shade200), width: 1)
                .cornerRadius(8)
            
            Text(item.content?.provider?.title ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .regular))
        }
    }
    
    var rateView: some View {
        HStack {
            Spacer(minLength: 8)
            HStack(alignment: .center, spacing: 4) {
                Image("ic_star_gray")
                    .resizable()
                    .frame(width: 24, height: 24, alignment: .center)
                
                Text("5.0(3k)")
                    .foregroundColor(.black)
            }
        }
    }
}

struct AllFeedItemV5SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        AllFeedItemV5SwiftUI(item: PathwayMock.learnObject, code: .course)
            .previewLayout(.fixed(width: 266, height: 384))
    }
}
