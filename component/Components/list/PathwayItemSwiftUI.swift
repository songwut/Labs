//
//  PathwayItemSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 8/3/23.
//

import SwiftUI

struct PathwayItemSwiftUI: View {
    @State var item = PathwayMock.pathwayDetail
    
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
                            .background(Color.gray)
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
            Spacer(minLength: 16)
            // Date
            Text(item.getDateText())
                .foregroundColor(.white)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.semantic(.orange))
                .clipShape(Capsule())
                .font(.font(12, .medium))
                
            
            // Title
            Text(item.name)
                .lineLimit(1)
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Price
            HStack {
                Text("฿\(item.discountPrice.withCommas())")
                    .foregroundColor(.black)
                    .font(.font(14, .bold))
                
                
                Text("฿\(item.price.withCommas())")
                    .foregroundColor(.neutral(.cool))
                    .font(.font(12, .regular))
                    .strikethrough()
                    
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            providerView
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                IconTitleSwiftUI(icon: item.typeIcon, title: item.typeName)
                Text("・")
                    .foregroundColor(.neutral(.cool))
                Text(item.category?.name ?? "")
                    .font(.font(12, .regular))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                IconTitleSwiftUI(icon: UIImage(named: "ic_v2_material")!, title: "content_unit".localized())
                Text("・")
                    .foregroundColor(.neutral(.cool))
                Text("4 sections")
                    .font(.font(12, .regular))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            IconTitleSwiftUI(icon: UIImage(named: "pointv5")!, title: "\(item.point)")
            
            //Spacer()
        }
        .padding()
    }
    
    var providerView: some View {
        HStack(spacing: 4) {
            ImageView(url: item.provider?.image ?? "",
                      mode: .fill)
                .frame(width: 24, height: 24)
                .border(Color.neutral(.cool, .shade200), width: 1)
                .cornerRadius(8)
            
            Text(item.provider?.title ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .regular))
        }
    }
}


struct PathwayItemSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        PathwayItemSwiftUI()
            .previewLayout(.fixed(width: 335, height: 435))

    }
}
