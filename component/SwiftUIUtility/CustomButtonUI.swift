//
//  CustomButtonUI.swift
//  flash
//
//  Created by Songwut Maneefun on 10/9/2564 BE.
//

import SwiftUI

struct CustomButtonUI: View {
    var body: some View {
        VStack(spacing: 16) {
            Button("Button 1") {}
            
            Button("ButtonFillAndBorder") {}
                .buttonStyle(
                    ButtonFillAndBorder(backgroundColor: .white, foregroundColor: .green, isDisabled: false, cornerRadius: 16))
            
            Button("Button 2") {}
                .buttonStyle(ButtonFill(color: .red))
            
            Button("Button 3") {}
                .frame(width: 300, height: 42, alignment: .center)
                .buttonStyle(ButtonBorder(color: .red))
            
            Button(action: {}, label: {
                Image("ic_v2_chevron-left")
                    .frame(width: 60, height: 60, alignment: .center)
            
            })
            .frame(width: 60, height: 60, alignment: .center)
            .buttonStyle(ButtonBorderCircle(color: .red, lineWidth: 2))
            
            Button(action: {
                
            }, label: {
                Image("ic_v2_check")
                    .resizable()
                    .frame(width: 18, height: 18, alignment: .center)
                
            })
            .buttonStyle(ButtonBorder(color: UIColor.config_primary().color, cornerRadius: 4))
            
            VStack(content: {
                Text("Placeholder")
                
                Button(action: {
                    
                }, label: {
                    Image("ic_v2_check")
                        .resizable()
                        .padding(.all, 2)
                        .frame(width: 18, height: 18, alignment: .center)
                    
                })
                .buttonStyle(ButtonCheckBox(isChecked: true))
                
                
                Button(action: {
                    
                }, label: {
                    Image("ic_v2_check")
                        .resizable()
                        .padding(.all, 2)
                        .frame(width: 18, height: 18, alignment: .center)
                    
                })
                .buttonStyle(ButtonCheckBox(isChecked: false))
            }).background(Color.gray.opacity(0.3))
            
        }
    }
}

struct ButtonFill: ButtonStyle {
    var color: Color
    var textColor: Color = .white
    var isCapsule: Bool = false
    var cornerRadius: CGFloat = 8
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : textColor)
            .padding()
            .background(
                RoundedRectangle(
                    cornerRadius: cornerRadius,
                    style: .circular
                )
                .fill(color)
            )
    }
}

struct ButtonCapsule: ButtonStyle {
    var color: Color
    var textColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .foregroundColor(configuration.isPressed ? .gray : textColor)
            .clipShape(Capsule())
    }
}

struct ButtonBorder: ButtonStyle {
    var color: Color
    var cornerRadius: CGFloat?
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : color)
            .background(
                RoundedRectangle(
                    cornerRadius: cornerRadius ?? 8,
                    style: .continuous
                ).stroke(color)
            )
    }
}

struct ButtonBorderCircle: ButtonStyle {
    var color: Color
    var lineWidth: CGFloat = 1
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .gray : color)
            .background(
                Circle()
                    .strokeBorder(color, lineWidth: lineWidth)
            )
    }
}

struct ButtonCircle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(color)
            )
    }
}

struct ButtonCheckBox: ButtonStyle {
    
    var isChecked: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.all, 2)
            .foregroundColor(isChecked ? .white : . clear)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(isChecked ? .clear : Color("A9A9A9"), lineWidth: 1)
            )
            .background(
                RoundedRectangle(
                    cornerRadius: 4,
                    style: .continuous
                )
                .fill(isChecked ? UIColor.config_primary().color : Color.white)
            )
    }
}

struct ButtonFillAndBorder: ButtonStyle {
    
    let backgroundColor: Color
    let foregroundColor: Color
    let isDisabled: Bool
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Self.Configuration) -> some View {
        let currentForegroundColor = isDisabled || configuration.isPressed ? foregroundColor.opacity(0.3) : foregroundColor
        return configuration.label
            .padding()
            .foregroundColor(currentForegroundColor)
            .background(isDisabled || configuration.isPressed ? backgroundColor.opacity(0.3) : backgroundColor)
            // This is the key part, we are using both an overlay as well as cornerRadius
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(currentForegroundColor, lineWidth: 1)
        )
    }
}

struct ButtonGradient: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(15.0)
    }
}

struct CustomButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonUI()
            .previewLayout(.fixed(width: 300.0, height: 500))
            .environment(\.sizeCategory, .small)
    }
}
