//
//  SegmentButtonSwiftUI.swift
//  component
//
//  Created by Songwut Maneefun on 22/2/23.
//

import SwiftUI


struct SegmentButtonSwiftUI : View {

    var image: UIImage = UIImage()
    var text : String
    var width: CGFloat
    var color : Color = .white
    var selectColor : Color = .red
    var selectionIndex = 0
    @Binding var selection : Int
    
    var body : some View {
        VStack {
            Button {
                print("selection: \(selection)")
                self.selection = self.selectionIndex
            } label: {
                VStack {
                    HStack {
                        Image(uiImage: image)
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .center)
                        
                        Text(text.localized())
                            .font(.font(16, .regular))
                    }
                }
                .frame(width: width, height: 50)
            }
            .background(selection == selectionIndex ? selectColor : color)
            .foregroundColor(selection == selectionIndex ? color : selectColor)
            .frame(width: width)
            .cornerRadius(16)
//            .buttonStyle(
//                roundedRectangle
//                ButtonFillAndBorder(backgroundColor: selection == selectionIndex ? selectColor : color,
//                                    foregroundColor: selection == selectionIndex ? color : selectColor,
//                                    isDisabled: false, cornerRadius: 16)
//            )
        }
        .frame(width: width)
    }
}

struct SegmentButton_Previews: PreviewProvider {
    
    static var previews: some View {
        HStack(alignment: .center, spacing: 8) {
            SegmentButtonSwiftUI(image: UIImage(named: "ic_v2_panel")!,
                          text: "Overview",
                          width: 150,
                          color: .white,
                          selectColor: .red,
                          selectionIndex: 0,
                          selection: .constant(1))
            .frame(height: 40, alignment: .leading)
            
            SegmentButtonSwiftUI(image: UIImage(named: "ic_v2_pathway")!, text: "Path",
                          width: 150,
                          color: .white,
                          selectColor: .red,
                          selectionIndex: 1,
                          selection: .constant(1))
            .frame(height: 40, alignment: .leading)
        }
        .previewLayout(.fixed(width: 500, height: 60))
        
    }
}
